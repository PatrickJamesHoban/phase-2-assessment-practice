
# return form to create a new rsvp
get '/potlucks/:id/rsvps/new' do
  erb :'/rsvps/new'
end

# create new rsvp
post '/potlucks/:id/rsvps' do
  p params[:rsvp]
  params.inspect
  @potluck = Potluck.find_by(id: params[:id])
  @potential_attendee = User.find(session[:user_id])

  p "true" * 100
  p session[:user_id]
  p @potluck.attendees.include?(attendee_id: session[:user_id]) 
  if logged_in?
    if @potluck.attendees.include?(@potential_attendee)
      p "HERE"
    else
      @rsvp = @potluck.rsvps.build(params[:rsvp])
      p "RSVP"
      p @rsvp
      if @rsvp.save
        redirect "/potlucks/#{@potluck.id}"
      else
        @errors = @potluck.errors.full_messages
        erb :'/potlucks/show'
      end
    end
  else
    redirect '/potlucks'
  end
end