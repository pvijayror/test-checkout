require 'spec_helper'


describe CheckoutsController do

  def valid_attributes
    {}
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all checkouts as @checkouts" do
      checkout = Checkout.create! valid_attributes
      get :index, {}, valid_session
      assigns(:checkouts).should eq([checkout])
    end
  end

  describe "GET new" do
    it "assigns a new checkout as @checkout" do
      get :new, {:pricing_rules => []}, valid_session
      assigns(:checkout).should be_a_new(Checkout)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Checkout" do
        expect {
          post :create, {:checkout => valid_attributes}, valid_session
        }.to change(Checkout, :count).by(1)
      end

      it "assigns a newly created checkout as @checkout" do
        post :create, {:checkout => valid_attributes}, valid_session
        assigns(:checkout).should be_a(Checkout)
        assigns(:checkout).should be_persisted
      end

      it "redirects to the created checkout" do
        post :create, {:checkout => valid_attributes}, valid_session
        response.should redirect_to(scan_checkout_path(Checkout.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved checkout as @checkout" do
        # Trigger the behavior that occurs when invalid params are submitted
        Checkout.any_instance.stub(:save).and_return(false)
        post :create, {:checkout => {}}, valid_session
        assigns(:checkout).should be_a_new(Checkout)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Checkout.any_instance.stub(:save).and_return(false)
        post :create, {:checkout => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested checkout" do
        checkout = Checkout.create! valid_attributes
        # Assuming there are no other checkouts in the database, this
        # specifies that the Checkout created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Checkout.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => checkout.to_param, :checkout => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested checkout as @checkout" do
        checkout = Checkout.create! valid_attributes
        put :update, {:id => checkout.to_param, :checkout => valid_attributes}, valid_session
        assigns(:checkout).should eq(checkout)
      end

      it "redirects to the checkout" do
        checkout = Checkout.create! valid_attributes
        put :update, {:id => checkout.to_param, :checkout => valid_attributes}, valid_session
        response.should redirect_to(scan_checkout_path(Checkout.last))
      end
    end

    describe "with invalid params" do
      it "assigns the checkout as @checkout" do
        checkout = Checkout.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Checkout.any_instance.stub(:save).and_return(false)
        put :update, {:id => checkout.to_param, :checkout => {}}, valid_session
        assigns(:checkout).should eq(checkout)
      end

      it "re-renders the 'edit' template" do
        checkout = Checkout.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Checkout.any_instance.stub(:save).and_return(false)
        put :update, {:id => checkout.to_param, :checkout => {}}, valid_session
        response.should render_template("scan")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested checkout" do
      checkout = Checkout.create! valid_attributes
      expect {
        delete :destroy, {:id => checkout.to_param}, valid_session
      }.to change(Checkout, :count).by(-1)
    end

    it "redirects to the checkouts list" do
      checkout = Checkout.create! valid_attributes
      delete :destroy, {:id => checkout.to_param}, valid_session
      response.should redirect_to(checkouts_url)
    end
  end

  describe "GET total" do
    it "assigns the requested checkout as @checkout" do
      checkout = Checkout.create! valid_attributes
      get :total, {:id => checkout.to_param}, valid_session
      assigns(:checkout).should eq(checkout)
    end
  end

  describe "GET scan" do
    it "assigns the requested checkout as @checkout" do
      checkout = Checkout.create! valid_attributes
      get :scan, {:id => checkout.to_param}, valid_session
      assigns(:checkout).should eq(checkout)
    end
  end
end
