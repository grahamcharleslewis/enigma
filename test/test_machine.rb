# frozen_string_literal: true

require "test_helper"
require "enigma/machine"

class TestMachine < Minitest::Test
  def setup
    @machine = Machine.new(%w[I II III], "A")
  end

  def test_encode_char_uppercase
    assert_equal "B", @machine.encode_char("H")
  end

  def test_encode_char_lowercase
    assert_equal "B", @machine.encode_char("h")
  end

  def test_encode_string_uppercase
    assert_equal "BCDDA", @machine.encode_string("HELLO")
  end

  def test_encode_string_lowercase
    assert_equal "BCDDA", @machine.encode_string("hello")
  end

  def test_encode_string_with_whitespace
    assert_equal "BCDDA", @machine.encode_string(" h e LL o ")
  end

  def test_encode_string_with_punctuation
    assert_equal "BCDDA", @machine.encode_string(" ? / >.<, h |\\ e `¬¦ L!\"£L $%^o &*()_+-={}[]:@~;'#")
  end
end
