class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_attachment :image

  def rating_by(user)
    ratings.where(user: user).first_or_create
  end

  def total_rating
    ratings.pluck(:value).inject(:+)
  end

  def vote_up(user)
    rating_by(user).update_attributes(value: 1)
  end

  def vote_down(user)
    rating_by(user).update_attributes(value: -1)
  end
end
