class Projects < Application


  def show
    @project = LighthouseProject.new(
      :api_token => Merb::Config[:lighthouse]['project_settings']['api_token'], 
      :account_name => Merb::Config[:lighthouse]['project_settings']['account_name'], 
      :project_id => Merb::Config[:lighthouse]['project_settings']['project_id'] )
    render
  end
  

end