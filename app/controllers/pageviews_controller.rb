module PageviewsController
  module ClassMethods
    def track_views(opts={})
      before_filter { |c| c.track_views_subapp_filter(opts[:actions], opts[:unique])}
    end
  end

  module InstanceMethods
    def track_views_subapp_filter(actions=nil,unique_opts=nil)
      unless bypass
        actions.collect!{|a|a.to_s} unless actions.blank?
        if (actions.blank? || actions.include?(action_name)) && unique?(unique_opts)
          Pageview.create(direct_create_statement)
        end
      end
    end

    protected

    # creates a statement hash that contains default values for creating an impression via an AR relation.
    def associative_create_statement(query_params={})
      query_params.reverse_merge!(
          :controller_name => controller_name,
          :action_name => action_name,
          :user_id => user_id,
          :session_hash => session_hash,
          :ip_address => request.remote_ip,
          :referrer => request.referer
      )
    end

    private

    def bypass
      Pageviews::Bots.bot?(request.user_agent)
    end

    def unique_instance?(impressionable, unique_opts)
      return unique_opts.blank? || !impressionable.impressions.where(unique_query(unique_opts)).exists?
    end

    def unique?(unique_opts)
      return unique_opts.blank? || !Pageview.where(unique_query(unique_opts)).exists?
    end

    # creates the query to check for uniqueness
    def unique_query(unique_opts)
      full_statement = direct_create_statement
      # reduce the full statement to the params we need for the specified unique options
      unique_opts.reduce({}) do |query, param|
        query[param] = full_statement[param]
        query
      end
    end

    # creates a statment hash that contains default values for creating an impression.
    def direct_create_statement(query_params={})
      query_params.reverse_merge!(
          :pageview_type => controller_name.singularize.camelize,
          :pageview_id=> params[:id]
      )
      associative_create_statement(query_params)
    end

    def session_hash
      request.session_options[:id]
    end

    #use both @current_user and current_user helper
    def user_id
      user_id = @current_user ? @current_user.id : nil rescue nil
      user_id = current_user ? current_user.id : nil rescue nil if user_id.blank?
      user_id
    end
  end
end
