class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_message
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private

  def invalid_message(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
  
  def author_params
    params.permit(:email, :name)
  end
  
end
