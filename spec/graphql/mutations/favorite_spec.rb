require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateFavorite, type: :request do
        describe '.resolve' do
          it 'creates a favorite' do

            def query
              <<~GQL
              mutation {
                createFavorite(input: {
                  albumId: 33990,
                  title: "The Payback",
                  artists: "James Brown",
                  year: 1973,
                  genres: "Funk / Soul",
                  coverImage: "https://img.discogs.com/MUELn9ObTL-ZpxyUgF5M9D_Kumc=/fit-in/600x591/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-719877-1247870750.jpeg.jpg",
                  tracklist: "tracklist",
                  uri: "uri"
                }) {
                  favorite {
                    albumId
                    title
                    artists
                    year
                    genres
                    tracklist
                    uri
                  }
                  errors
                }
              }
              GQL
            end

            expect(Favorite.count).to eq(0)

            post '/graphql', params: { query: query }

            expect(Favorite.count).to eq(1)
          end

        it 'returns a favorite' do

          def query
            <<~GQL
            mutation {
              createFavorite(input: {
                albumId: 33990,
                title: "The Payback",
                artists: "James Brown",
                year: 1973,
                genres: "Funk / Soul",
                coverImage: "https://img.discogs.com/MUELn9ObTL-ZpxyUgF5M9D_Kumc=/fit-in/600x591/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-719877-1247870750.jpeg.jpg",
                tracklist: "tracklist",
                uri: "uri"
              }) {
                favorite {
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
                errors
              }
            }
            GQL
          end

          post '/graphql', params: { query: query }

          json = JSON.parse(response.body)

          expect(json).to be_a(Hash)
          expect(json.keys).to match_array(["data"])
          expect(json["data"].keys).to match_array(["createFavorite"])
          expect(json["data"]).to be_a(Hash)
          expect(json["data"]["createFavorite"].keys).to match_array(["favorite", "errors"])
          expect(json["data"]["createFavorite"]["favorite"].keys).to match_array(["id", "albumId", "title", "artists", "year", "genres", "coverImage", "tracklist", "uri"])
          expect(json["data"]["createFavorite"]["favorite"]["id"]).to be_a(String)
          expect(json["data"]["createFavorite"]["favorite"]["albumId"]).to be_an(Integer)
          expect(json["data"]["createFavorite"]["favorite"]["title"]).to be_a(String)
          expect(json["data"]["createFavorite"]["favorite"]["artists"]).to be_a(String)
          expect(json["data"]["createFavorite"]["favorite"]["year"]).to be_an(Integer)
          expect(json["data"]["createFavorite"]["favorite"]["genres"]).to be_a(String)
          expect(json["data"]["createFavorite"]["favorite"]["coverImage"]).to be_a(String)
          expect(json["data"]["createFavorite"]["favorite"]["tracklist"]).to be_a(String)
          expect(json["data"]["createFavorite"]["favorite"]["uri"]).to be_a(String)
          expect(json["data"]["createFavorite"]["errors"]).to be_an(Array)
        end
      end
    end
  end
end
