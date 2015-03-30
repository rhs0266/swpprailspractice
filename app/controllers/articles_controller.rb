class ArticlesController < ApplicationController
    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def edit
        @article=Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    def create
        @article = Article.new(article_params)
        # Initialize new model with filtered parameter.
        if @article.save
            # Store the model to DB
            # Returns success or failure as a boolean value
            redirect_to @article
            # Redirect automatically to 'show' action, defined later.
        else
            render 'new'
        end
    end

    private
    def article_params
        params.require(:article).permit(:title, :text)
        # Whitelist our controller parameters to prevent wrongful mass assignment
    end
end
