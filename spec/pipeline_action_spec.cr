require "./spec_helper"

describe NullPipelineAction do
  it "should be a PipelineAction" do
    NullPipelineAction.new.should be_a PipelineAction
  end

  it "should respond to `invoke`" do
    NullPipelineAction.new.responds_to?(:invoke).should be_true
  end

  it "should return a true value passed to it" do
    NullPipelineAction.new.invoke(true).should be_true
  end

  it "should return a nil value passed to it" do
    NullPipelineAction.new.invoke(nil).should be_nil
  end

  it "should return a string value passed to it" do
    NullPipelineAction.new.invoke("foo").should eq "foo"
  end
end

describe DoublerPipelineAction do
  it "should be a PipelineAction" do
    DoublerPipelineAction.new.should be_a PipelineAction
  end

  it "should respond to `invoke`" do
    DoublerPipelineAction.new.responds_to?(:invoke).should be_true
  end

  it "should double a numeric value passed to it (2)" do
    DoublerPipelineAction.new.invoke(2).should eq 4
  end

  it "should double a numeric value passed to it (-2)" do
    DoublerPipelineAction.new.invoke(-2).should eq -4
  end

  it "should double a string value passed to it (foo)" do
    DoublerPipelineAction.new.invoke("foo").should eq "foofoo"
  end
end
