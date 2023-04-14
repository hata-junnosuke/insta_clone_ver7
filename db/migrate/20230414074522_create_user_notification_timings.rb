class CreateUserNotificationTimings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_notification_timings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notification_timing, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_notification_timings, %i[user_id notification_timing_id], unique: true, name: 'index_u_n_timings_on_u_id_and_n_timing_id'
  end
end
