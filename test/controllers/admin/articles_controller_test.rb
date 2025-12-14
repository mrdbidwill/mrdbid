require "test_helper"

class Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @admin_user = users(:one)
    @admin_user.permission_id = 2
    sign_in @admin_user
  end

  test "should get index" do
    get admin_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post admin_articles_url, params: {
        article: {
          title: "New Article",
          slug: "new-article",
          subject: "Mycology",
          summary: "Summary",
          body: "Body content",
          published: false
        }
      }
    end

    assert_redirected_to admin_article_url(Article.last)
    assert_equal "Article created.", flash[:notice]
  end

  test "should show preview when preview param is present" do
    post admin_articles_url, params: {
      preview: "1",
      article: {
        title: "Preview Article",
        slug: "preview-article",
        body: "Preview content"
      }
    }

    assert_response :success
    assert_template :preview
  end

  test "should show article" do
    get admin_article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch admin_article_url(@article), params: {
      article: {
        title: "Updated Title"
      }
    }

    assert_redirected_to admin_article_url(@article)
    assert_equal "Article updated.", flash[:notice]
  end

  test "should show preview on update when preview param is present" do
    patch admin_article_url(@article), params: {
      preview: "1",
      article: {
        title: "Preview Update"
      }
    }

    assert_response :success
    assert_template :preview
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete admin_article_url(@article)
    end

    assert_redirected_to admin_articles_url
    assert_equal "Article deleted.", flash[:notice]
  end

  test "should find article by slug" do
    article_with_slug = Article.create!(
      title: "Slug Test",
      slug: "slug-test",
      body: "Content"
    )

    get admin_article_url(article_with_slug.slug)
    assert_response :success
  end

  test "should handle invalid article creation" do
    assert_no_difference("Article.count") do
      post admin_articles_url, params: {
        article: {
          title: ""  # Invalid - title is required
        }
      }
    end

    assert_response :unprocessable_entity
  end
end
