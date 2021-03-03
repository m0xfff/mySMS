class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.references :entity, polymorphic: true
      t.timestamps
    end
  end
end
