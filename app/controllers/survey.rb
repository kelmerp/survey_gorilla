# GET ===============================

get "/survey/create" do 
  erb :create_survey
end

get '/survey/:id' do 
  erb :take_survey
end

# POST ==============================

post '/survey/create' do 
  @survey = Survey.create(params[:survey])
  @question = Question.create(params[:question][:question_1])
  @choice_one = Choice.create(params[:choice][:choice_1])
  @choice_two = Choice.create(params[:choice][:choice_2])
  @choice_three = Choice.create(params[:choice][:choice_3])
  @survey.questions << @question
  @question.choices << @choice_one
  @question.choices << @choice_two
  @question.choices << @choice_three
  
  redirect to "/survey/#{@survey.id}"
end

post "/survey/submit" do
   
  redirect to '/survey/:id/results'
end
