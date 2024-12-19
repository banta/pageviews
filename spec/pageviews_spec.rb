require 'spec_helper'

# spec/pageviews_spec.rb

require 'spec_helper'

RSpec.describe 'Pageviews' do
  it 'has a version number' do
    expect(Pageviews::VERSION).not_to be nil
  end

  it 'responds to acts_as_pageviews' do
    expect(ActiveRecord::Base).to respond_to(:acts_as_pageviews)
  end
end
