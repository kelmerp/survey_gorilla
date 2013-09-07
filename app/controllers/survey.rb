# GET ===============================

get "/survey/create" do 
  erb :create_survey
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])

  erb :take_survey
end

# POST ==============================

post '/survey/create' do
  # p params
  @survey = Survey.create(params[:survey])
  @question = Question.create(:question => params[:question_1][:question])
  @choice_one = Choice.create(:choice => params[:choice_1][:choice])
  @choice_two = Choice.create(:choice => params[:choice_2][:choice])
  @choice_three = Choice.create(:choice => params[:choice_3][:choice])
  @survey.questions << @question
  @question.choices << @choice_one
  @question.choices << @choice_two
  @question.choices << @choice_three
  
  redirect to "/survey/#{@survey.id}"
end

post "/survey/submit" do
  p params
  @response = Response.create(:taker_id => current_user.id, :choice_id => params[:])
   
  # redirect to "/survey/#{survey.id}/results"
end
