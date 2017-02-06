
# display list of all potlucks
get '/potlucks' do
  @potlucks = Potluck.all
  erb :'/potlucks/index'
end

# return form to create a new potluck
get '/potlucks/new' do
  erb :'/potlucks/new'
end

# create new potluck
post '/potlucks' do
  # p params[:potluck]
  # params.inspect
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

# display form for editing a potluck
get '/potlucks/:id/edit' do
  @potluck = Potluck.find_by(id: params[:id])
  if current_user == @potluck.host
    erb :'/potlucks/edit'
  else
    redirect "/potlucks/#{params[:id]}"
  end
end

# edit a potluck
put '/potlucks/:id' do
  p params
  @potluck = Potluck.find_by(id: params[:id])
  if current_user == @potluck.host
    @potluck.update_attributes(params[:potluck])
    if @potluck.valid?
      erb :'/potlucks/show'
    else
      @errors = @potluck.errors.full_messages
      erb :'/potlucks/edit'
    end
  else
    redirect "/potlucks/#{params[:id]}"
  end
end

# delete a potluck
# delete '/potlucks/:id' do

# end