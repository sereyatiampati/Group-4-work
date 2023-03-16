class AnimalsController < ApplicationController
    wrap_parameters format: [] #To prevent the unpermitted parameter error
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response #Handling exception error for not finding a record on the database that a user may be trying to access/request
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_attribute #Handle exception error that arises from creating or updating with invalid input(s)-- (Model validations)


    def index
        render json: Animal.all,  except: [:created_at, :updated_at], methods: [:info]
    end
    def show
        animal=find_animal
        render json: animal, methods: [:info],  except: [:created_at, :updated_at]
    end

    def create
        animal= Animal.create!(animal_params)
        render json: animal
      end

    def update
        animal=find_animal
        animal.update!(animal_params)
        render json: animal,  except: [:created_at, :updated_at], methods: :info

    end

    def destroy
        animal=find_animal
        animal.destroy
    end

    private
    def find_animal #find a particular animal using find(this raised an exception- RecordNotFound by active record) as opposed to find_by(this returns null):
      Animal.find(params[:id])
    end

    def animal_params #strongparams as oppossed to mass assignment
        params.permit(:name, :sound, :age)
    end

    def invalid_attribute(invalid) #For handling RecordInvalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def render_not_found_response #For handling RecordNotFound
        render json: { error: "Bird not found" }, status: :not_found
    end
end
