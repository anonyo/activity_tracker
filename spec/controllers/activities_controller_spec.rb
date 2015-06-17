require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  it "renders the new template" do
    get :new
    expect(response).to render_template("new")
  end

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end
  describe "POST #create" do
    it "creates new activity" do
      setup
      expect(Activity.count).to eq 1
    end
  end
  private
  def setup
    Activity.destroy_all
    @request.env['HTTP_REFERER'] = '/activity/new'
    post :create, activity: { category_title: 'Breast Pump', note: 'some note' }
  end
end
