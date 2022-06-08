module ApplicationHelper
  def link_class(source, access = :denied)
    klass = 'nav-link'
    klass.concat(' active') if source == controller_name

    return klass if access == :free

    klass.concat(' disabled') unless current_user&.admin?
    klass
  end
end
