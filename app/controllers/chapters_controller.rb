class ChaptersController < ApplicationController
  before_action :set_shrine, only: %i[index new create]
  before_action :set_chapter, only: %i[show edit update destroy]

  def index
    @chapters = Chapter.where(shrine_id: params[:shrine_id])
    @orderedchapters = @chapters.order(date_start: :asc)
    @chapter = Chapter.new
    @dob = @shrine.dob
    @dod = @shrine.dod
  end

  def show
    @story = Story.new
    @stories = Story.where(chapter_id: @chapter)
    @shrine = @chapter.shrine
    @orderedstories = @stories.order(created_at: :desc)
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.shrine = @shrine
    if @chapter.save
      redirect_to chapter_path(@chapter)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to chapter_path(@chapter), notice: "#{@chapter.title} was successfully updated.", status: :see_other
    else
      render :edit
    end
  end

  def destroy
    @shrine = @chapter.shrine
    @chapter.destroy
    redirect_to shrine_chapters_path(@shrine), notice: 'This Chapter has been removed.', status: :see_other
  end

  private

  def set_shrine
    @shrine = Shrine.find(params[:shrine_id])
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :date_start, :date_end, :shrine_id, :photo, :description)
  end

  def story_params
    params.require(:story).permit(:title, :body, photos: [])
  end

  def user_params
    params.require(:user).permit(:first_name, :family_name)
  end
end
