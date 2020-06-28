class Service < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :passive_likes, foreign_key: "service_id", dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  attachment :image

  with_options presence: true do
    validates :main_service_id
    validates :service_detail_id
    validates :service_name, length: { maximum: 25 }
    validates :confidence_level_id
    validates :transportation_expenses, length: { maximum: 6 }
    validates :price, length: { maximum: 6 }
    validates :working_time
    validates :user_id
  end
  
  validates :remark, presence: true, length: { maximum: 100 }
  validate :pretend_ago


  def pretend_ago
    errors.add(:period_start, '本日より過去日の設定は出来ません') if period_start.nil? || period_start <= Date.today
    errors.add(:period_end, '終了日は開始日の後に設定してください') if period_end.nil? || period_end <= period_start
  end

end