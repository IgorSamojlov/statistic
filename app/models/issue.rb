class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :employee
  belongs_to :priority_issue
  belongs_to :state_issue
  belongs_to :type_issue

  has_and_belongs_to_many :tags
end
