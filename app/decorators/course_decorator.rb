class CourseDecorator < Draper::Decorator
  delegate_all

  def commence
    object.start_date.strftime('%Y-%m-%d')
  end

  def conclude
    object.end_date.strftime('%Y-%m-%d')
  end
end
