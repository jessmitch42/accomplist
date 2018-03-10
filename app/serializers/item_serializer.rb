class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :points, :list_id, :tags
end
