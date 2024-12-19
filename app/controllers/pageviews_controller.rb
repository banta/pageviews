module PageviewsController
  module ClassMethods
    def track_views(opts = {})
      before_action { |c| c.track_views_filter(opts[:actions], opts[:unique]) }
    end
  end

  module InstanceMethods
    def track_views_filter(actions = nil, unique_opts = nil)
      return if bypass_tracking?

      actions = Array(actions).map(&:to_s)
      if (actions.blank? || actions.include?(action_name)) && unique?(unique_opts)
        Pageview.create(create_pageview_params)
      end
    end

    private

    def bypass_tracking?
      request.bot? || Pageviews::Bots.bot?(request.user_agent)
    end

    def create_pageview_params
      {
        pageview_type: controller_name.singularize.camelize,
        pageview_id: params[:id],
        controller_name: controller_name,
        action_name: action_name,
        user_id: current_user_id,
        session_hash: request.session.id,
        ip_address: request.remote_ip,
        params: filtered_params,
        referrer: request.referer
      }
    end

    def filtered_params
      params.except(:controller, :action, :id).permit!.to_h
    end

    def current_user_id
      current_user&.id
    end

    def unique?(unique_opts)
      return true if unique_opts.blank?

      conditions = create_pageview_params.slice(*unique_opts)
      !Pageview.exists?(conditions)
    end
  end
end