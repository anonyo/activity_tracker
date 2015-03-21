class AddActivityIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :activity_id, :integer
  end
end
