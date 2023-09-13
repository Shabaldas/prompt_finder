describe '/home/index', type: :request do
  describe 'GET /home/idex' do
    context 'when user not logged in' do
      it 'display home page' do
        get root_path

        expect(response).to be_successful
        expect(response.body).to include('Search Prompts')
      end
    end
  end
end
