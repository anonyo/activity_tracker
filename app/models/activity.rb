class Activity < ActiveRecord::Base
  has_many :categories
  default_scope { order("start_time DESC") }

  def self.by_date_and_category(date, category)
    where("created_at >= ?", date).where(category_title: category)
  end
end
