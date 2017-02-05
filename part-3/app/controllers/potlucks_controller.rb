
# display list of all potlucks
get '/potlucks' do
  
end

# return form to create a new potluck
get '/potlucks/new' do
  
end

# create new potluck
post '/potlucks' do
  p params[:potluck]
  params.inspect
  @potluck = Potluck.new(params[:potluck])
  if logged_in?
    if @potluck.save
      redirect "/potlucks/#{@potluck.id}"
    else
      @errors = @potlucks.errors.full_messages
      erb :'/potlucks/new'
    end
  else
    redirect '/potlucks'
  end
end

# display a specific potluck
get '/potlucks/:id' do
  @potluck = Potluck.find_by(id: params[:id])
  # p "x" * 150
  # p @potluck
  erb :'/potlucks/show'
end

# # display form for editing a potluck
# get '/potlucks/:id/edit' do

# end

# # edit a potluck
# put '/potlucks/:id' do

# end

# delete a potluck
# delete '/potlucks/:id' do

# end