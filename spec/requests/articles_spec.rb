require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "POST /articles" do
    it "should create a new article" do
      expect {
        post articles_path, params: { article: attributes_for(:valid_article) }
      }.to change(Article, :count).by(1)
    end

    it "should redirect to article when created successfully" do
      post articles_path, params: { article: attributes_for(:valid_article) }

      expect(response).to redirect_to assigns(:article)
    end

    it "should render the new template with status 422 when invalid" do
      post articles_path, params: { article: attributes_for(:invalid_article) }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end

    it "should respond with json when created successfully" do
      post articles_path, params: { article: attributes_for(:valid_article) }, as: :json

      json = JSON.parse(response.body)

      expect(json["title"]).to eq("header")
    end

    it "should respond with json when created successfully" do
      post articles_path, params: { article: attributes_for(:invalid_article) }, as: :json

      json = JSON.parse(response.body)

      expect(json['title']).to include("can't be blank")
    end
  end
end
