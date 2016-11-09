class PitchesController < ApplicationController
  before_action :set_story, only: [:new, :create]

  def index
    @pitches = Pitch.order(created_at: :desc).first(25)
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = current_user.pitches.new(pitch_params)
    if @pitch.save
      redirect_to story_pitch_path(params[:story_id], @pitch.id)
    else
      flash.now[:error] = @pitch.errors.full_messages
      render :new
    end
  end

  def show
    @pitch = Pitch.find(params[:id])
    @comment = Comment.new
  end

  private
    def pitch_params
      story = Story.find(params[:story_id])
      {headline:  story.title,
       story_url: story.url,
       abstract:  story.abstract,
       body:      params[:pitch][:body],
       story_id:  story.id,
       ups:       1,
       downs:     0}
    end

    def set_story
      @story = Story.find(params[:story_id])
    end
end
