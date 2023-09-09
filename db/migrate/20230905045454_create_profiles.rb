class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.text :introduction
      t.integer :gender, default: 2

      t.timestamps
    end
  end
end
