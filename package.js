Package.describe({
  git: 'https://github.com/zimme/meteor-collection-timestampable',
  name: 'zimme:collection-timestampable',
  summary: 'Add timestamps to collections',
  version: '1.0.1'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');

  api.use([
    'coffeescript',
    'underscore'
  ]);

  api.use([
    'matb33:collection-hooks@0.7.6',
    'zimme:collection-behaviours@1.0.0'
  ]);

  api.use([
    'aldeed:autoform@4.0.0',
    'aldeed:collection2@2.0.0',
    'aldeed:simple-schema@1.0.3'
  ], ['client', 'server'], {weak: true});

  api.addFiles('timestampable.coffee');
});
