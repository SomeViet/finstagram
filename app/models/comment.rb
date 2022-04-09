class Comment < ActiveRecord::Base

    #associations to a user and post
    belongs_to :user
    belongs_to :finstagram_post
    
    #validation code
    validates_presence_of :text, :user, :finstagram_post

end