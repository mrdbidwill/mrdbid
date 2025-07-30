

test "mushroom attributes must not be empty" do
  mushroom = Product.new
  assert mushroom.invalid?
  assert mushroom.errors[:name].any?
  assert mushroom.errors[:user_id].any?

end

test "should create mushroom" do
  assert_difference("Mushroom.count") do
    post mushrooms_url, params: {
      mushroom: {
        description: @mushroom.description,
        image: file_fixture_upload("lorem.jpg", "image/jpeg"),
        price: @mushroom.price,
        title: @title
      }
    }
  end
end
assert_redirected_to mushroom_url(Mushroom.last)


test "should update mushroom" do
  patch mushroom_url(@mushroom), params: {
    mushroom: {
      description: @mushroom.description,
      image: file_fixture_upload("lorem.jpg", "image/jpeg"),
      price: @mushroom.price,
      title: @title
    }
  }
  assert_redirected_to mushroom_url(@mushroom)
end
