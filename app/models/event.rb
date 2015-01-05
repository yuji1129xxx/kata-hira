class Event < ActiveRecord::Base
  # association
  belongs_to :person
  belongs_to :resource
  has_many :comments
end
