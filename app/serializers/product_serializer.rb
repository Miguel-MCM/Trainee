class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :documentations_url
  
  has_one :category

  def documentations_url
    if object.documentations.attached?
      array = []
      object.documentations.each do |documentation|
        array.append(Rails.application.routes.url_helpers.rails_blob_path(documentation, only_path: true))
      end
    end
    array
  end
end
