get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:user' do
  @user = TwitterUser.find_by_user_name(params[:user])

  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)
  erb :user
end

post '/user' do
  @user = TwitterUser.find_or_create_by_user_name(params[:user])
  redirect to("/#{@user.user_name}")
end
