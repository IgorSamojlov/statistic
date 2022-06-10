class ByProjectService < BaseService
  def call
    tester_bugs_by_project
  end

  private

  def tester_bugs_by_project
    result = ActiveRecord::Base.connection.exec_query(query)

    result = result.rows.each_with_object({}) { |(v, k), obj| obj[k] = v}
  end

  def query
    <<-SQL
      SELECT (count(case when tags.name = 'beta' then 1 else null end)::float /
      count(*)::float) * 100 as
      percent, projects.name FROM issues
        INNER JOIN issues_tags ON issues_tags.issue_id = issues.id
        INNER JOIN tags ON tags.id = issues_tags.tag_id
        INNER JOIN projects ON projects.id = issues.project_id
        INNER JOIN type_issues ON type_issues.id = issues.type_issue_id
        WHERE type_issues.name = 'Bug'
        AND (issues.created_at >= '#{start_date}' AND issues.created_at <= '#{end_date}')
        GROUP BY projects.name;
    SQL
  end
end
