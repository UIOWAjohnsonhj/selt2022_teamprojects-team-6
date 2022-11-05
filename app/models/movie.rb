class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

class Movie::InvalidKeyError < StandardError ; end
  def self.find_in_tmdb(string)
    begin
      require 'themoviedb'
      Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")
      movie_list = []
      movies = Tmdb::Movie.find(string)
      if movies == nil
        []
      else
        movies.each do |movie|
          hash = Tmdb::Movie.releases(movie.id)["countries"] #access the countries
          list = []
          hash.each { |c| puts list<<c["certification"]}
          common_element = Movie.all_ratings & list # compare the two lists of all_ratings and certification list
          movie_hash = {:tmdb_id=>movie.id, :title=>movie.title, :rating=>common_element.last(), :release_date=>movie.release_date}
          movie_list.append(movie_hash)
        end
        complete_with_rating = []
        movie_list.each do |movie_to_check| #filter list so only those with ratings are posted
          complete_with_rating<<movie_to_check if !movie_to_check[:rating].blank? && !movie_to_check[:release_date].blank?
        end
        complete_with_rating
      end
    rescue Tmdb::InvalidApiKeyError
      raise Movie::InvalidKeyError, 'Invalid API key'
    end
  end

  def self.create_from_tmbd(id)
     m = Tmdb::Movie.detail(id)
     hash = Tmdb::Movie.releases(id)["countries"] #access the countries
     list = []
     hash.each do |c|
       list<<c["certification"]
     end
     common_element = Movie.all_ratings & list # compare the two lists of all_ratings and certification list
     movie_hash = {:title=>m["title"], :rating=>common_element.last(), :description=>m["overview"], :release_date=>m["release_date"]}
     Movie.create!(movie_hash)
  end
end
