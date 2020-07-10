module Api
  class DaysController < ApplicationController
    before_action :find_day
    def show
      render json: @day, status: 200
    end

    def update
      @day.update_attributes(
        text: params[:text]
      )
    end

    private
    def find_day
      @day = Day.find_or_create_by(date: params[:id])
    end
  end
end
