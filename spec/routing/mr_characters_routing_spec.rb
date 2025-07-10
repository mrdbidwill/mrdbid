# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MrCharactersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/mr_characters').to route_to('mr_characters#index')
    end

    it 'routes to #new' do
      expect(get: '/mr_characters/new').to route_to('mr_characters#new')
    end

    it 'routes to #show' do
      expect(get: '/mr_characters/1').to route_to('mr_characters#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/mr_characters/1/edit').to route_to('mr_characters#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/mr_characters').to route_to('mr_characters#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/mr_characters/1').to route_to('mr_characters#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/mr_characters/1').to route_to('mr_characters#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/mr_characters/1').to route_to('mr_characters#destroy', id: '1')
    end
  end
end
