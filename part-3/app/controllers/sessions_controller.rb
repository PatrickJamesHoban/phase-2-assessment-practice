
# display form for user login
get '/sessions/new' do
  erb :'/sessions/new'
end

# log user in and create new session
post '/sessions' do
  # returns false or returns user
  @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
  if @user
    set_user(@user)
    redirect '/potlucks/index'
  else
    @errors = ['Incorrect username or password.']
    erb :'/sessions/new' # Returns user to login page
  end
end

# Logout
delete '/sessions/:id' do
  session.delete(:user_id)
  redirect '/sessions/new'
end
