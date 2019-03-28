class StaffContent::Journalist::ArticlesController < ApplicationController
	before_action :check_staff_auth

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def show
	end

	def create
		category = Category.where(name: params[:category].downcase).first

		@article = Article.new(category: category, status: params[:status].downcase, title: params[:title], content: params[:content])

		if @article.save
				redirect_to staff_content_articles_path, notice: 'Article was successfully created.'
		else
				redirect_to staff_content_articles_path, alert: 'You have to fill out all the fields.'
		end
	end

	private

	def check_staff_auth
		if user_signed_in? && (current_user.role == "journalist")
			staff_content_journalist_articles_path
			elsif user_signed_in? && (current_user.role == "editor")
				staff_content_editor_articles_path
			else
			redirect_to root_path
		end
	end
end