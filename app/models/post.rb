class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def rating_by(user)
    ratings.where(user: user).first_or_create
  end
end
