class CheckoutsController < ApplicationController
  #GET /checkouts
  #GET /checkouts.json
  def index
    @checkouts = Checkout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkouts }
    end
  end

  #GET /checkouts/new
  #GET /checkouts/new.json
  def new
    @checkout = Checkout.new
    @pricing_rules = PricingRule.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkout }
    end
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(params[:checkout])

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to scan_checkout_path(@checkout), notice: 'Checkout was successfully created.' }
        format.json { render json: @checkout, status: :created, location: @checkout }
      else
        format.html { render action: "new" }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout = Checkout.find(params[:id])
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to checkouts_url }
      format.json { head :no_content }
    end
  end

  def scan
    @checkout = Checkout.find(params[:id])
    @products = Product.all
    @transaction = Transaction.new
  end

  def total
    @checkout = Checkout.find(params[:id])
  end

end
