# durl-rails

dURL! For Rails!

This gem provides:

  * dURL

  See [VERSIONS.md](VERSIONS.md) to see which versions of durl-rails bundle which versions of dURL.

## Versions

```
patch version bump = updates to durl-rails, and patch-level updates to dURL
minor version bump = minor-level updates to dURL
major version bump = major-level updates to dURL and updates to rails which may be backwards-incompatible
```

## Installation

Gemfile

```ruby
gem "durl-rails"
```

And run `bundle install`. The rest of the installation depends on whether the asset pipeline is being used.

### Rails 3.1 or greater (with asset pipeline *enabled*)

The dURL files will be added to the asset pipeline and available for you to use. add these lines to `app/assets/javascripts/application.js`:

```js
//= require durl
```

### Rails 3.0 (or greater with asset pipeline *disabled*)

This gem adds a single generator: `durl:install`. Running the generator will copy dURL to the `public/javascripts` directory.

This gem will also hook into the Rails configuration process, adding dURL to the javascript files included by the `javascript_include_tag(:defaults)` call. While this gem contains the minified and un-minified versions of dURL, only the minified versions will be included in the `:defaults` when Rails is run in `production` or `test` mode  (un-minified versions will be included when Rails is run in `development` mode).

To invoke the generator, run:

```sh
rails generate durl:install
```

You're done!

## Contributing

Feel free to open an issue ticket if you find something that could be improved. 

## Acknowledgements

This gem's structure and technique for wrapping a JS library into a rails friendly package is based entirely on jquery-rails. Many thanks are due to all of [the jquery-rails contributors](https://github.com/rails/jquery-rails/graphs/contributors).

Copyright Tyler Kasten, released under the MIT License.
