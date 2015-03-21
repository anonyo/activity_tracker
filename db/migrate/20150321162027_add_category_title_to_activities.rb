class AddCategoryTitleToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :category_title, :string
  end
end
