# frozen_string_literal: true

require "test_helper"
require "enigma/mapping"

class TestMapping < Minitest::Test
  def setup
    @valid_mapping = {
      A: "ZYXWVUTSRQPONMLKJIHGFEDCBA"
    }
  end

  def test_initialize_with_valid_mapping
    expected = {
      "A" => "Z", "B" => "Y", "C" => "X", "D" => "W", "E" => "V",
      "F" => "U", "G" => "T", "H" => "S", "I" => "R", "J" => "Q",
      "K" => "P", "L" => "O", "M" => "N", "N" => "M", "O" => "L",
      "P" => "K", "Q" => "J", "R" => "I", "S" => "H", "T" => "G",
      "U" => "F", "V" => "E", "W" => "D", "X" => "C", "Y" => "B",
      "Z" => "A"
    }

    mapping = Mapping.new(@valid_mapping, "A")
    assert_equal expected, mapping.mapping
  end

  def test_initialize_with_invalid_mapping_to_few
    mappings = {
      A: "ZYXWVUTSRQPONMLKJIHGFEDCB"
    }

    assert_raises StandardError do
      Mapping.new(mappings, "A")
    end
  end

  def test_initialize_with_invalid_mapping_to_many
    mappings = {
      A: "ZYXWVUTSRQPONMLKJIHGFEDCBA1"
    }

    assert_raises StandardError do
      Mapping.new(mappings, "A")
    end
  end

  def test_initialize_with_invalid_mapping_duplicate
    mappings = {
      A: "ZYXWVUTSRQPONMLKJIHGFEDCBAA"
    }

    assert_raises StandardError do
      Mapping.new(mappings, "A")
    end
  end

  def test_value_from_key
    mapping = Mapping.new(@valid_mapping, "A")
    assert_equal "S", mapping.value_from_key("H")
  end

  def test_key_from_value
    mapping = Mapping.new(@valid_mapping, "A")
    assert_equal "H", mapping.key_from_value("S")
  end
end
