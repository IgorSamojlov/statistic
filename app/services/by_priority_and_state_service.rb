class ByPriorityAndStateService < BaseService
  def call
    percent_bugs_by_priority_and_state
  end

  private

  def percent_bugs_by_priority_and_state
    result = ActiveRecord::Base.connection.exec_query(query)

    result.rows.each_with_object({}) { |(v, k), obj| obj[k] = v}
  end

  def query
    <<-SQL
      SELECT (count(
          case when state_issues.name IN ('fixed', 'verified', 'to be mereged') then 1 else null end
        )::float /
      count(*)::float) * 100 as
      percent, priority_issues.name FROM issues
        INNER JOIN state_issues ON state_issues.id = issues.state_issue_id
        INNER JOIN priority_issues ON priority_issues.id = issues.priority_issue_id
        INNER JOIN issues_tags ON issues_tags.issue_id = issues.id
        INNER JOIN projects ON projects.id = issues.project_id
        INNER JOIN type_issues ON type_issues.id = issues.type_issue_id
        WHERE type_issues.name = 'Bug'
        AND (issues.created_at >= '#{start_date}' AND issues.created_at <= '#{end_date}')
        #{additional_condition}
        GROUP BY priority_issues.name;
    SQL
  end

  def additional_condition
    if params[:project].present? && params[:project] != 'Все'
      "AND projects.name = '#{params[:project]}'"
    end
  end
end
