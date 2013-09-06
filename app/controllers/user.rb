# GET ===========================

get '/user/:id' do
  @made_survey = current_user.created_surveys
  @untaken_surveys = Survey.all - current_user.taken_surveys
  erb :user_profile
end

# POST ==========================
