class User < ApplicationRecord

  devise  :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable, invite_for: 7.days

  enum role: [:author, :editor, :admin]

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates_presence_of :email

  has_many :invitations, class_name: self.to_s, as: :invited_by
  has_many :storys

  has_many :admin_relationships, foreign_key: :admin_id, class_name: 'Membership'
  has_many :members, through: :admin_relationships, source: :member

  has_many :member_relationships, foreign_key: :member_id, class_name: 'Membership'
  has_many :admins, through: :member_relationships, source: :admin

  def became_member(admin_id)
    member_relationships.create(admin_id: admin_id)
  end

  def is_admin
  	return self.role == "admin"
  end

  def is_editor 
    return self.role == "editor"
  end
  
end

