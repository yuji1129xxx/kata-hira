class Person < ActiveRecord::Base
  # validation
  validates :name, :detail, presence: true

  # scope
  scope :recent, -> { order('created_at DESC') }

  # paperclip
  has_attached_file :avatar, :styles => { medium: "248×248>"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def keywords
    PersonKeyword.where(material_id: id)
  end
end
