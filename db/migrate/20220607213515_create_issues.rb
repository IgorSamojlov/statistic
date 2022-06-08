class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      belongs_to :projects

      t.timestamps
    end
  end
end
