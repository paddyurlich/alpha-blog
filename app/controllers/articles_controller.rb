class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end
    
    def show
     @article = Article.find(params[:id])
    end

    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            #note: flash message code added to application.html.erb 
            redirect_to article_path(@article)
        else
            render'new'
        end
    end
    
private
    #white list
    def article_params
       params.require(:article).permit(:title, :description)
    end
end

    