require "rails_helper"

RSpec.describe Dino, type: :model do
    # Validations
    describe "validations" do
        context "valid dino" do
            it "is valid with valid attributes" do
                expect(build(:dino)).to be_valid
            end
        end
    end
end
