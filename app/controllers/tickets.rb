class Tickets < Application

  def update
    render_then_call( h params[:value] ) do 
      #TODO: API call here
    end
  end

  
end
