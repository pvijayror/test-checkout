require 'spec_helper'

describe TransactionsController do

  describe "POST create" do
    before :each do
      #@test_checkout = FactoryGirl.create(:checkout)
      #@test_transaction = FactoryGirl.build(:transaction, :checkout => @test_checkout)
      request.env["HTTP_REFERER"] = "where_i_came_from"
    end
    describe "with valid params" do
      #it "creates a new Transaction" do
      #  expect {
      #    post :create, {:transaction => Factory.attributes_for(:transaction)}
      #  }.to change(Transaction, :count).by(1)
      #end

      it "assigns a newly created transaction as @transaction" do
        post :create, {:transaction => Factory.attributes_for(:transaction)}
        assigns(:transaction).should be_a(Transaction)
        #assigns(:transaction).should be_persisted
      end

      it "redirects to the created transaction" do
        post :create, {:transaction => Factory.attributes_for(:transaction)}
        response.should redirect_to "where_i_came_from"
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved transaction as @transaction" do
        # Trigger the behavior that occurs when invalid params are submitted
        Transaction.any_instance.stub(:save).and_return(false)
        post :create, {:transaction => {}}
        assigns(:transaction).should be_a_new(Transaction)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Transaction.any_instance.stub(:save).and_return(false)
        post :create, {:transaction => {}}
        response.should redirect_to "where_i_came_from"
      end
    end
  end
end