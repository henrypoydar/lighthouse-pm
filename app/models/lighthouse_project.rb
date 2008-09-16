# Wraps some of the API functionality so that
# we don't have sorting code and similar behavior 
# living in views
class LighthouseProject
  
  def initialize( api_access_options = {} ) 
    @api_access_options = api_access_options
    @project = []
    authenticate_and_retrieve_project
  end 
  
  %w( name open_tickets_count ).each do |api_method|
    define_method(api_method) { @project.send("#{api_method}") }
  end
  
  def sorted_milestones
    @project.milestones.sort_by { |m| m.due_on || Time.now + 5.years }
  end
  alias_method :milestones,  :sorted_milestones
  
  def tickets_by_milestone( milestone )
    @project.tickets( :q => "milestone:\"#{milestone.title}\"").sort_by { |t| t.title }.sort_by { |t| t.state }
  end
  
private

  def authenticate_and_retrieve_project
    begin
      Lighthouse.account = @api_access_options[:account_name] || ''
      Lighthouse.token = @api_access_options[:api_token] || ''
      @project = Lighthouse::Project.find(  ( @api_access_options[:project_id] || '' ).to_i )
    rescue
      raise "Project details could not be retrieved from Lighthouse using the supplied credentails"
    end
  end

end
