# Users controller, write in all 7 restful routes

# show all users
# get '/users' do
  
# end

# return user registration page
get '/users/new' do
  @user = User.new
  erb :'/users/new'  
end

# create new user
post '/users' do
  p "REGISTER" * 100
  p params
  @user = User.new(params[:user])
  if @user.save
    set_user(@user)
    redirect "/potlucks"
  else
    erb :'/users/new'
  end
end

# display the profile page for a specific user
get '/users/:id' do
  erb :'/users/show'
end