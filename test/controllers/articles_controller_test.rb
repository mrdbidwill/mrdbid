require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @article.update!(published: true, published_at: Time.current)
  end

  test "should get index without authentication" do
    get articles_url
    assert_response :success
  end

  test "should get index with subject filter" do
    get articles_url, params: { subject: @article.subject }
    assert_response :success
  end

  test "should show published article without authentication" do
    get article_url(@article)
    assert_response :success
  end

  test "should find article by slug" do
    article_with_slug = Article.create!(
      title: "Slug Test",
      slug: "slug-test-public",
      body: "Content",
      published: true,
      published_at: Time.current
    )

    get article_url(article_with_slug.slug)
    assert_response :success
  end

  test "should not show unpublished article" do
    unpublished = Article.create!(
      title: "Unpublished",
      slug: "unpublished",
      body: "Content",
      subject: "Mycology",
      published: false
    )

    get article_url(unpublished.slug)
    assert_response :not_found
  end

  test "should paginate articles" do
    get articles_url, params: { page: 1 }
    assert_response :success
  end

  test "should display subjects list" do
    get articles_url
    assert_response :success
    assert assigns(:subjects)
  end
end
