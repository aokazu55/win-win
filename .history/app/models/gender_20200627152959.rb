class Gender < ActiveHash::Base
	include ActiveHash::Associations
	self.data = [
		{ id: 1, name: '非公表' },
		{ id: 2, name: '男性' },
		{ id: 3, name: '女性' },
	]

	has_many :profiles

	def users
		profiles.map(&:user)
	end
end
