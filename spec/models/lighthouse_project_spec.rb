require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe LighthouseProject do

  include LighthouseAPISpecHelper
  
  before(:each) do

    # This should be a stub instead but I can't get the syntax right
    class LightHouseProjectAuthenticated < LighthouseProject
      def authenticate_and_retrieve_project 
        true
      end
    end
    @lighthouse_project = LightHouseProjectAuthenticated.new
    @lighthouse_project.instance_variable_set( :@project, mock_project )
  end
  
  it "should provide basic project information" do
    @lighthouse_project.name.should == 'Test Project'
    @lighthouse_project.open_tickets_count.should == 4
  end
  
  describe '#milestones' do
    it "should provide an ordered list of milestones by date with nil dates last" do
      @lighthouse_project.milestones.last.title.should == 'Milestone 5'
    end
  end

  describe '#tickets_by_milestone' do
    
    it "should provide a list of tickets for each milestone ordered by state then by name"
    
    it "should add a flag to each open ticket that can't be parsed for an estimated time"
    
    it "should add a flag to each closed ticket that can't be parsed for both estimated and actual times"
    
  end
  
  describe '#time_totals_by_milestone' do
    
    it "should provide a hash of estimated and actual totals for tickets by milestone"

  end

  describe '#time_totals' do
    
    it "should provide a hash of estimated and actual totals"
    
  end

end

