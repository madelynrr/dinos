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

    describe 'GET /dinos/:id' do
        it 'returns http success' do
            get dino_path(valid_dino)
            expect(response).to have_http_status(:success)
        end

        it 'displays the dino name on the page' do
            get dino_path(valid_dino)
            expect(response.body).to include(valid_dino.name)
        end

        it 'returns 404 for non-existent dino' do
            get dino_path(id: 99999)
            expect(response).to have_http_status(:not_found)
        end
    end
end