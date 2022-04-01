class Api::V1::ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :update, :destroy]

    # GET /api/v1/articles
    def index
        @articles = Article.all
        render json: @articles
    end

    # GET /api/v1/articles/:id
    def show
        render json: @article
    end

    # POST /api/v1/articles
    def create
        @article = Article.new(article_params)
        if @article.save
            render json: @article
        else
            render error: { error: 'Unable to create Article!' }, status: 400
        end
    end

    # PATCH/PUT /api/v1/articles/:id
    def update
        if @article
            @article.update(article_params)
            render json: { message: 'Article Successfully Updated!' }, status: 200
        else
            render json: { message: 'Unable to update Article' }, status: 400
        end
    end

    # DELETE /api/v1/articles/:id
    def destroy
        if @article
            @article.destroy
            render json: { message: "Article successfully deleted! "}, status: 200
        else
            render json: { message: "Unable to delete Article! " }, status: 400
        end
    end

    # GET	/api/v1/search
    # To seach article by title
    def search
        @article = Article.find_by(title: params[:title])
        if @article
            @articles = Article.where(title: @article.title)
            render json: @articles
        else
            render json: { message: "Unable to find Article! " }, status: 400
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def find_article 
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :body, :release_date, :image)
    end
end
