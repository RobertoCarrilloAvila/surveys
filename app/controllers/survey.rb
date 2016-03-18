
before '/survey*' do
  redirect to '/login' if session[:user]==nil
end

get '/survey/:user/new' do
  @survey_name = params[:name]
  erb :new_survey
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

