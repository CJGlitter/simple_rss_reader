require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe '#index' do
    it 'Updates the database with new rss feed items' do
      original_count = Article.count
      get :index
      expect(Article.count).to be > original_count
    end

    it "doesn't update the database when articles are present" do
      article = Article.new(title: "test")
      article.save
      original_count = Article.count
      get :index
      expect(Article.count).to eq(original_count)
    end
  end

end
