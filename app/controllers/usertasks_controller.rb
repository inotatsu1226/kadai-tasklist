class UsertasksController < ApplicationController


  def index

  end

  def show
    
  end

  def new
    
   @usertask =Usertask.new
  end

  def create
    

    @usertask =  User.find_by(id: session[:user_id]).usertasks.build(usertasks_params)
  
    if @usertask.save
     redirect_to @usertask
      
    else

      render :new
    end

  end

  def edit
    @user =  User.find_by(id: session[:user_id])
   @usertask= Usertask.find(params[:id])
   
   if @user.id!=@usertask.user_id then
     redirect_to usertask_url
   end
   
   
   
   
  end

  def update
    @usertask = Usertask.find(params[:id])

    if @usertask.update(usertasks_params)
      redirect_to usertask_url
    else
      render :edit
    end
        
  end

  def destroy
    @usertask= Usertask.find(params[:id])
    @usertask.destroy
    
    redirect_to usertask_url


    
  
  end
end

private

  def usertasks_params
    params.require(:usertask).permit(:content, :status)
  end
