class StudentDecorator < Draper::Decorator
  delegate_all

  def full_name
    [object.title, object.first_name, object.middle_name, object.last_name].select(&:present?).join(' ')
  end

  def born
    l object.birth_date, format: :default
  end
end
