af = Package['aldeed:autoform']
c2 = Package['aldeed:collection2']
ss = Package['aldeed:simple-schema']

defaults =
  createdAt: 'createdAt'
  createdBy: 'createdBy'
  updatedAt: 'updatedAt'
  updatedBy: 'updatedBy'

behaviour = (options = {}) ->

  {clientOnly, createdAt, createdBy, updatedAt, updatedBy} =
    _.defaults options, defaults

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

    if createdBy
      def = definition[createdBy] =
        optional: true
        regEx: new RegExp "(#{SimpleSchema.RegEx.Id.source})|^0$"
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
        regEx: new RegExp "(#{SimpleSchema.RegEx.Id.source})|^0$"
        type: String

      addAfDefs def if af?

      addC2Defs def if c2?

    @attachSchema new SimpleSchema definition

  isLocalCollection = @_connection is null

  if Meteor.isServer or isLocalCollection
    @before.insert (userId = '0', doc) ->
      if createdAt
        doc[createdAt] = new Date
      if createdBy and not doc[createdBy]?
        doc[createdBy] = userId

    @before.update (userId = '0', doc, fieldNames, modifier, options) ->
      $set = modifier.$set ?= {}

      if updatedAt
        $set[updatedAt] = new Date
      if updatedBy and not doc[updatedBy]?
        $set[updatedBy] = userId

CollectionBehaviours.define 'timestampable', behaviour
