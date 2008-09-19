module LighthouseAPISpecHelper

  def mock_project
  
    mock( 'LighthouseAPIProject', 
      :name => 'Test Project',
      :open_tickets_count => 4,
      :milestones => mock_milestones.sort_by { rand },
      :tickets => mock_tickets.sort_by { rand }
    )
  
  end
  
  def mock_users
    users = []
    users << mock( 'User', :lighthouse_id => 1, :name => 'Tom' )
    users << mock( 'User', :lighthouse_id => 2, :name => 'Dick' )
    users << mock( 'User', :lighthouse_id => 3, :name => 'Harry' )
    users.sort_by { rand }
  end
  
  
  def mock_milestones
    milestones = []
    for i in 1..5 do
      milestones << mock( 'Milestone', 
        :title => "Milestone #{i}", 
        :due_on => ( i == 5 ? nil : Time.now + i.weeks ),
        :index => ( i - 1 ),
        :id => i )
    end
    milestones.sort_by { rand }
  end
  
  def mock_tickets 
    tickets = []
    # Open tickets, first 2 are parsable, 1.5 days estimated
    for i in 1..4 do
      tickets << mock( 'Ticket',
        :title => "Ticket #{i} #{ i > 2 ? '' : "EST:#{i*0.5}d" }",
        :state => "open",
        :assigned_user_id => ( i > 3 ? nil : i ),
        :number => i * 10,
        :milestone_index => 0
      )
    end
    # Resolved tickets, last two are parsable, 3.5 days estimated, 5.5 days actual
    for i in 1..4 do
      tickets << mock( 'Ticket',
        :title => "A ticket #{i+4} #{ i < 3 ? '' : "EST:#{i*0.5}d ACT:#{(i*0.5)+1}d" }",
        :state => 'resolved',
        :assigned_user_id => ( i > 3 ? nil : i ),
        :number => i + 4 * 10,
        :milestone_index => 0
      )
    end
    tickets.sort_by { rand }
  end
 
end