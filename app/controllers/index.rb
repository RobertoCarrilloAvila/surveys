
enable :sessions

# before '/' do
# 	#puts "before"
# 	puts session[:user]
# 	redirect to '/' if session[:user]!=nil
# 	redirect to '/login'
# end

get '/' do
	@name = session[:user].name
	erb :index
end


get '/login' do
	erb :login
end

post '/login' do
	email = params[:email]
	pass = params[:pass]
	puts "////////////////////////////////"
	puts email
	puts pass
	user = User.authenticate(email, pass)
	p user
	if user != nil
		session[:user] = user
		redirect to '/'
	else
		redirect to '/login'
	end
end

get '/signin' do
  erb :signin
end

post '/signin' do
	name = params[:name]
	email = params[:email]
	pass = params[:pass]
	user = User.create(name: name, email: email, password: pass)
	p user
	puts user.valid?
	if user.valid?
		redirect to '/login'
	else
		erb :log_error
	end
end

get '/signout' do
	session[:user] = nil
	redirect to '/'
end
