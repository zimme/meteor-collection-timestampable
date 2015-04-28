[![Gitter](https://img.shields.io/badge/gitter-join_chat-brightgreen.svg)]
(https://gitter.im/zimme/meteor-collection-timestampable)
[![Code Climate](http://img.shields.io/codeclimate/github/zimme/meteor-collection-timestampable.svg)]
(https://codeclimate.com/github/zimme/meteor-collection-timestampable)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]
(https://github.com/zimme/meteor-collection-timestampable/LICENSE.md)

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

//Attach behaviour with the default options
Posts.attachBehaviour('timestampable');

//Attach behaviour with custom options
Posts.attachBehaviour('timestampable', {
  createdAt: 'insertedAt',
  createdBy: 'insertedBy',
  updatedAt: 'modifiedAt',
  updatedBy: false
});
```

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

```js
// Configure behaviour globally
// All collection using this behaviour will use these settings as defaults
// The settings below are the package default settings
CollectionBehaviours.configure('timestampable',{
  createdAt: 'createdAt',
  createdBy: 'createdBy',
  updatedAt: 'updatedAt',
  updatedBy: 'updatedAt',
  systemId: '0'
});
```

### Notes

* This package attaches a schema to the collection if `aldeed:simple-schema`,
  `aldeed:collection2` and/or `aldeed:autoform` are used in the application.
