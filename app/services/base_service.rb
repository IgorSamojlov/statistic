class BaseService
  attr_reader :params

  def self.call(*args, &block)
    new(*args, &block).call
  end

  private

  def initialize(params)
    @params = params
  end

  def start_date
    return Date.today - 2.year if params["start_date(1i)"].blank?

    @start_date ||= Date.civil(
      params["start_date(1i)"].to_i,
      params["start_date(2i)"].to_i,
      params["start_date(3i)"].to_i
    )
  end

  def end_date
    return Date.today + 2.year if params["end_date(1i)"].blank?

    @end_date ||= Date.civil(
      params["end_date(1i)"].to_i,
      params["end_date(2i)"].to_i,
      params["end_date(3i)"].to_i
    )
  end

  def all_bugs_count
    @all_bugs_count ||= begin
      result = Issue.
      joins(:type_issue, :project).
      where(type_issues: {name: 'Bug'}).
      where("issues.created_at >= ? AND issues.created_at <= ?", start_date, end_date )

      if params[:project].present? && params[:project] != 'Все'
        result =
          result.where(projects: {name: params[:project]})
      end

      result = result.count
    end
  end
end
