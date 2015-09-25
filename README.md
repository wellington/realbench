To get started use: `make install`

To test wellington, use `brew install --HEAD wellington`

The benchmark passes 10 app.scss files to the processor for compilation. This file imports the bootstrap source. I originally did this with 100 app.scss, but postCSS was incredibly slow at just importing the partials (15minutes).

Results early 2015 Macbook Pro
=================================

| processor | seconds | % |
| ----------------------- | -------:| :----------: |
| multi-threaded wellington|0m0.354s| 2.7x faster
| wellington|0m0.957s| |
| node-sass|0m3.429s                | 3.6x slower  |
| postCSS|1m43.778s                 | 108x slower  |
