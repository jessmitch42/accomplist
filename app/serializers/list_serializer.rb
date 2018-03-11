class ListSerializer < ActiveModel::Serializer
  attributes :id, :total_points, :user_id, :date
end
