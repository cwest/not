# Updating `jasmine-jquery.js`

This package can't be installed from `rails-assets` because it relies on the `jasmine` package, which relies on
`compass`.

To update to the latest run the rake task:

```shell
$ rake jasmine_jquery.update
```
