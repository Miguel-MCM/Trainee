class Api::V1::ProductsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]
    def index
        products = Product.all
        render json: products, status: :ok
    end

    def show
        product = Product.find(params[:id])
        render json: product, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        if current_user.is_admin
            product = Product.new(product_params)
            product.save!
            render json: product, status: :created
        else
            render json: {message: "Não autorizado"}, status: :unauthorized
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        if current_user.is_admin
            product = Product.find(params[:id])
            product.update!(product_params)
            render json: product, status: :ok
        else
            render json: {message: "Não autorizado"}, status: :unauthorized
        end
    rescue StandardError => e
        render json: e, status: :unprocessable_entity

    end

    def delete
        if current_user.is_admin
            product = Product.find(params[:id])
            product.destroy!
            render json: { message: "Produto #{product.name} deletado"}, status: :ok
        else
            render json: {message: "Não autorizado"}, status: :unauthorized
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end
    private
    def product_params
        params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
