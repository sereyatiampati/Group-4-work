class AnimalsController < ApplicationController
    def index
        render json: Animal.all
    end
    def show
        animal=Animal.find_by(id: params[:id])
        render json: animal
    end

    def create

        animal= Animal.create(animal_params)
        render json: animal
    end

    def update
        animal=Animal.find_by(id: params[:id])
        animal.update(animal_params)
        render json: animal
    end

    def destroy
        animal=Animal.find_by(id: params[:id])
        animal.destroy
    end

    private

    def animal_params
        params.permit(:name, :sound, :age)
    end
end
