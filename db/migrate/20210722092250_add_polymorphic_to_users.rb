class AddPolymorphicToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :aspect, polymorphic: true
  end
end
