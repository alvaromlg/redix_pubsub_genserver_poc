# PubSub
Simple example setup for a genserver subscribed to a redix channel

## Installation

```elixir
mix deps.get
```

## Configure
Set redis host and subscription channel on config/config.exs, example:
```elixir
config :pubsub,
  redis_host: "redis://localhost:6379/0",
  channel: "mychannel"
```

## Launching
```elixir
iex -S mix
Erlang/OTP 22 [erts-10.5.6] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]
Interactive Elixir (1.12.1) - press Ctrl+C to exit (type h() ENTER for help)
Subscribed to mychannel
iex(1)> 
```

## Testing
Launch a redis-cli shell
```
$ redis-cli 
127.0.0.1:6379> PUBLISH mychannel "helloo"
(integer) 1
```

If everything is setup correctly you should see that message on the iex shell:
```elixir
iex(1)> Received message helloo from mychannel
```

## Some real cases
Imagine you want to subscribe to a redis channel and consume image filepaths and convert them to pdf

We can pass the image filepath (it could also be a s3 url, etc)
```
127.0.0.1:6379> PUBLISH mychannel data/img.jpg
```
We handle it and a pdf should be generated on data/img.pdf using ExMagick
