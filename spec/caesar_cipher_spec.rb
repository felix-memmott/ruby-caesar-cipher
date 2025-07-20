require_relative '../ruby-caesar-cipher'

RSpec.describe 'caesar_cipher' do
  describe 'basic functionality' do
    it 'shifts lowercase letters correctly' do
      expect(caesar_cipher('abc', 3)).to eq('def')
    end

    it 'wraps around the alphabet' do
      expect(caesar_cipher('xyz', 3)).to eq('abc')
    end

    it 'handles zero shift' do
      expect(caesar_cipher('hello', 0)).to eq('hello')
    end
  end

  describe 'case preservation' do
    it 'preserves uppercase letters' do
      expect(caesar_cipher('ABC', 3)).to eq('DEF')
    end

    it 'preserves mixed case' do
      expect(caesar_cipher('HeLLo', 1)).to eq('IfMMp')
    end

    it 'handles uppercase wraparound' do
      expect(caesar_cipher('XYZ', 3)).to eq('ABC')
    end
  end

  describe 'various shift values' do
    it 'handles large shift values' do
      expect(caesar_cipher('abc', 29)).to eq('def')
    end

    it 'handles negative shift values' do
      expect(caesar_cipher('def', -3)).to eq('abc')
    end

    it 'handles shift of 13 (ROT13)' do
      expect(caesar_cipher('hello', 13)).to eq('uryyb')
    end

    it 'handles shift of 26 (full alphabet)' do
      expect(caesar_cipher('test', 26)).to eq('test')
    end
  end

  describe 'edge cases' do
    it 'handles empty string' do
      expect(caesar_cipher('', 5)).to eq('')
    end

    it 'handles single character' do
      expect(caesar_cipher('a', 1)).to eq('b')
      expect(caesar_cipher('Z', 1)).to eq('A')
    end

    it 'handles complex mixed case string' do
      expect(caesar_cipher('Hello World!', 5)).to eq('Mjqqt Btwqi!')
    end
  end

  describe 'comprehensive test cases' do
    it 'shifts "The Quick Brown Fox" by 13' do
      expect(caesar_cipher('The Quick Brown Fox', 13)).to eq('Gur Dhvpx Oebja Sbk')
    end

    it 'shifts "ABCDEFGHIJKLMNOPQRSTUVWXYZ" by 1' do
      expect(caesar_cipher('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 1)).to eq('BCDEFGHIJKLMNOPQRSTUVWXYZA')
    end

    it 'shifts "abcdefghijklmnopqrstuvwxyz" by 25' do
      expect(caesar_cipher('abcdefghijklmnopqrstuvwxyz', 25)).to eq('zabcdefghijklmnopqrstuvwxy')
    end
  end

  describe 'input validation' do
    it 'raises ArgumentError when text is not a string' do
      expect { caesar_cipher(123, 5) }.to raise_error(ArgumentError, 'Text must be a string')
    end

    it 'raises ArgumentError when text is nil' do
      expect { caesar_cipher(nil, 5) }.to raise_error(ArgumentError, 'Text must be a string')
    end

    it 'raises ArgumentError when shift_value is not numeric' do
      expect { caesar_cipher('hello', 'invalid') }.to raise_error(ArgumentError, 'Shift value must be a number')
    end

    it 'raises ArgumentError when shift_value is nil' do
      expect { caesar_cipher('hello', nil) }.to raise_error(ArgumentError, 'Shift value must be a number')
    end

    it 'accepts float shift values' do
      expect { caesar_cipher('hello', 3.5) }.not_to raise_error
    end

    it 'accepts integer shift values' do
      expect { caesar_cipher('hello', 3) }.not_to raise_error
    end
  end
end

RSpec.describe 'shift_letter' do
  describe 'basic shifting' do
    it 'shifts lowercase letters correctly' do
      expect(shift_letter('a', 1)).to eq('b')
      expect(shift_letter('b', 2)).to eq('d')
      expect(shift_letter('z', 1)).to eq('a')
    end

    it 'shifts uppercase letters correctly' do
      expect(shift_letter('A', 1)).to eq('B')
      expect(shift_letter('B', 2)).to eq('D')
      expect(shift_letter('Z', 1)).to eq('A')
    end
  end

  describe 'wraparound behavior' do
    it 'wraps around at end of alphabet for lowercase' do
      expect(shift_letter('x', 5)).to eq('c')
      expect(shift_letter('y', 5)).to eq('d')
      expect(shift_letter('z', 5)).to eq('e')
    end

    it 'wraps around at end of alphabet for uppercase' do
      expect(shift_letter('X', 5)).to eq('C')
      expect(shift_letter('Y', 5)).to eq('D')
      expect(shift_letter('Z', 5)).to eq('E')
    end
  end

  describe 'negative shifts' do
    it 'handles negative shifts for lowercase' do
      expect(shift_letter('d', -3)).to eq('a')
      expect(shift_letter('a', -1)).to eq('z')
      expect(shift_letter('b', -3)).to eq('y')
    end

    it 'handles negative shifts for uppercase' do
      expect(shift_letter('D', -3)).to eq('A')
      expect(shift_letter('A', -1)).to eq('Z')
      expect(shift_letter('B', -3)).to eq('Y')
    end
  end

  describe 'large shift values' do
    it 'handles large positive shifts' do
      expect(shift_letter('a', 27)).to eq('b')
      expect(shift_letter('A', 52)).to eq('A')
    end

    it 'handles large negative shifts' do
      expect(shift_letter('a', -27)).to eq('z')
      expect(shift_letter('A', -52)).to eq('A')
    end
  end
end