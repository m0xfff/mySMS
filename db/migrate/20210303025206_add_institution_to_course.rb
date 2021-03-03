class AddInstitutionToCourse < ActiveRecord::Migration
  def up
    change_table :courses do |t|
      t.references :institute
    end
  end

  def down
    change_table :courses do |t|
      t.remove_references :institute
    end
  end
end
