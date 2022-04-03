#               MVC
#
#               Model
#              /     \
#             /       \  
#         View ------- Controller
#

helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end



get '/' do
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)
end


get '/signup' do        #if a user navigates to the path "/signup",
    @user = User.new    #setup empty @user.object
    erb(:signup)        #render "app/views/signup.erb"
end


#create the user
post '/signup' do
    #grab user input values from params hash and assign to variables
    email = params[:email]
    avatar_url = params[:avatar_url]
    username = params[:username]
    password = params[:password]

    #instantiate the user class. We get an object.
    @user = User.new ({ email: email, avatar_url: avatar_url, username: username, password: password})

    # if user validations pass and user is saved. ActiveRecord creates a record in the db
    if @user.save
        redirect to ('/login')
        
    else
        erb(:signup)
    end

end

get '/login' do          #when a GET request comes into /login
    erb(:login)         #render app/views/login.erb
end

post '/login' do         #when we submit a form with an action of /login
    #params.to_s         #just play the params for now to make sure it's working

    username = params[:username]
    password = params[:password]

    #1. find user by usernamee

    @user = User.find_by(username: username)

    #2 if that user exists and check if that user's password in db matches password input
    if @user && @user.password == password
        
        session[:user_id] = @user.id
        redirect to ('/')

        #3. if maasswords match, login
        
           # "Success! User with id #{session[:user_id]} is logged in!"
        else
            @error_message = "Login Failed!"
            erb(:login)
        end 
    
end

get '/logout' do
    session[:user_id] = nil
    redirect to ('/')
    #"Logout Successful"
end

get '/finstagram_posts/new' do
    @finstagram_post = FinstagramPost.new
    erb(:"finstagram_posts/new")
  end

post '/finstagram_posts' do
    photo_url = params[:photo_url]

  # instantiate new FinstagramPost
  @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  # if @post validates, save
  if @finstagram_post.save
    redirect(to('/'))
  else

    erb(:"finstagram_posts/new")
  end
end

get '/finstagram_posts/:id' do
    @finstagram_post = FinstagramPost.find(params[:id])   # find the finstagram post with the ID from the URL
    erb(:"finstagram_posts/show")      # print to the screen for now
  end