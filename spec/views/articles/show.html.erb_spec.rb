require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    assign(:article, Article.create!(
      title: "Title",
      description: "Description",
      link: "Link",
      author: "Author",
      read_status: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/false/)
  end
end
