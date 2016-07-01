require 'micro_token'

describe MicroToken do

  describe '#generate' do

    context 'with length' do
      context 'set to 12' do
        let(:length) { 12 }

        it 'generates a string of the correct length' do
          expect(MicroToken.generate(length).size).to eq(length)
        end
      end

      context 'not set' do
        it 'generates a string of 8 characters long' do
          expect(MicroToken.generate.size).to eq(8)
        end
      end
    end
  end

  context 'with format' do
    subject { MicroToken.generate(8,format) }

    context 'set to alphanumeric' do
      let(:format) { :alphanumeric }

      23.times do
        it 'contains only alphanumeric characters' do
          expect(subject.split.all? { |c| c =~ /[a-zA-Z0-9]/ }).to be_truthy
        end
      end
    end

    context 'set to numeric' do
      let(:format) { :numeric }

      23.times do
        it 'contains only numerals' do
          expect(subject.split.all? { |c| c =~ /[0-9]/ }).to be_truthy
        end
      end
    end

    context 'set to alpha' do
      let(:format) { :alpha }

      23.times do
        it 'contains only letters' do
          expect(subject.split.all? { |c| c =~ /[a-zA-Z]/ }).to be_truthy
        end
      end
    end

    context 'set to uppercase' do
      let(:format) { :uppercase }

      23.times do
        it 'contains only uppercase letters' do
          expect(subject.split.all? { |c| c =~ /[A-Z]/ }).to be_truthy
        end
      end
    end

    context 'set to lowercase' do
      let(:format) { :lowercase }

      23.times do
        it 'contains only lowercase letters' do
          expect(subject.split.all? { |c| c =~ /[a-z]/ }).to be_truthy
        end
      end
    end
  end

end
