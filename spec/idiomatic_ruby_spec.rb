require 'spec_helper'
require_relative '../idiomatic_ruby'

describe ProcessThings do
  let(:appetizer)      { Food.new('salty', 'crunchy') }
  let(:dessert)        { Food.new('sweet', 'mushy') }
  let(:default_resp)   { 'I cannot determine what you have' }
  let(:appetizer_resp) { 'Looks like you just have an appetizer' }
  let(:dessert_resp)   { 'Looks like you just have dessert' }
  let(:both_resp)      { 'Looks like you have an appetizer and dessert' }

  describe '#determine_meal' do
    context 'when both items are not an appetizer nor a dessert' do
      let(:thing)       { Food.new }
      let(:other_thing) { Food.new }
      let(:processor)   { described_class.new(thing, other_thing) }

      it 'returns default' do
        expect(processor.determine_meal).to eq default_resp
      end
    end

    context 'when you have an appetizer' do
      let(:processor1) { described_class.new(appetizer, other_thing) }
      let(:processor2) { described_class.new(other_thing, appetizer) }

      context 'and the other thing is not food' do
        let(:other_thing) { Thing.new }

        it 'returns default' do
          expect(processor1.determine_meal).to eq default_resp
          expect(processor2.determine_meal).to eq default_resp
        end
      end

      context 'and the other thing is food' do
        let(:other_thing) { Food.new }

        it 'returns the correct response' do
          expect(processor1.determine_meal).to eq appetizer_resp
          expect(processor2.determine_meal).to eq appetizer_resp
        end
      end
    end

    context 'when you have dessert' do
      let(:processor1) { described_class.new(dessert, other_thing) }
      let(:processor2) { described_class.new(other_thing, dessert) }

      context 'and the other thing is not food' do
        let(:other_thing) { Thing.new }

        it 'returns default' do
          expect(processor1.determine_meal).to eq default_resp
          expect(processor2.determine_meal).to eq default_resp
        end
      end

      context 'and the other thing is food' do
        let(:other_thing) { Food.new }

        it 'returns the correct response' do
          expect(processor1.determine_meal).to eq dessert_resp
          expect(processor2.determine_meal).to eq dessert_resp
        end
      end
    end

    context 'when you have both an appetizer and dessert' do
      let(:processor1) { described_class.new(appetizer, dessert) }
      let(:processor2) { described_class.new(dessert, appetizer) }

      it 'returns the correct response' do
        expect(processor1.determine_meal).to eq both_resp
        expect(processor2.determine_meal).to eq both_resp
      end
    end
  end
end
