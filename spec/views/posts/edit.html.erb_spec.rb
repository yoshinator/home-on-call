require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :references => "",
      :slug => "MyString",
      :title => "MyString",
      :content => "MyText",
      :meta => "MyText"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[references]"

      assert_select "input[name=?]", "post[slug]"

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "textarea[name=?]", "post[meta]"
    end
  end
end
