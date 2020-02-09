class CommentsController < ApplicationController

	before_action :get_article, only: [:create, :destroy]
	before_action :require_login, except: [:create]

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]

		@comment.save

		redirect_to article_path(@comment.article)
	end


	def destroy
		#@comment.author_name = @article.comments(params[:author_name])
		@comment = @article.comments.destroy(params[:id])
		flash.notice = "Comment deleted!"

		redirect_to @article
	end

	def get_article
		@article = Article.find(params[:article_id])
	end

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end



end



