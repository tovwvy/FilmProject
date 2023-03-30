class FilmsController < ApplicationController
    def index
        #@films = Film.all
        @films = Film.all.paginate(page: params[:page], per_page: 5)
    end
end
