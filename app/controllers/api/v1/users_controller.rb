class Api::V1::UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:logout, :favorites]
    def login
        user = User.find_by!(email: params[:email])
        if user.valid_password?(params[:password])
            render json: user, status: :ok
        else
            head :unauthorized
        end
    
    rescue StandardError => e
        render json: {message: e}, status: :not_found
    end

    def logout
        current_user.update!(authentication_token: nil)
        render json: {message: "Deslogado com sucesso."}, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def favorites
        favorites = current_user.products
        render json: favorites, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end
end
