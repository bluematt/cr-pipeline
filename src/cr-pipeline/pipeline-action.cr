# Acts as an interface for actions to be processed by a `Pipeline`.
module PipelineAction
  # The method called by the `Pipeline`.
  #
  # *payload* is passed from the `Pipeline` to the `PipelineAction`,
  # somepayload done with/to it, and should be returned.
  abstract def invoke(payload : Object) : Object
end
