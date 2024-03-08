require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe '#home' do
    it 'Clears db when "r" param is true' do
      article = Article.new(title: "test")
      article.save
      get :home, params: {r: "true"}
      expect(Article.count).to eq(0)
    end
  end

end
