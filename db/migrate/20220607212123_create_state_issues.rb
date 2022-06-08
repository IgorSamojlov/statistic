class CreateStateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :state_issues do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
