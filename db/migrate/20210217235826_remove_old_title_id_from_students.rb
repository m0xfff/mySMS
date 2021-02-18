class RemoveOldTitleIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :old_title
  end
end
