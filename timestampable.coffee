af = Package['aldeed:autoform']
c2 = Package['aldeed:collection2']
SimpleSchema = Package['aldeed:simple-schema']?.SimpleSchema

defaults =
  createdAt: 'createdAt'
  createdBy: 'createdBy'
  updatedAt: 'updatedAt'
  updatedBy: 'updatedBy'
  systemId: '0'

behaviour = (options = {}) ->
  check options, Object

  {createdAt, createdBy, updatedAt, updatedBy, systemId} =
    _.defaults options, @options, defaults

  if c2?
    afDefinition = autoform:
      omit: true

    addAfDefs = (definition) ->
      _.extend definition, afDefinition

    definition = {}

    if createdAt
      def = definition[createdAt] =
        optional: true
        type: Date

      addAfDefs def if af?

    regEx = new RegExp "(#{SimpleSchema.RegEx.Id.source})|^#{systemId}$"

    if createdBy
      def = definition[createdBy] =
        optional: true
        regEx: regEx
        type: String

      addAfDefs def if af?

    if updatedAt
      def = definition[updatedAt] =
        denyInsert: true
        optional: true
        type: Date

      addAfDefs def if af?

    if updatedBy
      def = definition[updatedBy] =
        denyInsert: true
        optional: true
        regEx: regEx
        type: String

      addAfDefs def if af?

    @collection.attachSchema new SimpleSchema definition

  isLocalCollection = @collection._connection is null

  if Meteor.isServer or isLocalCollection
    @collection.before.insert (userId = systemId, doc) ->
      if createdAt
        doc[createdAt] = new Date
      if createdBy and not doc[createdBy]?
        doc[createdBy] = userId

    @collection.before.update (userId = systemId, doc, fieldNames, modifier,
      options) ->

      $set = modifier.$set ?= {}

      if updatedAt
        $set[updatedAt] = new Date
      if updatedBy and not $set[updatedBy]?
        $set[updatedBy] = userId

CollectionBehaviours.define 'timestampable', behaviour
