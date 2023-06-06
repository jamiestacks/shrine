class ChaptersController < ApplicationController
  before_action :set_shrine, only: %i[new create]

  def index
    @chapters = Chapter.all
    @chapter = Chapter.new
  end

  def show
    @story = Story.new
  end

  def new
    @chapter = Chapter.new
    # @shrine = Shrine.find(params[:shrine_id])
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

  private

  def set_shrine
    @shrine = Shrine.find(params[:shrine_id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :date_start, :date_end, :shrine_id)
  end
end
