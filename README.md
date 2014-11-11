# Collection-timestampable

Add timestamps to collections

## Usage

```js
Posts = new Mongo.Collection('posts');

// Default options
Posts.attachBehaviour('timestampable');

// Custom options
Posts.attachBehaviour('timestampable', {
  createdAt: 'insertedAt'
  createdBy: 'insertedBy'
  updatedAt: 'modifiedAt'
  updatedBy: false
});
```

## Options

Available options are:

`createdAt, createdBy, updatedAt, updatedBy`

Valid values:

`'string'` will be used as field name.  
`false` field will be omitted.
