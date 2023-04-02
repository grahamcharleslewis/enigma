# frozen_string_literal: true

require "test_helper"
require "enigma/machine"

class TestEnigma < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Enigma::VERSION
  end

  def test_it_transcodes_and_decodes_hello
    machine = Machine.new
    machine.configure(%w[I II III], "A")
    encoded = machine.transcode_string("Hello World, how are you?")
    decoded = machine.transcode_string(encoded)
    assert_equal "BCDDAVAKDLBAVOKCGAJ", encoded
    assert_equal "HELLOWORLDHOWAREYOU", decoded
  end
end
