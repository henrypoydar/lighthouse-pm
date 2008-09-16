module LighthouseAPISpecHelper

  def mock_project
  
    mock( 'LighthouseAPIProject', 
      :name => 'Test Project',
      :open_tickets_count => 4,
      :milestones => mock_milestones.sort_by { rand }
    )
  
  end
  
  def mock_milestones
    milestones = []
    for i in 1..5 do
      milestones << mock( 'Milestone', :title => "Milestone #{i}", :due_on => ( i == 5 ? nil : Time.now + i.weeks ) )
    end
    milestones.sort_by { rand }
  end
  
  
 
end