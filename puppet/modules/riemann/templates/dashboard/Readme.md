zwily: aphyr: what do the darkened bars inside the bars on the dashboard mean? http://cl.ly/image/0k380d0I223T
aphyr: zwily: they're a fraction
[12:01am] aphyr: What they're a fraction *of* depends on the "max" setting in the grid.
[12:01am] aphyr: If you say "all" it's the maximum of all metrics.
[12:01am] aphyr: If you say "service" it's the maximum of all metrics from events with the same service
[12:01am] aphyr: ditto for "host"
[12:02am] aphyr: and if you give a number, it's that number
[12:02am] aphyr: It totally could be a rndering bug too
[12:03am] aphyr: Might take a look at the css properties on that element, see what percentage it claims to be
[12:20am] zwily: thanks aphyr
[12:21am] zwily: (I don't understand yet, but I'll try to figure it out tonight)