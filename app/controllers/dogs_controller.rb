class DogsController < ApplicationController

 def index
  @dogs = Dog.all

 end

 def new
  @new_dog = Dog.new
 end

 def create
  @dog = Dog.new(dog_params)

  # if saves, go to index w/ notification
  if @dog.save
   redirect_to dogs_url, notice: "Sucessfully created a dog."

  else
  # if doesn't save, re-render the new dog form
   flash.now[:notice] = "Something went wrong.  We couldn't save your dog..."
   render :new
  end
 end


 def show
  @dog = Dog.find(params[:id])
 end

 private

 def dog_params
  params.require(:dog).permit(:name, :age, :breed)
 end



end
