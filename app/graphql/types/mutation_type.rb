module Types
  class MutationType < Types::BaseObject

    field :create_favorite, mutation: Mutations::CreateFavorite

  end
end
