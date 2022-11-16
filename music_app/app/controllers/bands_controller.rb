class BandsController < ApplicationController


    def index
        bands = Band.all
        render json: bands
    end

    def create
        @band = Band.new(band_params)
        render :new
        if @band.save!
            redirect_to bands_index
        else
            flash.now[:errors] = "Whoops! Check to see if you missed something."
            redirect_to band_url(new)
        end
    end

    def new
        @band = Band.new
    end

    def edit        
    end

    def show
        @band = Band.find(params[:id])
        redirect_to band_url(@band.id)
    end

    def update
        @band = Band.find_by(:id[params[:id]])
        if @Band.update(band_params)
            redirect_to band_url(band.id)
        else
            render json:band.errors.full_messages, status: 422
        end
    end

    def destroy
        @band = Band.find_by(:id[params[:id]])
        @band.destroy
        redirect_to bands_url
    end



    private
    def band_params
        params.require(:band).permit(:name, :genre, :status)

    end

end