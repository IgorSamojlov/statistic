class PieService < BaseService
  def call
      {
        'Тестировщики' => ((tester_bugs_count.to_f / all_bugs_count.to_f) * 100).round(2),
        'Проектная команда' => ((not_tester_bugs_count.to_f / all_bugs_count.to_f) * 100).round(2),
        'Пользователи' => ((other_bugs_count.to_f / all_bugs_count.to_f) * 100).round(2),
      }
  end

  private

  def tester_bugs_count
    tester_bugs_count = Issue.
      joins(:type_issue, :employee, :tags, :project).
      where(type_issues: {name: 'Bug'}).
      where(employees: {position: 'tester'}).
      where("issues.created_at >= ? AND issues.created_at <= ?", start_date, end_date).
      where.
      not(tags: {name: ['support', 'beta']})

    if params[:project].present? && params[:project] != 'Все'
      tester_bugs_count =
        tester_bugs_count.where(projects: {name: params[:project]})
    end

    tester_bugs_count.count
  end

  def not_tester_bugs_count
    not_tester_bugs_count = Issue.
        joins(:type_issue, :employee, :tags, :project).
        where(type_issues: {name: 'Bug'}).
        where("issues.created_at >= ? AND issues.created_at <= ?", start_date, end_date).
        where.
        not(employees: {position: 'tester'}).
        where.
        not(tags: {name: ['support', 'beta']})

    if params[:project].present? && params[:project] != 'Все'
      not_tester_bugs_count =
        not_tester_bugs_count.where(projects: {name: params[:project]})
    end

    not_tester_bugs_count.count
  end

  def other_bugs_count
    other_bugs_count =
      Issue.
        joins(:type_issue, :employee, :tags, :project).
        where(type_issues: {name: 'Bug'}).
        where("issues.created_at >= ? AND issues.created_at <= ?", start_date, end_date).
        where(tags: {name: ['support', 'beta']})

    if params[:project].present? && params[:project] != 'Все'
      other_bugs_count =
        other_bugs_count.where(projects: {name: params[:project]})
    end

    other_bugs_count.count
  end
end
