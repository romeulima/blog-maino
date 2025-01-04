require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    it 'tag name cant be blank' do
      tag = Tag.new

      tag.valid?

      expect(tag.errors[:name]).to include('não pode ficar em branco')
    end

    it 'nome deve ser único' do
      Tag.create!(name: 'ruby')
      tag = Tag.new(name: 'ruby')

      tag.valid?

      expect(Tag.count).to eq(1)
      expect(tag.errors[:name]).to include('já está em uso')
    end
  end
end
