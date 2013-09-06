get '/user/:id' do
  @made_survey = current_user.created_surveys
  @untaken_surveys = current_user.untaken_surveys
  erb :user_profile
end
