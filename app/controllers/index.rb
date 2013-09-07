########## GET ROUTES ##########
get '/' do
  erb :index
end

get '/sign-out' do
  session.clear
  redirect to "/"
end

get '/new_question/:id' do
  
  @qid = params[:id]
  puts @qid
  erb :_new_question, :layout => false
end

########## POST ROUTES ##########
post '/sign-in' do
  p params
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @error = "Invalid email or password."
    erb :index
  end
end

post '/sign-up' do
  p params
  @user = User.new(params[:user])
  if @user.save
    puts @user.inspect
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    erb :index
  end
end

