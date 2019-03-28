class ArticlesController < ApplicationController
	def index
		if request.location
			city = request.location.city
			@articles_by_category = Article.where(city: [city, nil]).group_by(&:category)
		else
			@articles_by_category = Article.where(city: nil).group_by(&:category)
		end

		@categories = Category.all
	end

	def create
	end

	def show
		@article = Article.find(params[:id])
	end
end