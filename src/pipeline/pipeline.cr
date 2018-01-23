require "./pipeline-action"

# An [] of `PipelineAction`.
class Pipeline < Array(PipelineAction)
  # Is itself a `PipelineAction`, so `Pipeline`s can use other `Pipeline`s.
  include PipelineAction

  # Starts the `Pipeline`'s processing of *payload*.
  #
  # For each action, *payload* is returned.  This allows further processing if
  # *payload* is modified.
  #
  # Returns the processed *payload*.
  def process(payload)
    self.each do |c|
      payload = c.invoke(payload) if c.responds_to? :invoke
    end
    payload
  end

  # Overloads `PipelineAction::invoke` so that a `Pipeline` is itself a
  # `PipelineAction`.
  def invoke(payload)
    self.process(payload)
  end
end
