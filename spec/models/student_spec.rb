describe Student do
  describe 'associations' do
    it { should have_secure_password }
    it { should have_one(:profile) }
    it { should have_many(:experiences) }
    it { should have_many(:undergraduate_schools) }
    it { should have_many(:applications) }
  end
end
