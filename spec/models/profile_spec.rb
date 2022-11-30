describe Profile do
  describe 'get_all_from_student' do
    it 'should call the model method that gets all profiles from a student' do
      allow(Profile).to receive(:get_all_from_student).and_return (fake_results)
      post :get_all_from_student
      expect(response).to render_template('get_all_from_student')
    end
    it 'should make the profiles info available to that template' do
      fake_results = [double('Profile'), double('Profile')]
      allow(Profile).to receive(:get_all_from_student).and_return (fake_results)
      post :get_all_from_student
      expect(assigns(:profiles)).to eq(fake_results)
    end
  end
end
