require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  let(:article) {
    Article.create!(
      title: "MyString",
      description: "MyString",
      link: "MyString",
      author: "MyString",
      read_status: false
    )
  }

  before(:each) do
    assign(:article, article)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(article), "post" do

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[description]"

      assert_select "input[name=?]", "article[link]"

      assert_select "input[name=?]", "article[author]"

      assert_select "input[name=?]", "article[read_status]"
    end
  end
end
