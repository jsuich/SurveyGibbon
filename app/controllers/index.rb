get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/user' do
  p params[:user]
  if User.find_by_email(params[:user][:email])
    @user = User.find_by_email(params[:user][:email]) 
  else 
    @user = User.create(params[:user])
  end
  
  redirect("/user/#{@user.id}")
end


get '/user/:id' do
  @user = User.find_by_id(params[:id])

  erb :user 
end


get '/user/:id/create_survey' do
  @user = User.find_by_id(params[:id])  

  erb :create_survey
end
