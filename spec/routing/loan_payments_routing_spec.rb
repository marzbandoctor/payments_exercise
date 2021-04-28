require "rails_helper"

RSpec.describe LoanPaymentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/loan_payments").to route_to("loan_payments#index")
    end

    it "routes to #show" do
      expect(get: "/loan_payments/1").to route_to("loan_payments#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/loan_payments").to route_to("loan_payments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/loan_payments/1").to route_to("loan_payments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/loan_payments/1").to route_to("loan_payments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/loan_payments/1").to route_to("loan_payments#destroy", id: "1")
    end
  end
end
