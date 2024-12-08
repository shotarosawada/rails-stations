class Schedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.bigint :movie_id, null: false, index: true
      t.time :start_time, null: false, comment: '上映開始時刻'
      t.time :end_time, null: false, comment: '上映終了時刻'
      t.timestamps
      #t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      #t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end

    # 外部キー制約の追加
    add_foreign_key :schedules, :movies, column: :movie_id, on_delete: :restrict, on_update: :restrict
  end
end
