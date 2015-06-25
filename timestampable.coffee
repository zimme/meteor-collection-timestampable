af = Package['aldeed:autoform']
c2 = Package['aldeed:collection2']
ss = Package['aldeed:simple-schema']

defaults =
  createdAt: 'createdAt'
  createdBy: 'createdBy'
  updatedAt: 'updatedAt'
  updatedBy: 'updatedBy'
  systemId: '0'

behaviour = (options = {}) ->

  {createdAt, createdBy, updatedAt, updatedBy, systemId} =
    _.defaults options, @options, defaults

  if ss?
    SimpleSchema = ss.SimpleSchema

    afDefinition = autoform:
      omit: true

    addAfDefs = (definition) ->
      _.extend definition, afDefinition

    c2Definition =
      denyInsert: true

    addC2Defs = (definition) ->
      _.extend definition, c2Definition

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
        optional: true
        type: Date

      addAfDefs def if af?

      addC2Defs def if c2?

    if updatedBy
      def = definition[updatedBy] =
        optional: true
        regEx: regEx
        type: String

      addAfDefs def if af?

      addC2Defs def if c2?

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
