class Event < ActiveRecord::Base
  # association
  belongs_to :person
  belongs_to :resource
  belongs_to :user
  has_many :comments, dependent: :destroy

  # scope
  scope :recent, -> { order('created_at DESC') }
end
