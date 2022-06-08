class CreatePriorityIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :priority_issues do |t|
      t.string :name

      t.timestamps
    end
  end
end
