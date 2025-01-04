require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it 'should validate the presence of the content' do
      comment = build(:comment, content: '')

      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include('não pode ficar em branco')
    end

    it 'autor é opcional' do
      comment_with_author = build(:comment)
      anonymous_comment = build(:comment, user: nil)

      expect(comment_with_author).to be_valid
      expect(anonymous_comment).to be_valid
    end
  end
end
