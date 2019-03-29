class StaffContent::Editor::ArticlesController < ApplicationController
	before_action :check_editor

	def index
			@articles = Article.all
	end

	def show
			@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
			@article = Article.find(params[:id])
			if @article.approved == false
					@article.update_attributes(approved: true)
					redirect_to staff_content_editor_articles_path, notice: 'Article was successfully published.'
			else
					redirect_to staff_content_editor_articles_path, notice: 'Article has already been published.'
			 end
	end

	private

	def check_editor
			if user_signed_in? && current_user.editor?
					true
			else
					redirect_to root_path, notice: 'Permission denied.'
			end
	end
end