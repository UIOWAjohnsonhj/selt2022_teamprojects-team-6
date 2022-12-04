require 'spec_helper'
require 'rails_helper'

if RUBY_VERSION >= '2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end


describe ProfilesController do
  describe 'profile_viewer' do
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
