class Api::V1::ArticlesCommentsController < ApplicationController
    before_action :find_articles_comment, only: [:show, :update, :destroy]

    # GET /api/v1/articles_comments
    def index
        @comments = ArticlesComment.all
        render json: @comments
    end

    # GET /api/v1/articles_comments/:id
    def show
        render json: @comment
    end

    # POST /api/v1/articles_comments
    def create
        @comment = ArticlesComment.new(articles_comment_params)
        if @comment.save
            render json: @comment
        else
            render error: { error: 'Unable to add Comment!' }, status: 400
        end
    end
    
    # PATCH/PUT /api/v1/articles_comments/:id
    def update
        if @comment
            @comment.update(articles_comment_params)
            render json: { message: 'Comment Successfully Updated!' }, status: 200
        else
            render json: { message: 'Unable to update Comment' }, status: 400
        end
    end

    # DELETE /api/v1/articles_comments/:id
    def destroy
        if @comment
            @comment.destroy
            render json: { message: "comment successfully deleted! "}, status: 200
        else
            render json: { message: "Unable to delete Comment! " }, status: 400
        end
    end

    # GET /api/v1/comment_search
    # To search articles comment by comment
    def search
        @comment = ArticlesComment.find_by(comment: params[:comment])
        if @comment
            @comments = ArticlesComment.where(comment: @comment.comment)
            render json: @comments
        else
            render json: { message: "Unable to find Comment! " }, status: 400
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def find_articles_comment
        @comment = ArticlesComment.find(params[:id])
    end
    
    def articles_comment_params
        params.require(:articles_comment).permit(:comment, :date_of_comment, :article_id)
    end
end
