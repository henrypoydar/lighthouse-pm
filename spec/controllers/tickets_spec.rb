require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Tickets, "index action" do
  before(:each) do
    dispatch_to(Tickets, :index)
  end
end