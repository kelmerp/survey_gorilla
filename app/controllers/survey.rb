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
  # puts params.inspect

  # {"survey"=>{"title"=>"this is the title"}, "question"=>{"question_1"=>"this is\
  #  question 1", "question_2"=>"this is question 2"}, "question_1"=>{"choice_1"=>"\
  #  this is question 1, choice 1", "choice_2"=>"this is question 1, choice 2",
  #   "choice_3"=>"this is question 1, choice 3"}, "question_2"=>{"choice_1"=>"\
  #     this is question 2, choice 1", "choice_2"=>"this is question 2, choice 2"}}

  @survey = Survey.create(params[:survey])
  question_id_array = []
  params.each do |key, value|
    if key[-1] == "n"
      # puts key
      # puts value
      # puts value.class
      value.each do |question_key,question_value|
        # puts question_key
        # puts question_value
        @new_question = Question.create(:question => question_value)
        @survey.questions << @new_question
        params[question_key]
        params[question_key].each do |choice_key,choice_value|
          # puts choice_key
          @new_choice = Choice.new(:choice => choice_value)
          @new_question.choices << @new_choice
        # question_id_array  << @new_question.id
        end
      end
    end 
    # if  key[0..8] == "question_"
    #   value.each do |k,v|
    #     @new_choice = Choice.create(:choice => v)
    #     puts k
    #     puts v
    #   end
    # end
  end

  # question_id_array.size.times do |index|

  #   if key[0..8] == "question_"

  #     # question_array << key
  #     # question_array << value
  #   end
  # end

  puts question_id_array


    # @question = Question.create(:question => params[:question][:question_1])
    # @choice_one = Choice.create(:choice => params[:choice][:choice_1])
    # @choice_two = Choice.create(:choice => params[:choice][:choice_2])
    # @choice_three = Choice.create(:choice => params[:choice][:choice_3])
    # @survey.questions << @question
    # @question.choices << @choice_one
    # @question.choices << @choice_two
    # @question.choices << @choice_three

  # redirect to "/survey/#{@survey.id}"
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
