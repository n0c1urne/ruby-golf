# frozen_string_literal: true

require File.dirname(__FILE__) + '/spec_helper'

describe 'Golf' do
  describe '.hole1 should ' do
    specify 'should convert camel case strings to underscored style' do
      expect(Golf.hole1('camelCase')).to be == 'camel_case'
      expect(Golf.hole1('AbstractBeanConverterVistorFactoryService')).to eq('abstract_bean_converter_vistor_factory_service')
    end

    specify 'should do nothing to an empty string' do
      expect(Golf.hole1('')).to be == ''
    end
  end

  describe '.hole2' do
    specify 'should find all numeric palindromes for a range from 0 to 20' do
      expect(Golf.hole2([0, 20])).to be == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11]
    end

    specify 'should find all numeric palindromes for a range from 100 to 200' do
      expect(Golf.hole2([100, 200])).to be == [101, 111, 121, 131, 141, 151, 161, 171, 181, 191]
    end

    specify 'should find all numeric palindromes for a range from 1990 to 1992' do
      expect(Golf.hole2([1990, 1992])).to be == [1991]
    end
  end

  describe '.hole3' do
    specify 'should encrypt the string by performing a shift cipher' do
      expect(Golf.hole3('hello', 3)).to be == 'khoor'
    end

    specify 'should handle negative numbers' do
      expect(Golf.hole3('world', -2)).to be == 'umpjb'
    end
  end

  describe '.hole4' do
    specify 'should count number of times the substring occurs in that string' do
      expect(Golf.hole4('Banana', 'a')).to be == 3
    end

    specify 'should be case insenstive' do
      expect(Golf.hole4('The quick brown fox jumps over the lazy dog', 'the')).to be == 2
    end
  end

  describe '.hole5' do
    specify 'should sum all primes within a given range' do
      expect(Golf.hole5(1, 100)).to be == 1060
      expect(Golf.hole5(5, 5000)).to be == 1_548_131
    end
  end

  describe '.hole6' do
    specify "should play fizzbuzz to 3, where multiples of 3 are 'fizz'" do
      expect(Golf.hole6(3)).to be == [1, 2, 'fizz']
    end

    specify "should play fizzbuzz to 5, with rules above and multiples of 5 are 'buzz'" do
      expect(Golf.hole6(5)).to be == [1, 2, 'fizz', 4, 'buzz']
    end

    specify "should play fizzbuzz to 10 with rules above and muliples of 3 and 5 are 'fizzbuzz'" do
      expect(Golf.hole6(15)).to be == [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz']
    end

    specify 'should play fizzbuzz to 30' do
      expect(Golf.hole6(30)).to be == [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz', 16, 17, 'fizz', 19, 'buzz', 'fizz', 22, 23, 'fizz', 'buzz', 26, 'fizz', 28, 29, 'fizzbuzz']
    end
  end

  describe '.hole7' do
    specify 'should symbolize keys in a hash' do
      expect(Golf.hole7('foo' => 'bar')).to be == { foo: 'bar' }
    end

    specify 'should not symbolize numbers' do
      expect(Golf.hole7(1 => 'direction')).to be == { 1 => 'direction' }
    end

    specify 'should handle nested hashes' do
      expect(Golf.hole7('foo' => { 'bar' => 'baz' }, :bang => {})).to be == { foo: { bar: 'baz' }, bang: {} }
    end
  end

  describe '.hole8' do
    specify 'should give the first N numbers of the fibonacci sequence' do
      expect(Golf.hole8(5)).to be == [1, 1, 2, 3, 5]
    end

    specify 'should give the first 9 numbers' do
      expect(Golf.hole8(9)).to be == [1, 1, 2, 3, 5, 8, 13, 21, 34]
    end

    specify 'should give the first 15 numbers' do
      expect(Golf.hole8(15)).to be == [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
    end
  end

  describe '.hole9' do
    specify 'should collapse consecutive numbers to a range' do
      expect(Golf.hole9([1, 2, 3])).to be == ['1-3']
    end

    specify 'should keep separate ranges distinct' do
      expect(Golf.hole9([1, 2, 3, 5, 6, 7, 100, 101])).to be == %w[1-3 5-7 100-101]
    end

    specify 'should show isolated digits on their own' do
      expect(Golf.hole9([1, 2, 3, 5, 10, 11, 12])).to be == %w[1-3 5 10-12]
    end
  end
end
