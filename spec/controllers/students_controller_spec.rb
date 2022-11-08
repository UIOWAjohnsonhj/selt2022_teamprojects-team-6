require 'spec_helper'
require 'rails_helper'

if RUBY_VERSION>='2.6.0'
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

describe MainController do
  describe 'home page' do
   it 'should call the model that shows profile info' do
     allow(Profile).to receive(:view_profile)
     post :view_profile
     expect(response).to render_template('view_profile')
    end
  end
end


# describe MoviesController do
#   describe 'home page' do
#     it 'should call the model method shows student info' do
#       fake_results = [double('profile1')]
#       expect(Student).to receive(:find_in_tmdb).with('Ted').
#         and_return(fake_results)
#       post :search_tmdb, {:search_box => 'Ted'}
#     end
#     it 'should select the Search Results template for rendering' do
#       allow(Movie).to receive(:find_in_tmdb)
#       post :search_tmdb, {:search_box => 'Ted'}
#       expect(response).to render_template('search_tmdb')
#     end
#     it 'should make the TMDb search results available to that template' do
#       fake_results = [double('Movie'), double('Movie')]
#       allow(Movie).to receive(:find_in_tmdb).and_return (fake_results)
#       post :search_tmdb, {:search_box => 'Ted'}
#       expect(assigns(:movies)).to eq(fake_results)
#     end
#   end
# end
