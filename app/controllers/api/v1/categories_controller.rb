class Api::V1::CategoriesController < ApplicationController
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    def show
        category = Category.find(params[:id])
        render json: category, status: :ok

    rescue StandardError => e
        #head(:not_found)
        render json: e, status: :not_found
    end
end
