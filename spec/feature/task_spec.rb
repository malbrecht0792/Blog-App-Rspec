require 'rails_helper'

feature 'New Post' do
  scenario 'user adds a new post' do
    user = create(:user)
    visit posts_path

    expect{
      click_link 'New Post'
      fill_in 'Title', with: 'Learn Rspec'
      fill_in 'Article', with: 'Google it!'
      select(user.username, from: 'Username')
      click_button('Create Post')
    }.to change(Post, :count).by(1)

    expect(current_path).to eq(post_path(Post.last.id))
    expect(page).to have_content('Learn Rspec')

  end
end