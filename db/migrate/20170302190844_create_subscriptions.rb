class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_id, null: false, default: ''
      t.string :subscription_path, null: false, default: ''
    end
  end
end
