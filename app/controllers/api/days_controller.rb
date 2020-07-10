module Api
  class DaysController < ApplicationController
    before_action :find_day, only: [:show]

    def index
      @days = Day.order(date: :desc)

      render json: @days.to_json({methods: :value}), status: 200
    end

    def show
      render json: @day, status: 200
    end

    def update
      @day = Day.find params[:id]
      @day.update_attributes(
        text: params[:text]
      )

      render json: @day, status: 200
    end

    private
    def find_day
      parsed_date = Date.strptime(params[:id], "%m-%d-%Y")
      @day = Day.find_or_create_by(date: parsed_date)
    end
  end
end
