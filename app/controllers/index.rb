########## GET ROUTES ##########
get '/' do
  erb :index
end

get '/sign-out' do
  session.clear
  redirect to "/"
end

########## POST ROUTES ##########
post '/sign-in' do
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    session[:user_id] = user.id
    redirect "/user/#{@user.id}"
  else
    @error = "Invalid email or password."
    erb :index
  end
end

post '/sign-up' do
  @user = User.new params[:user]
  if @user.save
    puts @user.inspect
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    erb :index
  end
end
