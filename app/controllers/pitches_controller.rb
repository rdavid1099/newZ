class PitchesController < ApplicationController
  def new
    @pitch = Pitch.new
    @story = Story.find(params[:story_id])
  end

  def create
    pitch = current_user.pitches.new(pitch_params)
    if pitch.save
      redirect_to story_pitch_path(params[:story_id], pitch.id)
    else
      #flash error
      render :new
    end
  end

  def show
    @pitch = Pitch.find(params[:id])
  end

  private
    def pitch_params
      story = Story.find(params[:story_id])
      {headline:  story.title,
       story_url: story.url,
       abstract:  story.abstract,
       body:      params[:pitch][:body],
       story_id:  story.id}
    end
end
