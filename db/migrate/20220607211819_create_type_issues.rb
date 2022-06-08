class CreateTypeIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :type_issues do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
