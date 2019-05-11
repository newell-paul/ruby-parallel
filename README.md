# AUTOMATION - ITERATE OVER A SITEMAP CONCURRENTLY
How to iterate over a sitemap concurrently using Ruby and Parallel gem.

Automation tests can be very slow and tests that operate under the UI layer are generally much faster than front end tests. if your test has to iterate over a large data file like a sitemap then they can be painfully slow as well but help is at hand with the Parallel gem 

https://github.com/grosser/parallel

Which you can use to iterate concurrently over arrays like this
```
Parallel.map_with_index(links, in_threads: 10) do |link, index|
```    
