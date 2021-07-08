class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.text :department
      t.text :roll_no
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
