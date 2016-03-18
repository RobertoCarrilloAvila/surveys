
before '/user*' do
  redirect to '/login' if session[:user]==nil
end

get '/user/:user/index' do
  @user = session[:user]
  erb :index
end



get '/user/:user/answers' do
  @user = session[:user]
  erb :index_answers
end