require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) {create(:user)}
  let(:valid_post) { create(:post) }
  let(:valid_attributes) {attributes_for(:post, user_id: user.id)}
  let(:invalid_attributes) {attributes_for(:invalid_post)}
  let(:new_attributes) {attributes_for(:new_attributes)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns all posts as @posts' do
      get :index
      expect(assigns(:posts)).to eq([valid_post])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: valid_post.to_param}
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested post as @post' do
      get :show, params: {id: valid_post.to_param}
      expect(assigns(:post)).to eq(valid_post)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a new post as @post' do
      get :new, params: {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, params: {post: valid_attributes}
      expect(response).to have_http_status(:redirect)
    end

    context 'with valid attributes' do
      it 'persists a new post' do
        expect{
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it 'redirects to show page' do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(assigns(:post))
      end
    end

    context 'with invalid attributes' do
      it 'does not persist new post' do
        expect{
          post :create, params: {post: invalid_attributes}
        }.not_to change(Post, :count)
      end

      it 're-renders the new template' do
        post :create, params: {post: invalid_attributes}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: valid_post.to_param}
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested task as @task' do
      get :edit, params: {id: valid_post.to_param}
      expect(assigns(:post)).to eq(valid_post)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update, params: {id: valid_post.to_param, post: new_attributes}
      expect(response).to have_http_status(:redirect)
    end

    context 'with valid attributes' do
      it 'updates the selected post' do
        patch :update, params: {id: valid_post.to_param, post: new_attributes}
        
        valid_post.reload

        expect(valid_post.title).to eq("My New Post")
        expect(valid_post.article).to eq("This is my new post!")
      end

      it 'redirects to the post' do
        patch :update, params: {id: valid_post.to_param, post: new_attributes}
        expect(response).to redirect_to(assigns(:post))
      end

    end

    context 'with invalid attributes' do
      it 'does not update the selected post' do
        patch :update, params: {id: valid_post.to_param, post: invalid_attributes}
        expect(assigns(:post)).to eq(valid_post)
      end

      it 're-renders the edit page' do
        patch :update, params: {id: valid_post.to_param, post: invalid_attributes}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "GET #destroy" do
    let(:post) { build(:post) }

    it "returns http success" do
      get :destroy, params: {id: valid_post.to_param}
      expect(response).to have_http_status(:redirect)
    end

    it 'destroys the requested post' do
      post.save
      expect {
        delete :destroy, params: {id: post}
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the index page' do
      post.save
      delete :destroy, params: {id: post}
      expect(response).to redirect_to(posts_url)
    end
  end
end
