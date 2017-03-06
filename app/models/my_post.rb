require 'faraday'
require 'rest-in-peace'

class MyPost
  include RESTinPeace

  rest_in_peace do
    use_api Faraday.new(url: 'http://localhost:3001')
    end

    attributes do
      read :id
      write :name, :text
    end

    resource do
      patch :save, '/posts/:id'
      post :create, '/posts'
      delete :destroy, '/posts/:id'
    end

    collection do
      get :all, '/posts'
      get :reload, '/posts/:id'
    end

    acts_as_active_model
  end
