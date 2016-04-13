class PagesController < ApplicationController

    def about
    
    end
    
    
    def home
        # redirect_to aticles if logged in ie don't show the home page. 
        redirect_to articles_path if logged_in? 
    end
    
end
