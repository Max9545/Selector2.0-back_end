# require 'rails_helper'
#
# RSpec.describe Favorite, type: :model do
#   it 'create_favorite' do
#     favorite_1 = Favorite.new(
#     album_id: 33990,
#     title: "The Payback",
#     artists: "James Brown",
#     year: 1973,
#     genres: "Funk / Soul",
#     coverImage: "https://img.discogs.com/MUELn9ObTL-ZpxyUgF5M9D_Kumc=/fit-in/600x591/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-719877-1247870750.jpeg.jpg",
#     tracklist: "tracklist",
#     uri: "uri"
#     )
#   end
# end
# require 'rails_helper'
#
# module Mutations
#   RSpec.describe Favorite, type: :request do
#     describe '.resolve' do
#       it 'creates a discount' do
#
#
#
#         # expect do
#           # favorite = create(:client)
#         def query
#           <<~GQL
#             mutation {
#               favorite: createFavorite(
#                 input: {
#                   title: "The Payback"
#                   year: 1973
#                 }
#               )
#             }
#           GQL
#         end
#         post '/graphql', params: { query: query }
#           require "pry"; binding.pry
#       end
#     end
#   end
# end
