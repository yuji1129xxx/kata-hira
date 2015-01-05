class Event < ActiveRecord::Base
  # association
  belongs_to :person
  belongs_to :resource
end
