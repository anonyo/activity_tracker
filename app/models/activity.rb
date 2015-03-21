class Activity < ActiveRecord::Base
  has_many :categories
  default_scope { order("created_at DESC") }
end
