module Types
  class ImagesType < Types::BaseObject
    field :type, String, null: false
    field :width, Integer, null: false
    field :height, Integer, null: false
  end
end