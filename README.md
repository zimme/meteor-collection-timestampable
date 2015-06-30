[![Gitter][Gitter Badge]][Gitter]
[![Code Climate][Code Climate Badge]][Code Climate]
[![License][License Badge]][License]

# Timestamps for collections

Add timestamps to collections.

### Install
```sh
meteor add zimme:collection-timestampable
```

### Usage

Basic usage examples.

#### Attach

```js
Posts = new Mongo.Collection('posts');

// Attach behaviour with the default options
Posts.attachBehaviour('timestampable');

// Attach behaviour with custom options
Posts.attachBehaviour('timestampable', {
  createdAt: 'insertedAt',
  createdBy: 'insertedBy',
  updatedAt: 'modifiedAt',
  updatedBy: false
});
```
Using `CollectionBehaviours.attach` you can also attach a behaviour to multiple
collections. You can also add multiple behaviours to a collection or add
multiple behaviours to multiple collections.

Please see [`zimme:collection-behaviours`][CollectionBehaviours] for more
info on attaching behaviours to collections.

#### Insert

Examples are using default options.

```js
Posts.insert({
  title: 'Awesome post title',
  body: 'A really informative post.'
});

// Inserted document
{
  "_id": "J9frYKmxaowznW3yM",
  "createdAt": "2015-04-28T19:31:28.065Z",
  "createdBy": "0",
  "body": "A really informative post.",
  "title": "Awesome post title",
}
```

#### Update

Examples are using default options.

```js
Posts.update({_id: 'J9frYKmxaowznW3yM'}, {
  $set: {
    title: 'More awesome post title'
  }
});

// Updated document
{
  "_id": "J9frYKmxaowznW3yM",
  "createdAt": "2015-04-28T19:31:28.065Z",
  "createdBy": "0",
  "body": "A really informative post.",
  "updatedAt": "2015-04-28T19:51:20.047Z",
  "updatedBy": "0",
  "title": "Awesome post title",
}
```

### Options

The following options can be used:

* `createdAt`: Optional. Set to `'string'` to change the fields name.
  Set to `false` to omit field.

* `createdBy`: Optional. Set to `'string'` to change the fields name.
  Set to `false` to omit field.

* `updatedAt`: Optional. Set to `'string'` to change the fields name.
  Set to `false` to omit field.

* `updatedBy`: Optional. Set to `'string'` to change the fields name.
  Set to `false` to omit field.

* `systemId`: Optional. Set to `'string'` to change the id representing the
  system.

### Global configuration

The global configuration for this package should be in shared code, preferably
in a `lib` folder.

```js
// Configure behaviour globally
// All collection using this behaviour will use these settings as defaults
// The settings below are the package default settings
CollectionBehaviours.configure('timestampable',{
  createdAt: 'createdAt',
  createdBy: 'createdBy',
  updatedAt: 'updatedAt',
  updatedBy: 'updatedBy',
  systemId: '0'
});
```

### Notes

* This package attaches a schema to the collection(s) if `aldeed:collection2` is
used by the application. If `aldeed:autoform` is available too, it adds
`aldeed:autoform` specific schema definitions

[Code Climate]: https://codeclimate.com/github/zimme/meteor-collection-timestampable
[Code Climate Badge]: http://img.shields.io/codeclimate/github/zimme/meteor-collection-timestampable.svg
[CollectionBehaviours]: https://atmospherejs.com/zimme/collection-behaviours
[Gitter]: https://gitter.im/zimme/meteor-collection-timestampable
[Gitter Badge]: https://img.shields.io/badge/gitter-join_chat-brightgreen.svg
[License]: https://github.com/zimme/meteor-collection-timestampable/blob/master/LICENSE.md
[License Badge]: https://img.shields.io/badge/license-MIT-blue.svg
