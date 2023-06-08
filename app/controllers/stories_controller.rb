class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @chapter

    else
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to @chapter
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  private

  def authorize_user!
    unless current_user == @story.user || current_user.admin?
      redirect_to root_path, alert: 'You do not have permission to perform this action.'
    end
  end

  def story_params
    params.require(:story).permit(:title, :content, photos: [])
  end
end
