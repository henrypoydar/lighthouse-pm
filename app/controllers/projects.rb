class Projects < Application
include Lighthouse

  def show

    Lighthouse.account = Merb::Config[:lighthouse]['project_settings']['account'] 
    Lighthouse.token = Merb::Config[:lighthouse]['project_settings']['api_token'] 
    @project = Lighthouse::Project.find( Merb::Config[:lighthouse]['project_settings']['project_id'].to_i )

    render

  end
  

end
