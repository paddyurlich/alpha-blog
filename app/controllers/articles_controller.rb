class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]

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
        # @article = Article.find(params[:id]) ==> used private method instead "set_article", in before_action
         
        #temporaryily hardcode a user
        @article.user = User.first      
        
    end
    
    def update
        #@article = Article.find(params[:id]) ==> used private method instead "set_article", in before_action
    
        #temporaryily hardcode a user
        @article.user = User.first
        
        @article = Article.new()
        
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
        # debugger
        
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        
        #temporaryily hardcode a user
        @article.user = User.first
        
        if @article.save
            flash[:success] = "Article was successfully created"
            #note: flash message code added to partial, _messages.html.erb then rendered in application.html.erb 
            redirect_to article_path(@article)
        else
            render'new'
        end
    end
    
    
    
private

    #set the article - used to the before_action at the top. 
    def set_article
        @article = Article.find(params[:id])
    end

    #white list
    def article_params
       params.require(:article).permit(:title, :description)
    end
end

    