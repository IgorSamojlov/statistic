module IssuesHelper
  def start_selected
    return Date.today - 2.year if params["start_date(1i)"].blank?

    Date.civil(
      params["start_date(1i)"].to_i,
      params["start_date(2i)"].to_i,
      params["start_date(3i)"].to_i
    )
  end

  def end_selected
    return Date.today + 2.year if params["end_date(1i)"].blank?

    Date.civil(
      params["end_date(1i)"].to_i,
      params["end_date(2i)"].to_i,
      params["end_date(3i)"].to_i
    )
  end
end
