RSpec.describe 'Dinos', type: :request do
    let(:valid_dino)   { create(:dino) }
    let(:invalid_dino) { build(:dino, age: nil) }
end