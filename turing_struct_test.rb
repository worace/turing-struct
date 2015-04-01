gem "minitest"
require_relative "turing_struct"
require "minitest/autorun"
require "minitest/spec"

describe TuringStruct do
  it "exposes hash keys as methods" do
    s = TuringStruct.new(:pizza => "face")
    assert_equal "face", s.pizza
  end

  it "allows method chaining to reach nested hash data" do
    s = TuringStruct.new(:pizza => {:hello => "world"})
    assert_equal "world", s.pizza.hello
  end

  it "still blows up if the method is not found in the hash" do
    s = TuringStruct.new(:pizza => {:hello => "world"})
    assert_raises NoMethodError do
      s.not_a_key
    end
  end

  it "allows deeply nested hashes" do
    s = TuringStruct.new(:pizza => {:hello => {:world => "val"}})
    assert_equal "val", s.pizza.hello.world
  end
end
