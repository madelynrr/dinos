require "rails_helper"

RSpec.describe 'Dinos', type: :request do
    let(:valid_dino)   { create(:dino) }
    let(:invalid_dino) { build(:dino, age: nil) }

    describe 'GET /dinos' do
        it 'returns http success' do
            get dinos_path
            expect(response).to have_http_status(:success)
        end

        it 'displays all dino names' do
            create(:dino, name: 'Rex')
            create(:dino, name: 'Trike')
            get dinos_path

            expect(response.body).to include('Rex')
            expect(response.body).to include('Trike')
        end
    end
end