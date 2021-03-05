class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.references :noteable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
