# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MushroomsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/mushrooms').to route_to('mushrooms#index')
    end

    it 'routes to #new' do
      expect(get: '/mushrooms/new').to route_to('mushrooms#new')
    end

    it 'routes to #show' do
      expect(get: '/mushrooms/1').to route_to('mushrooms#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/mushrooms/1/edit').to route_to('mushrooms#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/mushrooms').to route_to('mushrooms#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/mushrooms/1').to route_to('mushrooms#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/mushrooms/1').to route_to('mushrooms#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/mushrooms/1').to route_to('mushrooms#destroy', id: '1')
    end
  end
end
