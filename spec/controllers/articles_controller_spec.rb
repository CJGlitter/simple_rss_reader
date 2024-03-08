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

  it "marks article as 'unread' when params present" do
    article = Article.new(title: "test", read_status: true, id: 300)
    article.save
    get :index, params: {ur: "300"}
    expect(Article.find(300).read_status).to be_falsy
  end

  it "doesn't mark article as 'unread' when params not present" do
    article = Article.new(title: "test", read_status: true, id: 300)
    article.save
    get :index
    expect(Article.find(300).read_status).to be_truthy
  end

end
