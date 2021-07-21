class CreateUserAspects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_aspects do |t|
      t.references :aspect, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
