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

get '/survey/:survey_id/charts' do
  send_hash = {}
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  
  q_to_c_hash = {}
  @questions.each do |q|
    q_to_c_hash[q.question] = q.choice_counts
  end

  send_hash = { :choices =>  q_to_c_hash }
  puts send_hash
  send_hash.to_json

end

# POST ==============================

post '/survey/create' do
  puts params[:image][:filename]
  @survey = Survey.new(params[:survey])
  @survey.creator_id = current_user.id
  @survey.photo_url = params[:image]
  puts @survey.photo_url
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
