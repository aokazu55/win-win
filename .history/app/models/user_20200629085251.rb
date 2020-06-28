class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  attachment :image
  has_many :services, dependent: :destroy
  has_many :profiles, dependent: :destroy
  has_many :active_favorites, class_name: "Favorite",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_favorites, class_name: "Favorite",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :following, through: :active_favorites, source: :followed
  has_many :followers, through: :passive_favorites, source: :follower

  has_many :likes, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def user_profiles
    profiles.map(&:profile)
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(name: auth.info.name,
                      email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                 )
    end
    user.save
    user
  end

  def self.find_for_facebook(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(name: auth.info.name,
                      email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                 )
    end
    user.save
    user
  end

  def follow(other_user)
    active_favorites.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_favorites.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM favorites
                    WHERE follower_id = :user_id"
    Service.where("user_id IN (#{following_ids})
                    OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    active_favorites.create(followed_id: other_user.id)
  end

end
