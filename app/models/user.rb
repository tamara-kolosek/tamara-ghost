class User < ApplicationRecord

  devise  :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable, invite_for: 7.days

  enum role: [:author, :editor, :admin]

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates_presence_of :email

  has_many :invitations, class_name: self.to_s, as: :invited_by
  has_many :storys

  def is_admin
  	return self.role == "admin"
  end

  def is_editor 
    return self.role == "editor"
  end
  
end

