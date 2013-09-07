# GET ===============================

get "/survey/create" do 
  erb :create_survey
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])

  erb :take_survey
end

get '/survey/:survey_id/results' do
  @survey_id = params[:survey_id]
end

# POST ==============================

post '/survey/create' do
  p params
  @survey = Survey.create(params[:survey])
  @question = Question.create(:question => params[:question][:question_1])
  @choice_one = Choice.create(:choice => params[:choice][:choice_1])
  @choice_two = Choice.create(:choice => params[:choice][:choice_2])
  @choice_three = Choice.create(:choice => params[:choice][:choice_3])
  @survey.questions << @question
  @question.choices << @choice_one
  @question.choices << @choice_two
  @question.choices << @choice_three
  
  redirect to "/survey/#{@survey.id}"
end

post "/survey/submit" do
  p params
  @response = Response.create(:taker_id => current_user.id, :choice_id => params[:question])
  survey_id = params[:survey_id]
  # "hello Nick"
  redirect to "/survey/#{survey_id}/results"
end
