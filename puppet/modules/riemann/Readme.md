## Riemann
- http://aphyr.github.com/riemann/index.html


Riemann aggregates events from your servers and applications with a powerful stream processing language. Send an email for every exception raised by your code. Track the latency distribution of your web app. See the top processes on any host, by memory and CPU. Combine statistics from every Riak node in your cluster and forward to Graphite. Send alerts when a key process fails to check in. Know how many users signed up right this second.

- web ui (sinatra) (riemann-dash)
- clients (many langs)
- ruby-client for any app

## Classes:
- riemann : the actual service for collection/aggregating/alerting
- riemann::dashboard: WEB GUI
- riemann::health: daemon, that reports health to riemann
- riemann::riemann_tools: a set of tools for riemann

## Introduction Videos:
  - http://vimeo.com/45807716 (Kyle Kingsbury (@aphyr) presents Riemann)