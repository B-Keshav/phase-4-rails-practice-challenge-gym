class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
    def show
        client = find_client
        # total_memberships = client.memberships.map{|e| e.charge}
        # total_charge = total_memberships.sum
        render json: client
    end
    
    def index
        render json: Client.all, status: :ok
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: :accepted
    end
    
    private

    def client_params
        params.permit(:name, :age)    
    end

    def find_client
        Client.find(params[:id])
    end

    def render_not_found
        render json: {error: "Client not found"}, status: :not_found
    end
end
