class CreateTitles < ActiveRecord::Migration
  def change
    rename_column :students, :title, :old_title

    create_table :titles do |t|
      t.string :name, null: false, unique: true
    end

    change_table :students do |t|
      t.references :title
    end
  end
end
