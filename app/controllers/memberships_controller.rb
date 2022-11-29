class MembershipsController < ApplicationController

    def create
        membership = Membership.create!(member_params)
        render json: membership, status: :created
    end

    private

    def member_params
        params.permit(:gym_id, :client_id, :charge)
    end

    
end
