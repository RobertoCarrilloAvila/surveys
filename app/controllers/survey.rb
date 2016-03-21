
before '/survey*' do
  redirect to '/login' if session[:user]==nil
end

get '/survey/:user/new' do
  @survey_name = params[:name]
  @user = session[:user]
  puts "survey_name: #{@survey_name}"
  session[:user].authored_surveys << Survey.create(title: @survey_name)
  erb :new_survey
end


post '/survey/new/question' do
  user = session[:user]
  last_survey = user.authored_surveys.last
  new_question = Question.create(description: params[:title])
  n_options = params[:n_options]
  n_options.to_i.times do |num|
    new_question.options << Option.create(description: params["opc#{num}".to_sym])
  end
  puts "*"*30
  last_survey.questions << new_question
  puts params.inspect
end


get '/survey/id' do
  @survey = Survey.find_by(id: params[:id])
  erb :survey_id
end

get '/survey/options' do
  @survey = Survey.find_by(id: params[:id])
  @participations = @survey.participations.sort{|x, y| x.user_id <=> y.user_id}
  erb :index_answers
end

