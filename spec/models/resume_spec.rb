require 'rails_helper'

RSpec.describe Resume, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

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

describe Resume do
  describe 'resume_view' do
    it 'should call the model method that gets all resumes' do
      allow(Resume).to receive(:resume_view).and_return (fake_results)
      post :resume_view
      expect(response).to render_template('resume_view')
    end
    it 'should make the resumes info available to that template' do
      fake_results = [double('Resume'), double('Resume')]
      allow(Resume).to receive(:resume_view).and_return (fake_results)
      post :resume_view
      expect(assigns(:resumes)).to eq(fake_results)
    end
  end
  describe 'new' do
    it 'should call the model method that creates a new resume' do
      allow(Resume).to receive(:new).and_return (fake_results)
      post :new
      expect(response).to render_template('new')
    end
    it 'should make the resume info available to that template' do
      fake_results = [double('Resume'), double('Resume')]
      allow(Resume).to receive(:new).and_return (fake_results)
      post :new
      expect(assigns(:resume)).to eq(fake_results)
    end
  end
  describe 'create' do
    it 'should call the model method that creates a new resume' do
      allow(Resume).to receive(:create).and_return (fake_results)
      post :create
      expect(response).to render_template('create')
    end
    it 'should make the resume info available to that template' do
      fake_results = [double('Resume'), double('Resume')]
      allow(Resume).to receive(:create).and_return (fake_results)
      post :create
      expect(assigns(:resume)).to eq(fake_results)
    end
  end
end

