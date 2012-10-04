module MyControllerCalendarExtention

  def self.included(base)
    base.class_eval do
      before_filter :page_with_calendar, :only => [:index, :page, :page_layout]
    end
  end

  def page_with_calendar
    if params[:year] and params[:year].to_i > 1900
      @year = params[:year].to_i
      if params[:month] and params[:month].to_i > 0 and params[:month].to_i < 13
        @month = params[:month].to_i
      end
    end
    @year ||= Date.today.year
    @month ||= Date.today.month

    @calendar = Redmine::Helpers::Calendar.new(Date.civil(@year, @month, 1), current_language, :month)
  end

end
