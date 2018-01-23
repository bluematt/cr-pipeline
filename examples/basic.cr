require "../src/pipeline"

# Doubles the value of *payload*. Assumes some kind of numeric value.
class Doubler
  include PipelineAction

  # The invoker
  def invoke(payload)
    payload * 2
  end
end

# Duplicates the value of *payload*. Assumes some kind of stringable value.
class Duplicator
  include PipelineAction

  # The invoker
  def invoke(payload)
    "#{payload},#{payload}"
  end
end

# A secondary pipeline that doubles the value of *payload* which we will call
# later.
p_prime = Pipeline.new << Doubler.new
# The main pipeline that doubles *payload*, passes it through `p_prime`, and
# then duplicates it twice.
p = Pipeline.new << Doubler.new << p_prime << Duplicator.new << Duplicator.new
puts p.process(2) # => "8,8,8,8"
