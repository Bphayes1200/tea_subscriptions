class CreateTeaSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :tea_subscriptions do |t|
      t.boolean :active
      t.references :customer, foreign_key: true
    end
  end
end
