class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_after_action :verify_authorized, only: %i[index show], raise: false
  skip_after_action :verify_policy_scoped, only: [:index], raise: false

  def index
    @subjects = Article.distinct.order(:subject).pluck(:subject).compact
    @subject  = params[:subject].presence
    @articles = Article.published.by_subject(@subject).recent.page(params[:page]).per(10)
  end

  def show
    @article = Article.published.find_by!(slug: params[:id])
  end
end