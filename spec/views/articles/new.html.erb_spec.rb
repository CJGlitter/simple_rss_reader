require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      description: "MyString",
      link: "MyString",
      author: "MyString",
      read_status: false
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[description]"

      assert_select "input[name=?]", "article[link]"

      assert_select "input[name=?]", "article[author]"

      assert_select "input[name=?]", "article[read_status]"
    end
  end
end
