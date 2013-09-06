get '/' do
  erb :index
end

post '/sign-in' do
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Invalid email or password."
    erb :sign_in
  end
end

get '/sign-out' do
  session.clear
  redirect to "/"
end


post '/sign-up' do
  @user = User.new params[:user]
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :sign_up
  end
end
