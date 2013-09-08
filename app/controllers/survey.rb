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
  @survey = Survey.new(params[:survey])
  @survey.creator_id = current_user.id
  @survey.save!
  question_id_array = []
  params.each do |key, value|
    if key[-1] == "n"
      value.each do |question_key,question_value|
        @new_question = Question.create!(:question => question_value,
         :survey_id => @survey.id)
        params[question_key].each do |choice_key,choice_value|
          @new_choice = Choice.create!(:choice => choice_value,
           :question_id => @new_question.id)
        end
      end
    end 
  end
  redirect to "/survey/#{@survey.id}"
end

post "/survey/submit" do
  survey_id = params[:survey_id]
  new_session = Session.create(:survey_id => survey_id, :taker_id => current_user.id)
  
  params[:question].each do |key,value|
    @taker_response = Response.new(:taker_id => current_user.id, :choice_id => value.to_i)
    @taker_response.save
  end


  redirect to "/survey/#{survey_id}/results"
end
