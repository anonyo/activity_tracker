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
end
