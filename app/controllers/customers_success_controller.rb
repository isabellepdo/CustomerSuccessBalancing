class CustomersSuccessController < ApplicationController
  before_action :set_customer_success, only: %i[ show edit update destroy ]

  # GET /customers_success or /customers_success.json
  def index
    @customers_success = CustomerSuccess.all
  end

  # GET /customers_success/1 or /customers_success/1.json
  def show
  end

  # GET /customers_success/new
  def new
    @customer_success = CustomerSuccess.new
  end

  # GET /customers_success/1/edit
  def edit
  end

  # POST /customers_success or /customers_success.json
  def create
    @customer_success = CustomerSuccess.new(customer_success_params)

    respond_to do |format|
      if @customer_success.save
        format.html { redirect_to customer_success_url(@customer_success), notice: "Customer success was successfully created." }
        format.json { render :show, status: :created, location: @customer_success }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers_success/1 or /customers_success/1.json
  def update
    respond_to do |format|
      if @customer_success.update(customer_success_params)
        format.html { redirect_to customer_success_url(@customer_success), notice: "Customer success was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_success }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers_success/1 or /customers_success/1.json
  def destroy
    @customer_success.destroy

    respond_to do |format|
      format.html { redirect_to customers_success_url, notice: "Customer success was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_success
      @customer_success = CustomerSuccess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_success_params
      params.require(:customer_success).permit(:nome, :nivel, :status)
    end
end
