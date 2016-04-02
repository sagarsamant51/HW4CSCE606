class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :description, :release_date, :director
  validates :title,:presence=>'true'
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.find_similar_movies(m)
   Movie.find_all_by_director(m.director)
  end
end

