# cr-pipeline

A basic pipeline implementation in Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  cr-pipeline:
    github: bluematt/cr-pipeline
```

## Usage

```crystal
require "cr-pipeline"

class Doubler
  include PipelineAction
  def invoke(payload)
    payload * 2
  end
end

class Duplicator
  include PipelineAction
  def invoke(payload)
    "#{payload},#{payload}"
  end
end

p_prime = Pipeline.new << Doubler.new
p = Pipeline.new << Doubler.new << p_prime << Duplicator.new << Duplicator.new
puts p.process(2) #=> "8,8,8,8"
```

## Development

```bash
$ crystal spec
```

## Contributing

1. Fork it ( https://github.com/bluematt/cr-pipeline/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [bluematt](https://github.com/bluematt) bluematt - creator, maintainer
