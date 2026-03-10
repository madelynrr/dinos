require "rails_helper"

RSpec.describe Dino, type: :model do
    # Validations
    describe "validations" do
        context "valid dino" do
            it "is valid with valid attributes" do
                expect(build(:dino)).to be_valid
            end
        end

        context "validates presence of" do
            it { is_expected.to validate_presence_of(:name) }
            it { is_expected.to validate_presence_of(:age) }
        end

        context "age specific validations" do
            it { is_expected.to validate_numericality_of(:age).only_integer }
            it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(0) }
            it { is_expected.to validate_numericality_of(:age).is_less_than_or_equal_to(100) }


            it 'is invalid without age' do
                dino = build(:dino, age: nil)
                expect(dino).not_to be_valid
                expect(dino.errors[:age]).to include("can't be blank")
            end

            it 'is invalid with age over AGE_PARAM' do
                dino = build(:dino, age: 101)
                expect(dino).not_to be_valid
            end

            it 'is valid at age boundary of 0' do
                expect(build(:dino, age: 0)).to be_valid
            end

            it 'is valid at age boundary of 100' do
                expect(build(:dino, age: 100)).to be_valid
            end
        end
    end
end
