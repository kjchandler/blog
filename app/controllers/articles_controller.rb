class ArticlesController < ApplicationController

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
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			#we use render here so the @article object
			#is passed back to the new template
			#redirect_to will tell the browser to issue
			#another request
			render 'new'
		end
	end
	
	# the method update is used when you want to update
	# a record that already exists and it accepts a hash 
	# containing the attributes that you want to update.
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
