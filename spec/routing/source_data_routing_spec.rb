# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SourceDataController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/source_data').to route_to('source_data#index')
    end

    it 'routes to #new' do
      expect(get: '/source_data/new').to route_to('source_data#new')
    end

    it 'routes to #show' do
      expect(get: '/source_data/1').to route_to('source_data#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/source_data/1/edit').to route_to('source_data#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/source_data').to route_to('source_data#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/source_data/1').to route_to('source_data#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/source_data/1').to route_to('source_data#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/source_data/1').to route_to('source_data#destroy', id: '1')
    end
  end
end
