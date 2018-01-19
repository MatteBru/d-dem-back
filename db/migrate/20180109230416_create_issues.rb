class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :blurb
      t.references :creator, index: true
      t.string :category

      t.timestamps
    end
  end
end
