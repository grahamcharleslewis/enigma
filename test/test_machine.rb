# frozen_string_literal: true

require "test_helper"
require "enigma/machine"

class TestMachine < Minitest::Test
  def setup
    @machine = Machine.new
    @machine.configure(%w[I II III], "A")
  end

  def test_transcode_character_uppercase
    assert_equal "B", @machine.transcode_character("H")
  end

  def test_transcode_character_lowercase
    assert_equal "B", @machine.transcode_character("h")
  end

  def test_transcode_string_uppercase
    assert_equal "BCDDA", @machine.transcode_string("HELLO")
  end

  def test_transcode_string_lowercase
    assert_equal "BCDDA", @machine.transcode_string("hello")
  end

  def test_transcode_string_with_whitespace
    assert_equal "BCDDA", @machine.transcode_string(" h e LL o ")
  end

  def test_transcode_string_with_punctuation
    assert_equal "BCDDA", @machine.transcode_string(" ? / >.<, h |\\ e `¬¦ L!\"£L $%^o &*()_+-={}[]:@~;'#")
  end
end
