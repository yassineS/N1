{ContenteditableExtension} = require 'nylas-exports'

# This provides the default baisc formatting options for the
# Contenteditable using the declarative extension API.
#
# NOTE: Blockquotes get their own formatting in `BlockquoteManager`
class ParagraphFormatting extends ContenteditableExtension
  @keyCommandHandlers: =>
    "contenteditable:indent": @_onIndent
    "contenteditable:outdent": @_onOutdent

  @toolbarButtons: ({state}) => []

  @_onIndent: ({editor, event}) -> editor.indent()

  @_onOutdent: ({editor, event}) -> editor.outdent()

  # None of the paragraph formatting buttons need a custom component.
  #
  # They use the default <ToolbarButtons> component via the
  # `toolbarButtons` extension API.
  #
  # We can either return `null` or return the requsted object with no
  # component.
  @toolbarComponent: ({state}) =>
    component: null,
    props: {}

module.exports = ParagraphFormatting
