require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :references => "",
      :slug => "MyString",
      :title => "MyString",
      :content => "MyText",
      :meta => "MyText"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[references]"

      assert_select "input[name=?]", "post[slug]"

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "textarea[name=?]", "post[meta]"
    end
  end
end
