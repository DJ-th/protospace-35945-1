class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title
      t.text :catch_copy
      t.text :concept
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
