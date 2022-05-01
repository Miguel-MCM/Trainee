class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email , :is_admin, :authentication_token, :photo_url

  def photo_url
    if object.photo.attached?
      Rails.application.routes.url_helpers.rails_blob_path(object.photo, only_path: true)
    end
  end
end
