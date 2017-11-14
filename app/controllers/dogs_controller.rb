class DogsController < ApplicationController

 before_action :set_dog, only: [:show, :edit, :update]
 # Runs set_dog before only the show, edit, and update methods

 def index
  @dogs = Dog.all

 end

 def new
  @dog = Dog.new
 end

 def create
  @dog = Dog.new(dog_params)

  # if saves, go to index w/ notification
  if @dog.save
   redirect_to dogs_url, notice: "Sucessfully created #{@dog.name}."

  else
  # if doesn't save, re-render the new dog form
   flash.now[:notice] = "Something went wrong.  We couldn't save #{@dog.name}..."
   render :new
  end
 end


 def show
  # set_dog
 end

 def edit
  # set_dog
 end

 def update
  # set_dog

  if @dog.update(dog_params)
   redirect_to dog_url(@dog), notice: "Successfully updated #{@dog.name}."
  else
   flash.now[:notice] = "Something went wrong.  We couldn't update #{@dog.name}..."
   render :edit
  end
 end

 private

 def dog_params
  params.require(:dog).permit(:name, :age, :breed)
 end

 def set_dog
  @dog = Dog.find(params[:id])
 end

end
