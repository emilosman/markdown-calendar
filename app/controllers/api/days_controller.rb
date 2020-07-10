module Api
  class DaysController < ApplicationController
    before_action :find_day, except: [:index]

    def index
      @days = Day.all

      render json: @days.to_json({methods: :value}), status: 200
    end

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
      parsed_date = Date.strptime(params[:id], "%m-%d-%Y")
      @day = Day.find_or_create_by(date: parsed_date)
    end
  end
end
