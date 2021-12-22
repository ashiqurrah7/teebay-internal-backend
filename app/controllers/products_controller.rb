class ProductsController < ApplicationController


  # GET /products or /products.json
  def index
    products = Product.order('created_at DESC')
    render json: Panko::ArraySerializer.new(products, each_serializer: ProductSerializer).to_json, status: :ok
  end

  # GET /products/1 or /products/1.json
  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new.serialize_to_json(product), status: :ok
  end

  # POST /products or /products.json
  def create
    if current_user
      product = Product.new({**product_params, user_id:current_user.id})
      created_product = product.save
      if created_product
        ProductMailer.with(user: current_user, product: product).product_created.deliver_later
        render json: ProductSerializer.new.serialize_to_json(product), status: :ok
      else
        render json: {message: "Error creating product", data: created_product.errors}, status: :bad_request
      end
    else
      render json: {message: "You are not authorized to perform this action"}, status: :forbidden
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    product = Product.find(params[:id])
    authorize product
    updated_product = product.update({**product_params, user_id:current_user.id})
    if updated_product
        render json: ProductSerializer.new.serialize_to_json(product), status: :ok
    else
        render json: {message: "Error updating user", data: updated_product.errors}, status: :bad_request
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    product = Product.find(params[:id])
    authorize product
    product.destroy
    render json: ProductSerializer.new.serialize_to_json(product), status: :ok
  end

  private
    # Only allow a list of trusted parameters through.
    def product_params
      params.permit(:title, :desc, :price, {:category_ids=>[]})
    end
end
