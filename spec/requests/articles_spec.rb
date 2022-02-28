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

    it "should respond with json when errors exist" do
      post articles_path, params: { article: attributes_for(:invalid_article) }, as: :json

      json = JSON.parse(response.body)

      expect(json['title']).to include("can't be blank")
    end
  end

  describe "PUT /articles/:id" do
    it "should edit an existing article" do
      article = create :valid_article

      put article_path(article), params: { article: { title: "updated title"} }

      expect(response).to redirect_to assigns(:article)
    end

    it "should render the edit template with status 422 when invalid" do
      article = create :valid_article

      put article_path(article), params: { article: { title: ""} }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:edit)
    end

    it "should respond with json when created successfully" do
      article = create :valid_article

      put article_path(article), params: { article: { title: "updated header" } }, as: :json

      json = JSON.parse(response.body)

      expect(json["title"]).to eq("updated header")
    end

    it "should respond with json when errors exist" do
      article = create :valid_article

      put article_path(article), params: { article: attributes_for(:invalid_article) }, as: :json

      json = JSON.parse(response.body)

      expect(json['title']).to include("can't be blank")
    end
  end

  describe "DELETE /articles/:id" do
    it "should delete the article" do
      article = create :valid_article

      expect(Article.count).to be(1)

      expect {
        delete article_path(article)
      }.to change(Article, :count).by(-1)
    end

    it "should redirect the user to the root path on successful delete" do
      article = create :valid_article

      delete article_path(article)

      expect(response).to redirect_to root_path
    end

    it "should return json and no content status on successful delete" do
      article = create :valid_article

      delete article_path(article), as: :json

      expect(response).to have_http_status :no_content
    end
  end
end
