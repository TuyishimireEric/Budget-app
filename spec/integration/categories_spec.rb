require 'rails_helper'

RSpec.describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes to #new' do
      expect(get: '/categories/new').to route_to('categories#new')
    end
  end
end
