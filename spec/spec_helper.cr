require "spec"
require "../src/pipeline"

# A simple test `PipelineAction` that returns the *payload*.
class NullPipelineAction
  include PipelineAction

  def invoke(payload)
    payload
  end
end

# A simple test `PipelineAction` that doubles the *payload*.
class DoublerPipelineAction
  include PipelineAction

  def invoke(payload)
    payload * 2
  end
end
