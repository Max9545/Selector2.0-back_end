module Types
  class TracklistType < Types::BaseObject
    field :postion, String, null: false   
    field :type_, String, null: false   
    field :title, String, null: false   
    field :duration, String, null: false   
  end
end