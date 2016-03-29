require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  let(:my_genre) { Genre.create!(name: "Comedy") }
  describe "GET show" do
    it "returns http success" do
      get :show, { id: my_genre.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, { id: my_genre.id }
      expect(response).to render_template :show
    end
    it "assigns my_genre to @genre" do
      get :show, { id: my_genre.id }
      expect(assigns(:genre)).to eq(my_genre)
    end
  end
end
