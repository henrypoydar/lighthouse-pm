require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe LighthouseProject do

  include LighthouseAPISpecHelper
  
  before(:each) do

    # Probably should be done with stubs ... just wanted to skip API
    # and use mocks and this is the only way I could figure it out for now
    class LighthouseProjectAuthenticated < LighthouseProject
      def authenticate_and_retrieve_project; true; end
      def initialize( mock_project ); @project = mock_project; super; end
    end
    @lighthouse_project = LighthouseProjectAuthenticated.new( mock_project )  
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
    
    it "should provide a list of tickets for each milestone ordered by state then by name" do      
      @lighthouse_project.tickets_by_milestone( @lighthouse_project.milestones.first ).first.title.should == "Ticket 1 EST:0.5d"
      @lighthouse_project.tickets_by_milestone( @lighthouse_project.milestones.first ).last.title.should == "A ticket 8 EST:2.0d ACT:3.0d"
    end
    
    it "should add a flag to each open ticket that can't be parsed for an estimated time" do
      @lighthouse_project.tickets_by_milestone( @lighthouse_project.milestones.first )[2].untimed.should be_true
    end
    
    it "should add a flag to each closed ticket that can't be parsed for both estimated and actual times" do
      @lighthouse_project.tickets_by_milestone( @lighthouse_project.milestones.first )[4].untimed.should be_true
    end
    
  end
  
  describe '#untimed_tickets_by_milestone' do
    
    it "should provide the number of tickets that could not be parsed for time by milestone" do
      @lighthouse_project.untimed_tickets_by_milestone( @lighthouse_project.milestones.first ).should == 4
    end
    
  end
  
  describe '#untimed_tickets' do

    it "should provide the number of tickets that could not be parsed for time" do
      @lighthouse_project.untimed_tickets.should == 20
    end

  end
  
  describe '#open_tickets_by_milestone' do
    
    it "should return the unresolved tickets for a  milestone" do
      @lighthouse_project.open_tickets_by_milestone( @lighthouse_project.milestones.first ).size.should == 4
    end
    
  end
  
  describe '#time_totals_by_milestone' do
    
    it "should provide a hash of estimated and actual totals for tickets by milestone" do
      @lighthouse_project.time_totals_by_milestone( @lighthouse_project.milestones.first )[:open][:estimated].should == 1.5
      @lighthouse_project.time_totals_by_milestone( @lighthouse_project.milestones.first )[:closed][:estimated].should == 3.5
      @lighthouse_project.time_totals_by_milestone( @lighthouse_project.milestones.first )[:closed][:actual].should == 5.5
    end
  
  end
  
  describe '#time_totals' do
    
    it "should provide a hash of estimated and actual totals for all tickets" do
      @lighthouse_project.time_totals[:open][:estimated].should == 1.5 * 5
      @lighthouse_project.time_totals[:closed][:estimated].should == 3.5 * 5
      @lighthouse_project.time_totals[:closed][:actual].should == 5.5 * 5
    end
    
  end
  
  describe '.parse_estimated_time' do
    it "should return a float with the number estimated days, 0.0 if not found" do
      LighthouseProject.parse_estimated_time( "A ticket EST:5d and some other text").should == 5.0
      LighthouseProject.parse_estimated_time( "A ticket EST:.5d and some other text").should == 0.5
      LighthouseProject.parse_estimated_time( "A ticket EST:3.5d and some other text").should == 3.5
      LighthouseProject.parse_estimated_time( "A ticket and some other text").should == 0.0
    end
  end
  
  describe '.parse_actual_time' do
    it "should return a float with the number actual days, 0.0 if not found" do
      LighthouseProject.parse_actual_time( "A ticket ACT:5d and some other text").should == 5.0
      LighthouseProject.parse_actual_time( "A ticket ACT:.5d and some other text").should == 0.5
      LighthouseProject.parse_actual_time( "A ticket ACT:3.5d and some other text").should == 3.5
      LighthouseProject.parse_actual_time( "A ticket and some other text").should == 0.0
    end
  end

end

