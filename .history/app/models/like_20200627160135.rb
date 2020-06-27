class Like < ApplicationRecord
	belongs_to :user
	belongs_to :service
	# validates_uniqueness_of :service_id, scope: :user_id
end
