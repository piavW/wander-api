class Trails::IndexSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :intensity, :duration, :location, :extra, :image

  def image
    if Rails.env.test?
      rails_blob_url(object.image, only_path: :true)
    else
      object.image.service_url(expires_in: 1.hours, disposition: 'inline')
    end
  end
end