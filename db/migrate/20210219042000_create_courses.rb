class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description
      t.integer :number_of_semesters
      t.date :start_date
      t.date :end_date
      t.integer :allocation, null: false

      t.timestamps
    end
  end
end
