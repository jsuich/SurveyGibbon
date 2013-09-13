get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    @user = User.find_by_id(session[:user_id])
    if Survey.all.length > 0
      @surveys = Survey.where(user_id: session[:user_id])
      @count =  @surveys.map {|val| val.participations.count }
      @total = @surveys.zip(@count)
    end
  end

  erb :index
end

get '/user/:id' do
  @user = User.find_by_id(params[:id])
  session[:user_id] = @user.id
  if Survey.all.length > 0
    @surveys = Survey.where(user_id: params[:id])
    @count =  @surveys.map {|val| val.participations.count }
    @total = @surveys.zip(@count)
  end
  erb :user 
end

get '/user/:id/create_survey' do
  @user = User.find(params[:id])
  letters =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
  @url  =  (0...10).map{ letters[rand(letters.length)] }.join 
  if session[:error]
    @error = session[:error]
  end
  erb :create_surv
end

get '/show_survey/:survey_id/:url' do
  @user = User.find_by_id(session[:user_id])
  @survey = Survey.find(params[:survey_id])
  @new_arr = @survey.questions
  
  erb :show_survey
end

get '/logout' do 
  session.clear
  redirect('/')
end

get '/show_survey/:survey_id/:url/results' do 
  answers = []
  participants = []
  @user = User.find_by_id(session[:user_id])
  @survey = Survey.find(params[:survey_id])
  questions =  Question.where(survey_id: params[:survey_id])
  participations = Participation.where(survey_id: params[:survey_id])
  
  participations.each do |pc|
    participants << Participant.where(id: pc.participant_id)
    answers << Answer.where(participation_id: pc.id)
  end
  
  @a = answers
  @q = questions
  @p = participants

  @tot = @p.zip(@a)
 
  erb :total_results
end



post '/user' do
  if User.find_by_email(params[:user][:email])
    @user ||= User.find_by_email(params[:user][:email]) 
  else
    @user = User.create(params[:user])
  end
  redirect("/user/#{@user.id}")
end

def print_if(params)
  params ? p params : p "N/A"
end


post '/surveys/:url' do
  print_if(session[:user_id])
  print_if(params[:survey][:prompts])
  print_if(params[:radios][:prompts])
  print_if(params[:radios][:prompts])
  print_if(params[:options][:prompts])
  
  if params[:survey][:prompts] || params[:radios][:prompts]
    survey = Survey.create(user_id: session[:user_id], title: params[:survey][:title], url: params[:url])
    params[:survey][:prompts].each do |key,value|  
      Question.create(survey_id: survey.id, prompt: value)
    end
    redirect("/show_survey/#{survey.id}/#{survey.url}")
  else
    session[:error] = "Please add questions to your survey!" 
    redirect("/user/#{session[:user_id]}/create_survey")
  end
end


post '/survey_response/:survey_id' do
  all_responses_id = params[:answers][:question_id]
  all_responses =  params[:answers][:response]
  participant = Participant.create(name: params[:answers][:participant_name], age: params[:answers][:participant_age], gender: params[:answers][:participant_gender]  )
  
  participation = Participation.create(participant_id: participant.id, survey_id: params[:survey_id])

  @participant = participant
  @response_id_val_arr = []
  all_res = all_responses_id.merge(all_responses) do |key, first, second|
    [first, second]
  end
  questions = []
  all_res.each do |key_response, val_response|
    @response_id_val_arr << Answer.create(participation_id: participation.id, question_id: val_response[0], response: val_response[1] )
    questions << Question.find(val_response[0])
  end
  @complete = questions.zip(all_res)
  erb :results
end
