## [1.0.9]
  * Add missing dependency of the check package - [#15]
  * Document that global configuration belongs in `shared` code, preferably
  in a `lib` folder

## [1.0.8] - 2015-06-29
  * Check options argument

## [1.0.7] - 2015-06-28
  * Fix `.attachSchema` error when only having `aldeed:simple-schema` in project
  * Fix `updatedBy` never updating - [#9]
  * Update documentation
  * Add MIT license

## [1.0.6] - 2015-04-02
  * Fix links in CHANGELOG.md
  * Configurable systemId

## [1.0.5] - 2015-03-16
  * Update Gitter badge
  * Add support for `aldeed:autoform@5.0.0`

## [1.0.4] - 2015-02-05
  * Fix git url
  * Update `zimme:collection-behaviours` dependency

## [1.0.3] - 2014-11-18
  * Pass-through `zimme:collection-behaviours` to allow for
    `CollectionBehaviour.attach('timestampable', ...)`
  * Refactor package for use with new `zimme:collection-behaviours` api
  * Update `zimme:collection-behaviours` dependency

## [1.0.2] - 2014-11-18
  * Document that `aldeed:autoform`, `aldeed:collection2`,
    `aldeed:simple-schema` are used if available
  * Add Gitter badge
  * Add CodeClimate badge

## [1.0.1] - 2014-11-11
  * Update package summary
  * Remove clientOnly option which wasn't used
  * Add README.md

## 1.0.0 - 2014-11-11
  * Adds timestamps on insert and update
  * Adds ids of the user inserting or updating
  * Configurable field names
  * Optional fields

[1.0.9]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.8...1.0.9
[1.0.8]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.7...1.0.8
[1.0.7]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.6...1.0.7
[1.0.6]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.5...1.0.6
[1.0.5]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.4...1.0.5
[1.0.4]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.3...1.0.4
[1.0.3]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/zimme/meteor-collection-timestampable/compare/1.0.0...1.0.1

[#9]: https://github.com/zimme/meteor-collection-timestampable/issues/9
[#15]: https://github.com/zimme/meteor-collection-timestampable/issues/15
