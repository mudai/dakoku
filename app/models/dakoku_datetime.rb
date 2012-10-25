# -*- coding: utf-8 -*-
class DakokuDatetime < ActiveRecord::Base
  unloadable

  belongs_to :user

  module UserExtention
    def self.included(base)
      base.class_eval do
        has_many :dakoku_datetimes
      end
    end
  end

  def to_param  # overridden
    dakoku_at
  end

  NORMAL_WORK = 1 # 通常出勤
  HOLIDAY_WORK = 2 # 休日出勤
  HOLIDAY = 3 # 休日（休んだらコメントに何か書く）

  def normal_work?
    status == NORMAL_WORK
  end

  def holiday_work?
    status == HOLIDAY_WORK
  end

  def holiday?
    status == HOLIDAY
  end

  def status_text
    case status
    when NORMAL_WORK
      "通常出勤"
    when HOLIDAY_WORK
      "休日出勤"
    when HOLIDAY
      "休日"
    end
  end
end
