class MigrateTitleData < ActiveRecord::Migration
  def change
    # cache of titles
    titles = {}

    # pull all unique titles out of the student table and insert them
    # into the database. Ignore empty titles.
    Student.uniq.pluck(:old_title).each do |title|
      unless title.in? [nil, ""]
        t = Title.create({ name: title })
        titles[title] = t.id
      end
    end

    # go through the student table in batches assigning relevant cached title
    # id to the title_id foreign key attribute in the student table, if the student
    # has a title in the cache.
    Student.find_in_batches do |batch|
      Student.transaction do
        batch.each do |student|
          if titles.key?(student.old_title)
            Student.transaction { student.update_attribute(:title_id, titles[student.old_title]) }
          end
        end
      end
    end
  end
end
