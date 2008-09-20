class Tickets < Application

  def update
    render_then_call( ( h ( params[:title] || '' ) ) ) do 
      #begin
        ticket = Lighthouse::Ticket.find( ( params[:ticket_id] || 0 ).to_i, :params => { :project_id => Merb::Config[:lighthouse]['project_settings']['project_id'].to_i })
        ticket.assigned_user_id = params[:user_id] unless params[:user_id].nil?
        ticket.title = params[:title] unless params[:title].nil?
        ticket.milestone_id = params[:milestone_id] unless params[:milestone_id].nil?
        ticket.save
      #rescue
      #  raise "Ticket details could not be saved to Lighthouse"
      #end
    end
  end

  
end
