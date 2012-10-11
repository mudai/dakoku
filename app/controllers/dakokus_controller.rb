# -*- coding: utf-8 -*-
class DakokusController < ApplicationController
  unloadable

  before_filter :find_dakoku
  # 打刻変更ページ
  def edit
  end

  def update
    if @dakoku.update_attributes(params[:dakoku_datetime])
      redirect_to my_page_path, :notice => "打刻修正を行いました。"
    else
      render :edit
    end
  end

  private

  def find_dakoku
    @dakoku = find_current_user.dakoku_datetimes.where(:dakoku_at => params[:id]).first_or_initialize
  end
end
