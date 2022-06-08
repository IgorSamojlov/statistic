class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.references :project
      t.references :employee
      t.references :state_issue
      t.references :priority_issue
      t.references :type_issue

      t.string :summary

      t.datetime :date_start_dev
      t.datetime :date_end_dev
      t.datetime :date_start_test
      t.datetime :date_end_test

      t.timestamps
    end

    create_join_table :issues, :tags
  end
end
