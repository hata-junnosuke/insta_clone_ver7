# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_post_id              (post_id)
#  index_likes_on_post_id_and_user_id  (post_id,user_id) UNIQUE
#  index_likes_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe 'いいね', type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end
  describe 'いいねといいねの解除' do
    let!(:post) { create(:post, user: user) }
    it 'いいねといいねの解除ができること' do
      visit '/posts'
      expect {
        within "#like_post_#{post.id}" do
          find('.btn-like').click
        end
        sleep 0.1
      }.to change { Like.count }.by(1)

      expect {
        within "#like_post_#{post.id}" do
          find('.btn-unlike').click
        end
        sleep 0.1
      }.to change { Like.count }.by(-1)
    end
  end
end
