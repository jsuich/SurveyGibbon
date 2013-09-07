get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/user/:id' do
  @user = User.find_by_id(params[:id])
  if Survey.all.length > 0
    @surveys = Survey.where(user_id: params[:id])
  end
  erb :user 
end


get '/user/:id/create_survey' do
  @user = User.find_by_id(params[:id])  
  erb :create_survey
end


post '/user' do
  if User.find_by_email(params[:user][:email])
    @user = User.find_by_email(params[:user][:email]) 
  else 
    @user = User.create(params[:user])
  end
  redirect("/user/#{@user.id}")
end


post '/user/:id/build_survey' do
  @user = User.find_by_id(params[:id]) 
  @survey = Survey.create(user_id: params[:id], title: params[:survey][:title])
  @new_arr = []
  params[:survey][:prompts].each do |key,value|  
    @new_arr << Question.create(survey_id: @survey.id, prompt: value)
  end 
  erb :build_survey
end

post '/user/:id/survey/:survey_id' do
  all_responses_id = params[:answers][:question_id]
  all_responses =  params[:answers][:response]
  participant = Participant.create(name: params[:answers][:participant_name], age: params[:answers][:participant_age], gender: params[:answers][:participant_gender]  )
  participation = Participation.create(participant_id: participant.id, survey_id: params[:survey_id])

  @participant = participant
  @response_id_val_arr = []
  all_res = all_responses.merge(all_responses_id) do |key, first, second|
    [second, first]
  end
  questions = []
  all_res.each do |key_response, val_response|
    @response_id_val_arr << Answer.create(participation_id: participation.id, question_id: val_response[0], response: val_response[1] )
    questions << Question.find(val_response[0])
  end

  @complete = questions.zip(all_res)

  erb :results
end
