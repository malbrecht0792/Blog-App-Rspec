require 'rails_helper'

feature 'post/index' do
  scenario 'renders a list of posts' do
    user = create(:user)
    other_user = create(:user)
    sign_in(user)

    create(:fitness_post, user: user)
    create(:health_post, user: other_user)

    visit posts_path

    expect(page).to have_content("Consistenly Exercising")
    expect(page).to have_content("13 keys to staying consistent at the gym...")
    expect(page).to have_content("Eating Right")
    expect(page).to have_content("11 ways to easily cut carbs...")
  end
end

feature 'New Post' do
  scenario 'user adds a new post' do
    user = create(:user)
    sign_in(user)
    visit posts_path

    expect{
      click_link 'New Post'
      fill_in 'Title', with: 'Learn Rspec'
      fill_in 'Article', with: 'Google it!'
      click_button('Create Post')
    }.to change(Post, :count).by(1)

    expect(current_path).to eq(post_path(Post.last.id))
    expect(page).to have_content('Learn Rspec')

  end
end

feature 'Edit Post' do
  it 'user edits an existing post' do
    user = create(:user)
    post = create(:post)
    sign_in(user)
    visit post_path(post)

    click_link 'Edit Post'
    fill_in 'Title', with: 'Learn JavaScript'
    fill_in 'Article', with: 'Take the JavaScript + React course at Tech Talent South'
    click_button('Update Post')

    expect(current_path).to eq(post_path(post.id))
    expect(page).to have_content("Learn JavaScript")
    expect(page).to have_content("Take the JavaScript + React course at Tech Talent South")

  end
end