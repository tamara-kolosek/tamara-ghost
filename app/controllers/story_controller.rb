class StoryController < ApplicationController

	include Pundit

	def new 
		@story = Story.new
	end

	def show 
		@story = StoryDecorator.find(params[:id]).decorate
	end

	def create
		@story = Story.new(story_params)
		update_params
		redirect_to story_index_path
	end

	def update 
		@story = Story.find(params[:id])
		@story.content_changed(story_params[:content])
		@story.update(story_params)
		@story.update_part_of_the_content
		@story.save
	end

	def destroy
		@story = Story.find(params[:id])
		@story.destroy
		redirect_to story_index_path
	end

	def index 
		if params[:tag]
			@stories = Story.tagged_with(params[:tag])
		else
			@stories = Story.all.order(created_at: :desc)
		end
		if params[:search]
			@stories = @stories.search(params[:search])
		end
	end

	def update_params 
		@story.user_id = current_user.id
		@story.part_of_the_content = @story.content[0..40]
		@story.save
	end

	def add_tags 
		@story = Story.find(params[:id])
		respond_to do |format|
		  format.html
		  format.js
		end
	end

	def story_params 
		params.require(:story).permit(:title, :part_of_the_content, :user_id, :content, :tag_list)
	end

end
