require 'rails_helper'

module Mutations 
  module Users
    RSpec.describe CreateFavorite, type: :request do
        describe '.resolve' do
          it 'can return all favorites' do
            favorite_1 = Favorite.create(
              album_id: 33990,
              title: "The Payback",
              artists: "James Brown",
              year: 1973,
              genres: "Funk / Soul",
              cover_image: "https://img.discogs.com/MUELn9ObTL-ZpxyUgF5M9D_Kumc=/fit-in/600x591/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-719877-1247870750.jpeg.jpg",
              tracklist: "tracklist",
              uri: "uri"
            )

            favorite_2 = Favorite.create(
              album_id: 11111,
              title: "Back Pay",
              artists: "Brown James",
              year: 1982,
              genres: "Funk / Soul",
              cover_image: "https://img.discogs.com/MUELn9ObTL-ZpxyUgF5M9D_Kumc=/fit-in/600x591/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-719877-1247870750.jpeg.jpg",
              tracklist: "tracklist",
              uri: "uri"
            )

            favorite_3 = Favorite.create(
              album_id: 22222,
              title: "Back Pain",
              artists: "Jojo Brown",
              year: 2001,
              genres: "Funk / Soul",
              cover_image: "https://img.discogs.com/MUELn9ObTL-ZpxyUgF5M9D_Kumc=/fit-in/600x591/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-719877-1247870750.jpeg.jpg",
              tracklist: "tracklist",
              uri: "uri"
            )

            def query
              <<~GQL
              query {
                favorites {
                  id
                  albumId
                  title
                  artists
                  year
                  genres
                  coverImage
                  tracklist
                  uri
                }
              }
              GQL
            end

            post '/graphql', params: { query: query }

            result = SelectorSchema.execute(query).as_json

            expect(result).to be_a(Hash)
            expect(result.keys).to match_array(["data"])

            result["data"]["favorites"].each do |favorite|
              expect(favorite.keys).to match_array(["id", "albumId", "title", "artists", "year", "genres", "coverImage", "tracklist", "uri"])
              expect(favorite["id"]).to be_a(String)
              expect(favorite["albumId"]).to be_an(Integer)
              expect(favorite["title"]).to be_a(String)
              expect(favorite["artists"]).to be_a(String)
              expect(favorite["year"]).to be_an(Integer)
              expect(favorite["genres"]).to be_a(String)
              expect(favorite["coverImage"]).to be_a(String)
              expect(favorite["tracklist"]).to be_a(String)
              expect(favorite["uri"]).to be_a(String)
            end
          end
        end
      end
    end
  end
