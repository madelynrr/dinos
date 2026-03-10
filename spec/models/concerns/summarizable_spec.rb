require "rails_helper"
require_relative "../../../app/models/concerns/summarizable"

RSpec.describe Summarizable, type: :model do
    describe '.create_summary' do
        it 'is included in Dino' do
            expect(Dino.ancestors).to include(Summarizable)
        end

        it 'returns a hash' do
            create(:dino, category: :carnivore)
            expect(Dino.create_summary).to be_a(Hash)
        end
    end
end