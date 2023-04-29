class FilmsController < ApplicationController
    def index
        #@films = Film.all
        @films = Film.all.paginate(page: params[:page], per_page: 5)
    end

    def show
        begin
        @film = Film.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        redirect_to films_path, alert: "Film not found"
        end
     end
  

    def destroy
        @film = Film.find(params[:id])
        if @film
          @film.delete
          redirect_to film_path, alert: "Film deleted successfully"
        else
          redirect_to film_path, alert: "Film not found"
        end
      end
    
    def edit
      @film = Film.find(params[:id])
    end
      
    def update
      @film = Film.find(params[:id])
      if @film.update(film_params)
        flash[:success] = "Film updated successfully"
        redirect_to @film
      else
        render 'edit'
      end
    end
    

    def new
        @film = Film.new
    end

    def create
        def create
            @film = Film.new(permited_attributes)
          
            if @film.save
              redirect_to films_path, notice: "Film was successfully created."
            else
              render :new
            end
          end
    end

    private
    def permited_attributes
        params.require("film").permit("name", "year")
    end

    def film_params
      params.require(:film).permit(:name, :year)
    end
end
