require 'rails_helper'
include RandomData

RSpec.describe MoviesController, type: :controller do
  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:my_movie) { create(:video) }
  let(:my_episode) { create(:video, season: my_season) }
  let(:my_season) { create(:season, series: my_series) }
  let(:my_series) { create(:series) }

  context "member" do
    # before do
    #   sign_in my_user
    # end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, id: my_movie.id
        expect(response).to have_http_status(:success)
      end
      it "renders the #show view" do
        get :show, id: my_movie.id
        expect(response).to render_template :show
      end
      it "assigns my_movie to @video" do
        get :show, id: my_movie.id
        expect(assigns(:video)).to eq(my_movie)
      end
    end

    describe "GET #search" do
      it "returns http success" do
        get :search
        expect(response).to have_http_status(:success)
      end
    end

    # describe "GET #new" do
    #   it "returns http success" do
    #     get :new
    #     expect(response).to have_http_status(:success)
    #   end
    # end
    #
    # describe "GET #edit" do
    #   it "returns http success" do
    #     get :edit, id: my_movie.id
    #     expect(response).to have_http_status(:success)
    #   end
    #   it "renders the #edit view" do
    #     get :edit, id: my_movie.id
    #     expect(response).to render_template :edit
    #   end
    # end
  end

  context "admin" do
    before do
      my_user.update_attributes(admin: true)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, id: my_movie.id
        expect(response).to have_http_status(:success)
      end
      it "renders the #show view" do
        get :show, id: my_movie.id
        expect(response).to render_template :show
      end
      it "assigns my_movie to @video" do
        get :show, id: my_movie.id
        expect(assigns(:video)).to eq(my_movie)
      end
    end

    describe "GET #search" do
      it "returns http success" do
        get :search
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
      it "initializes @video" do
        get :new
        expect(assigns(:video)).not_to be_nil
      end
    end

    describe "POST create" do
      # it "increases the number of videos by 1" do
      #   expect{ post :create, video: {title: RandomData.random_word , year: 2007, synopsis: RandomData.random_sentence} }.to change (Video,:count).by(1)
      # end
      it "assigns Video.last to @video" do
        post :create, video: {title: RandomData.random_word, year: 2007, synopsis: RandomData.random_sentence}
        expect(assigns(:video)).to eq Video.last
      end
      it "redirects to the new video" do
        post :create, video: {title: RandomData.random_word, year: 2007, synopsis: RandomData.random_sentence}
        # expect(response).to redirect_to Video.last
        expect(response).to redirect_to movie_path(Video.last)
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, id: my_movie.id
        expect(response).to have_http_status(:success)
      end
      it "renders the #edit view" do
        get :edit, id: my_movie.id
        expect(response).to render_template :edit
      end
    end
  end
end
