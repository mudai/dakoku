# -*- encoding: utf-8 -*-
class CreateDakokuDatetimes < ActiveRecord::Migration
  def change
    create_table :dakoku_datetimes do |t|
      t.integer :user_id
      t.date :dakoku_at # 打刻する（した）日付（基本はstart_at, end_atと同じ日付となる）
      t.datetime :start_at # 出社時間
      t.datetime :end_at # 退社時間　日をまたぐ可能性もあるので(datetime)
      t.text :comment
      t.timestamps
    end

    add_index :dakoku_datetimes, [:user_id, :dakoku_at], :unique => true
  end
end
