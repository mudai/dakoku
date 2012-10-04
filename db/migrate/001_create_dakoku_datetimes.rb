# -*- encoding: utf-8 -*-
class CreateDakokuDatetimes < ActiveRecord::Migration
  def change
    create_table :dakoku_datetimes do |t|
      t.date :dakoku_at # 打刻する日付（基本はstart_at, end_atと同じ日付となる）
      t.datetime :start_at # 出社時間
      t.datetime :end_at # 退社時間　日をまたぐ可能性もあるので
      t.text :comment
      t.timestamps
    end
  end
end
