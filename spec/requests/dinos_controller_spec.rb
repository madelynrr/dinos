require "rails_helper"

RSpec.describe 'Dinos', type: :request do
    let(:valid_dino)   { create(:dino) }
    let(:invalid_dino) { build(:dino, age: nil) }

      let(:valid_params) do
    { dino: { name: 'Rex', age: 10, category: 'carnivore', period: 'Cretaceous', diet: 'meat' } }
  end

  let(:invalid_params) do
    { dino: { name: nil, age: nil } }
  end

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

    describe 'POST /dinos' do
        context 'with valid params' do
            it 'creates a new dino' do
                expect {
                    post dinos_path, params: valid_params
                }.to change(Dino, :count).by(1)
            end

            it 'redirects to the new dino' do
                post dinos_path, params: valid_params

                expect(response).to redirect_to(dino_path(Dino.last))
            end

            it 'displays the dino name after redirect' do
                post dinos_path, params: valid_params
                follow_redirect!

                expect(response.body).to include('Rex')
            end
        end

        context 'with invalid params' do
            it 'does not create a new dino' do
                expect {
                    post dinos_path, params: invalid_params
                }.not_to change(Dino, :count)
            end
        end
    end

    describe 'GET /dinos/:id/edit' do
        it 'returns http success' do
            get edit_dino_path(valid_dino)
            expect(response).to have_http_status(:success)
        end

        it 'displays the dino name on the page' do
            dino = create(:dino, name: 'Little Foot')

            get edit_dino_path(dino)
            expect(response.body).to include('Little Foot')

            patch dino_path(dino), params: { dino: { name: 'Sarah' } }
            follow_redirect!

            expect(response.body).to include('Sarah')
            expect(response.body).not_to include('Little Foot')
        end
    end

    describe 'DELETE /dinos/:id' do
        it 'destroys the dino' do
            dino = create(:dino)
            expect {
            delete dino_path(dino)
            }.to change(Dino, :count).by(-1)
        end

        it 'redirects to dinos index' do
            delete dino_path(valid_dino)
            expect(response).to redirect_to(dinos_path)
        end

        it 'dino no longer appears on index after deletion' do
            dino = create(:dino, name: 'Rex')
            delete dino_path(dino)
            follow_redirect!
            expect(response.body).not_to include('Rex')
        end
    end
end
