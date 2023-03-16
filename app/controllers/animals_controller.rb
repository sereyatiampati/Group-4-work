class AnimalsController < ApplicationController
    wrap_parameters format: []
rescue_from ActiveRecord::RecordInvalid, with: :invalid_attribute
    def index
        render json: Animal.all,  except: [:created_at, :updated_at], methods: [:info]
    end
    def show
        animal=Animal.find_by(id: params[:id])
        render json: animal, methods: [:info],  except: [:created_at, :updated_at]
    end

    def create
        animal= Animal.create!(animal_params)
        render json: animal
      end

    def update
        animal=Animal.find_by(id: params[:id])
        animal.update!(animal_params)
        render json: animal,  except: [:created_at, :updated_at], methods: :info

    end

    def destroy
        animal=Animal.find_by(id: params[:id])
        animal.destroy
    end

    private
    def invalid_attribute(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def animal_params
        params.permit(:name, :sound, :age)
    end
end
