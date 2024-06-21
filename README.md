# Clicksign Ruby Client

Fork of deprecated clicksign gem in Ruby.
Works on documentation version 2.0: Envelope

## Installation

With Bundler:

```
gem 'clicksign_ruby'
```

## Usage

### Setting up the client

You must provide a valid `token` in order to use the library.

The required `token` is provided by the Clicksign support team.

```ruby
require 'clicksign'

Clicksign.configure do |config|
  config.token = ENV['CLICKSIGN_TOKEN']
  config.environment = 'production'
end
```

### Create a envelope

You'll be able to make requests to the Clicksign API right after the initial setup. The first step would be createa a envelope that will contain the rest of the documents, signers and e.t.c.

For knowledge the permit parameters, visit [here](https://developers.clicksign.com/docs/criar-envelope)
```ruby
envelope = Clicksign::Envelope.create({
  name: ''
})
```

This request will return a id, save this key for later use
```ruby
@envelope_id = envelope["data"]["id"]
```

### Adding document

To upload a new document into Clicksign envelope you can use the following snippet:

```ruby
document = Clicksign::Document.new(@envelope_id).add({
  filename: '',
  content_base64: "data:#{}\;base64,#{}"
})
```

### Adding signers

To add a new signer into Clicksign envelope you can use the following snippet:

For knowledge the permit parameters, visit [here](https://developers.clicksign.com/docs/adicionar-novo-signat%C3%A1rio-no-envelope)
```ruby
signer = Clicksign::Signer.new(@envelope_id).add({})
```

### Webhooks

To works with webhooks i'm also recomendely to use a [nexoos gem](https://github.com/NexoosBR/clicksign-webhooks)
Provided me with everything I needed.

This gem also created for a necessit implement integration with clicksign, and i`ve found the [deprecated documentation](https://github.com/clicksign/clicksign-ruby), forked it and works to my specifications.
## CONTRIBUTE
