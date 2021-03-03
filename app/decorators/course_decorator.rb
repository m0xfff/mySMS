class CourseDecorator < Draper::Decorator
  delegate_all
  decorates_association :institute

  def commence
    l object.start_date, format: :default
  end

  def conclude
    l object.end_date, format: :default
  end
end
