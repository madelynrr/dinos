require "rails_helper"

RSpec.describe Summarizable, type: :model do
    describe '.create_summary' do
        it 'is included in Dino' do
            expect(Dino.ancestors).to include(Summarizable)
        end

        it 'returns a hash' do
            create(:dino, category: :carnivore)
            expect(Dino.create_summary).to be_a(Hash)
        end


        it 'counts dinos by category' do
            create(:dino, category: :carnivore)
            create(:dino, category: :carnivore)
            create(:dino, category: :herbivore)

            summary = Dino.create_summary

            expect(summary['carnivore']).to eq(2)
            expect(summary['herbivore']).to eq(1)
        end

        it 'returns 0 for categories with no dinos' do
            create(:dino, category: :carnivore)
            summary = Dino.create_summary

            expect(summary['herbivore']).to eq(0)
        end

        it 'returns empty hash when no dinos exist' do
            expect(Dino.create_summary).to eq({})
        end
    end
end
