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
  erb :user
end
