class Like < ApplicationRecord
	belongs_to :user, dependent: :destroy
	belongs_to :service, dependent: :destroy
	# validates_uniqueness_of :service_id, scope: :user_id
end
