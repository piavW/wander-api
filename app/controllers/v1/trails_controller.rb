class V1::TrailsController < ApplicationController
  def index 
    trails = Trail.all
    if trails.empty?
      render_error_message('No trails here, turn around.', 400)
    else
      render json: trails, each_serializer: Trails::IndexSerializer
    end
  end

  def create
    @trail = Trail.create(trail_params)
 
    if @trail.persisted?
      attach_image
      if @trail.persisted? && @trail.image.attached?
        render json: {message: 'Trail was successfully created'}
      else
        render_error_message('Image attachment was unsuccessful', 400)
      end
    elsif (@trail.title).length < 5 || (@trail.description).length < 15
      render_error_message('Please add more content', 400)
    else
      render_error_message('Please add content to all fields', 400)
    end
  end 

  def show
    if Trail.exists?(id: params[:id])
      trail = Trail.find(params[:id])
      render json: trail, serializer: Trails::IndexSerializer
    else
      render_error_message('There is no trail here go back.', 400 )
  end
end

  private

  def trail_params
    params.permit(:title, :description, :intensity, :extra, :duration, :location, keys: [:image])
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end

  def attach_image
    if params['image'] && params['image'].present?
      DecodeService.attach_image(params['image'], @trail.image)
    end
  end
end