require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Projects, "routing" do 
  it "routes GET to / to projects#show" do 
    request_to("/", :get). 
      should route_to(Projects, :show) 
  end 
end

describe Projects, "#show" do
  
  it "fetches the project collection object and renders the page" do 
    @project = mock( LighthouseProject, :sorted_project => [] ).sorted_project
    dispatch_to(Projects, :show) do |controller| 
      controller.stub!(:render) 
    end 
  end
  
end