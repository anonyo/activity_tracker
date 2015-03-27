class Activity < ActiveRecord::Base
  has_many :categories
  default_scope { order("created_at DESC") }

  def self.by_date_and_category(date, category)
    where("created_at >= ?", date).where(category_title: category)
  end
end
