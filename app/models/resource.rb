class Resource < ActiveRecord::Base
  # validation
  validates :name, :detail, presence: true

  # paperclip
  has_attached_file :avatar, :styles => { medium: "248×248>"}
  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)
  
  def keywords
    ResourceKeyword.where(material_id: id)
  end
end
