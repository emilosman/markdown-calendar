module Api
  class DaysController < ApplicationController
    def show
      day = Day.find_or_create_by(date: params[:id])
      render json: day, status: 200
    end
  end
end
