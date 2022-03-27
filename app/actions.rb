#               MVC
#
#               Model
#              /     \
#             /       \  
#         View ------- Controller
#



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
        "User #{username} saved!"

    else
        erb(:signup)
    end

end