class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show], raise: false
  skip_after_action :verify_authorized, only: %i[index show], raise: false
  skip_after_action :verify_policy_scoped, only: [:index], raise: false

  def index
    index_scope = Article.published.excluding_homepage_short
    @subjects = index_scope.distinct.order(:subject).pluck(:subject).compact
    @subject  = params[:subject].presence
    @articles = index_scope.by_subject(@subject).recent.page(params[:page]).per(10)
  end

  def show
    @article = Article.published.find_by!(slug: params[:id])
  end
end
