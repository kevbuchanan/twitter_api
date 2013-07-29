get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:user' do
  @user = User.find_by_user_name(params[:user])

  erb :user
end

post '/:user' do
  @user = User.find_or_create_by_user_name(params[:user])
  redirect to("/#{@user.user_name}")
end
