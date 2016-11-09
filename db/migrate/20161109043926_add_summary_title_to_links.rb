class AddSummaryTitleToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :summary_title, :string
  end
end
