class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        # remember the pagination gem
        # before paginatin this was :
        # @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end
    
    def edit
        #@article = Article.find(params[:id]) ==> used private method instead "set_article", in before_action
         
        #temporaryily hardcode a user
        #@article.user = User.first
        #no need to define an article now as this is defined in the set_article before_action
        
        
    end
    
    def update
        #@article = Article.find(params[:id]) ==> used private method instead "set_article", in before_action
    
        #temporaryily hardcode a user
        #@article.user = User.first
        #@article.user = current_user

        
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def show
     #@article = Article.find(params[:id]) ==> used private method instead "set_article", in before_action
    end

    def destroy
        #@article = Article.find(params[:id]) ==> used private method instead "set_article", in before_action
        
        @article.destroy
        flash[:danger] = "Article was successfully deleted"
        redirect_to articles_path
    end

    def create
        
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        
        #temporaryily hardcode a user
        #@article.user = User.first
        
        @article.user = current_user
        
        
        if @article.save
            flash[:success] = "Article was successfully created"
            #note: flash message code added to partial, _messages.html.erb then rendered in application.html.erb 
            redirect_to article_path(@article)
        else
            render'new'
        end
    end
    
    
    
private
    #set the article - used in the before_action at the top. 
    def set_article
        @article = Article.find(params[:id])
    end

    #white list
    def article_params
       params.require(:article).permit(:title, :description)
    end
    
    
    def require_same_user
        if current_user != @article.user
            flash[:danger] = "You can only edit of delete your own article"
            redirect_to articles_path
        end
    end
    

    
    
    
    
end

    