class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :set_chapter, only: [:create, :edit, :update, :destroy]

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.chapter_id = @chapter.id
    @story.user = current_user
    if @story.save
      @stories = Story.where(chapter_id: params[:chapter_id])
      redirect_to @chapter
    else
      render "chapters/show", locals: { chapter: @chapter }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to @chapter
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private

  def authorize_user!
    set_chapter
    unless current_user == @story.user || current_user.admin?
      redirect_to root_path, alert: 'You do not have permission to perform this action.'
    end
  end

  def story_params
    params.require(:story).permit(:title, :body, photos: [])
  end

  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end
end
