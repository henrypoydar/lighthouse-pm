class Tickets < Application

  def update
    render_then_call( h params[:value] ) do 
      begin
        #Lighthouse.account = Merb::Config[:lighthouse]['project_settings']['account_name']
        #Lighthouse.token = Merb::Config[:lighthouse]['project_settings']['api_token']
        ticket = Lighthouse::Ticket.find( ( params[:ticket_id] || 0 ).to_i, :params => { :project_id => Merb::Config[:lighthouse]['project_settings']['project_id'].to_i })
        ticket.title = h ( params[:value] || '' )
        ticket.save
      rescue
        raise "Ticket details could not be saved to from Lighthouse"
      end
    end
  end

  
end
