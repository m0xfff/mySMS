class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
