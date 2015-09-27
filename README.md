To install node projects: `make install`

Install Instructions

- wellington, `brew install --HEAD wellington` (libsass 3.3 beta1)
- sassc, `brew install --HEAD sassc` (libsass 3.3 beta1)
- ruby-sass, `gem install sass` (3.4.18)

The benchmark passes 10 app.scss files to the processor for compilation. This file imports the bootstrap source. I originally did this with 100 app.scss, but postCSS was incredibly slow at just importing the partials (15minutes).

Results early 2015 Macbook Pro
=================================

| processor | seconds | % |
| ------------------------- | ----------:| :----------: |
| wt (multi-threaded)       |   0m0.354s | 2.7x faster  |
| wt (single-threaded       |   0m0.957s |              |
| sassc                     |   0m1.024s |              |
| node-sass                 |   0m3.429s | 3.6x slower  |
| compass                   |  0m12.002s | 12.5x slower |
| ruby sass                 |  0m12.848s | 13.4x slower |
| postCSS                   |  1m43.778s | 108x slower  |
