class ChaptersController < ApplicationController
  before_action :set_shrine, only: %i[index new create]
  before_action :set_chapter, only: %i[show edit update destroy]

  def index
    @chapters = Chapter.all
    @chapter = Chapter.new
    @dob = @shrine.dob
    @dod = @shrine.dod
  end

  def show
    @story = Story.new
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.shrine = @shrine
    if @chapter.save
      redirect_to shrine_chapters_path(@shrine)
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
    params.require(:chapter).permit(:title, :photo, :date_start, :date_end, :shrine_id)
  end
end
