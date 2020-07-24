module Api
  class DaysController < ApplicationController
    require 'open-uri'

    before_action :find_day, only: [:show]

    def index
      search = params[:search] || '_'
      @days = Day.with_text.where( 'LOWER(text) LIKE ?', "%" + search.downcase + "%" ).order(date: :desc)

      render json: @days.to_json({ methods: [:value, :image_url] }), status: 200
    end

    def show
      render json: @day.to_json({ methods: [:value, :image_url] }), status: 200
    end

    def update
      @day = Day.find params[:id]

      if params[:image]
        data = params[:image]
        png = Base64.decode64(data.remove('data:image/png;base64,'))
        file = Tempfile.new
        file.binmode
        file.write(png)
        file.rewind
        @day.image.attach(io: file, filename:'upload.png')
        file.close
        file.unlink
        @day.save!
      end

      
      @day.update_attributes(
        text: params[:text]
      ) if params[:text].present?

      render json: @day, status: 200
    end

    def commit
      Day.with_text.each do |day|
        File.write("./export/#{day.date}.md", day.text)
      end
      system "cd export && git add . && git status && git commit -m 'update' && git push upstream master"
    end

    private
    def find_day
      parsed_date = Date.strptime(params[:id], "%m-%d-%Y")
      @day = Day.find_or_create_by(date: parsed_date)
    end
  end
end
