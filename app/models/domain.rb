require 'faraday'
require 'rest-in-peace'

class Domain
  include RESTinPeace

  rest_in_peace do
    use_api ->() do
      ::Faraday.new(url: 'http://localhost:3000', headers: { 'Accept' => 'application/json' }) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.adapter :excon
      end
    end

    attributes do
      read :id, :name_punycode
      write :name, :customer_id, :type, :master
    end

    resource do
      put :save, '/domains/:id'
      post :create, '/domains'
      delete :destroy, '/domains/:id'
    end

    collection do
      get :all, '/domains'
      get :search, '/domains/search?query=:query'
      get :find, '/domains/:id'
      get :find_by_name, '/domains/search?domain=:name'
      get :for_customer, '/customers/:customer_id/domains'
    end

    acts_as_active_model
  end
end


