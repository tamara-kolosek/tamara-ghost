class Membership < ApplicationRecord
	belongs_to :member, foreign_key: 'member_id', class_name: 'User'
  belongs_to :admin, foreign_key: 'admin_id', class_name: 'User'
end