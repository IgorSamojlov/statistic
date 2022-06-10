class StatisticController < ApplicationController
  def metrics
    @pie = PieService.call(params)
    @by_project = ByProjectService.call(params)
    @by_priority = ByPriorityService.call(params)
    @by_priority_and_state_service = ByPriorityAndStateService.call(params)
  end
end
