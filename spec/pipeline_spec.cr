require "./spec_helper"

describe Pipeline do
  it "should do nothing with no PipelineActions" do
    Pipeline.new.process(2).should eq 2
  end

  it "should return the payload as-is with a NullPipelineAction" do
    p = Pipeline.new << NullPipelineAction.new
    p.process(2).should eq 2
  end

  it "should do double the payload passed to it with one Doubler" do
    p = Pipeline.new << DoublerPipelineAction.new
    p.process(2).should eq 4
  end

  it "should do quadruple the payload passed to it with two Doublers" do
    p = Pipeline.new << DoublerPipelineAction.new << DoublerPipelineAction.new
    p.process(2).should eq 8
  end
end
