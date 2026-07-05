# frozen_string_literal: true

module Dna
  class ObservationListPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        user&.elevated_admin? ? scope.all : scope.public_downloads
      end
    end

    def index?
      true
    end

    def show?
      record.public_download? || user&.elevated_admin?
    end

    def download?
      show?
    end

    def create?
      user&.elevated_admin?
    end

    def sync?
      user&.elevated_admin?
    end

    def export?
      user&.elevated_admin?
    end

    def prune?
      user&.elevated_admin?
    end
  end
end
