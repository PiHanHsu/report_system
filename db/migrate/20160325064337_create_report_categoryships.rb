class CreateReportCategoryships < ActiveRecord::Migration
  def change
    create_table :report_categoryships do |t|
      t.integer :report_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
