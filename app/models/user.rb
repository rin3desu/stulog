class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :comments, dependent: :destroy
  has_many :study_records, dependent: :nullify
  has_many :study_record_likes, dependent: :destroy
  has_many :study_record_comments, dependent: :destroy

  has_many :follows_as_follower, class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy
  has_many :follows_as_followed, class_name: 'Follow', foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :follows_as_follower, source: :followed
  has_many :followers, through: :follows_as_followed, source: :follower

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  has_one_attached :image

  def already_liked?(tweet)
    likes.exists?(tweet_id: tweet.id)
  end

  def following?(user)
    following.include?(user)
  end
end
