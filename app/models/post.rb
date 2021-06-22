class Post < ApplicationRecord
	belongs_to:user
	has_many:likes
	has_many:dislikes

	def isliked(user)
		!!self.likes.find{|like|like.user_id == user.id}
	end

	def isdisliked(user)
		!!self.dislikes.find{|dislike|dislike.user_id==user.id}
	end

end
