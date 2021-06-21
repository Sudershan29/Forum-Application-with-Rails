class Like < ApplicationRecord
	belongs_to :user
	belongs_to :post

	validates :user_id_id, uniqueness: {scope: :post_id_id}
end
