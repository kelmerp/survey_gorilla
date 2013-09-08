# GET ===============================

get "/survey/create" do 
  erb :create_survey
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])

  erb :take_survey
end

get '/survey/:survey_id/results' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions

  erb :view_results
end

# POST ==============================

post '/survey/create' do
  puts params.inspect
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
  params[:question].each do |key,value|
    p value
    @taker_response = Response.new(:taker_id => current_user.id, :choice_id => value.to_i)
    @taker_response.save
  end

  survey_id = params[:survey_id]

  redirect to "/survey/#{survey_id}/results"
end
