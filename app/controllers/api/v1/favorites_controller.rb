class Api::V1::FavoritesController < ApplicationController
    acts_as_token_authentication_handler_for User
    def create
        favorite = Favorite.new(user_id: current_user.id,product_id: favorite_params[:product_id])
        favorite.save!
        render json: favorite, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def delete
        favorite = Favorite.find_by!(user_id: current_user.id, product_id: params[:product_id])
        favorite.destroy!
        render json: {message:"Favorito deletado com sucesso"}, status: :ok
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    private
    def favorite_params
        params.require(:favorite).permit(:product_id)
    end
end
