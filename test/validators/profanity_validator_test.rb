require 'test_helper'

class ProfanityValidatorTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @country = countries(:one)
    @fungus_type = fungus_types(:one)
  end

  test "mushroom with clean name passes validation" do
    mushroom = Mushroom.new(
      name: "Beautiful Amanita muscaria",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
    assert mushroom.valid?, "Expected mushroom to be valid, but got errors: #{mushroom.errors.full_messages}"
  end

  test "mushroom with inappropriate name fails validation" do
    mushroom = Mushroom.new(
      name: "fuck mushroom",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
    assert_not mushroom.valid?
    assert_includes mushroom.errors[:name].first, "inappropriate language"
  end

  test "mushroom with clean description passes validation" do
    mushroom = Mushroom.new(
      name: "Test Mushroom",
      description: "Found in mixed hardwood forest",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
    assert mushroom.valid?
  end

  test "mushroom with inappropriate description fails validation" do
    mushroom = Mushroom.new(
      name: "Test Mushroom",
      description: "fuck this is a nice find",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
    assert_not mushroom.valid?
    assert_includes mushroom.errors[:description].first, "inappropriate language"
  end

  test "mushroom with blank description passes validation" do
    mushroom = Mushroom.new(
      name: "Test Mushroom",
      description: nil,
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
    assert mushroom.valid?
  end

  test "article with clean title passes validation" do
    article = Article.new(
      title: "Identifying Amanita Species",
      slug: "identifying-amanita",
      body: "Content here"
    )
    assert article.valid?, "Expected article to be valid, but got errors: #{article.errors.full_messages}"
  end

  test "article with inappropriate title fails validation" do
    article = Article.new(
      title: "fuck Amanita Guide",
      slug: "amanita-guide",
      body: "Content here"
    )
    assert_not article.valid?
    assert_includes article.errors[:title].first, "inappropriate language"
  end

  test "article with clean body passes validation" do
    article = Article.new(
      title: "Amanita Guide",
      slug: "amanita-guide",
      body: "This guide covers common Amanita species"
    )
    assert article.valid?
  end

  test "article with inappropriate body fails validation" do
    article = Article.new(
      title: "Amanita Guide",
      slug: "amanita-guide",
      body: "fuck this mushroom is hard to identify"
    )
    assert_not article.valid?
    assert_includes article.errors[:body].first, "inappropriate language"
  end

  test "error message is family-friendly and clear" do
    mushroom = Mushroom.new(
      name: "fuck mushroom",
      user: @user,
      country: @country,
      fungus_type: @fungus_type
    )
    mushroom.valid?
    error_msg = mushroom.errors[:name].first

    assert_includes error_msg, "inappropriate language"
    assert_includes error_msg, "family-friendly"
    assert_includes error_msg, "ALL AGES"
    assert_includes error_msg, "profanity is not allowed"
  end
end
