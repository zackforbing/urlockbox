class AddSummaryH1ToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :summary_h1, :string
  end
end
