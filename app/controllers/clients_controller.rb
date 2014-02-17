class ClientsController < ApplicationController
  
  expose(:clients) { current_user.clients }
  expose(:client, attributes: :client_params)

  def index; end

  def new; end

  def create
    if client.save
      redirect_to clients_path, success: 'Client was created successfully.'
    else
      render :new 
    end
  end

  private

    def client_params
      params.require(:client).permit(:email, :name)
    end
end
