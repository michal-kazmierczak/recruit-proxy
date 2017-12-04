require 'spec_helper'

RSpec.describe 'GET /ping' do
  subject { fail NotImplementedError }

  describe 'a simple health-check endpoint' do
    it 'returns success message' do
      expect(subject).to eq '/ping'
    end
  end
end
