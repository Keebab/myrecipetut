class AddColumnSummaryToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :summary, :text
  end
end
