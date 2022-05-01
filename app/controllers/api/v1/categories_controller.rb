class Api::V1::CategoriesController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:create, :update, :delete]
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: category, status: :ok

    rescue StandardError => e
        render json: e, status: :not_found
    end

    def create
        if current_user.is_admin
            category = Category.new(category_params)
            category.save!
            render json: category, status: :created
        else
            render json: {message: "Não autorizado"}, status: :unauthorized
        end
    rescue StandardError => e
        render json: e, status: :bad_request
    end

    def update
        if current_user.is_admin
            category = Category.find(params[:id])
            category.update!(category_params)
            render json: category, status: :ok
        else
            render json: {message: "Não autorizado"}, status: :unauthorized
        end
    rescue StandardError => e
        render json: e, status: :bad_request

    end

    def delete
        if current_user.is_admin
            category = Category.find(params[:id])
            category.destroy!
            render json: { message: "Categoria #{category.name} deletada"}, status: :ok
        else
            render json: {message: "Não autorizado"}, status: :unauthorized
        end

    rescue StandardError => e
        render json: e, status: :bad_request

    end

    def category_filter
        category = Category.find(params[:id])
        products = category.products
        render json: products, status: :ok
    rescue StandardError => e
        render json: e, status: :not_found
    end
    private

    def category_params
        params.require(:category).permit(:name)
    end
end
