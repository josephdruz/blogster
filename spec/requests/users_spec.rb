require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /register" do
    it "should render the new template" do
      get register_url

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end
  end

  describe "GET /users/new" do
    it "should render the new template" do
      get new_user_path

      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /users" do
    it "should create a new user" do
      expect {
        post users_path, params: { user: attributes_for(:valid_user) }
      }.to change(User, :count).by(1)
    end

    it "should redirect to login when created successfully" do
      post users_path, params: { user: attributes_for(:valid_user) }

      expect(response).to redirect_to(articles_path)
    end

    it "should render the new template with status 422 when invalid" do
      post users_path, params: { user: attributes_for(:invalid_user) }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end
end
