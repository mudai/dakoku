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
end
