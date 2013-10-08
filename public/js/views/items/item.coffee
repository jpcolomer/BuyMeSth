class BuyMeSth.Views.ItemView extends Backbone.View
  tagName: 'li'
  className: 'row'
  template: _.template($('#item_view').html())

  render: ->
    @$el.html(@template(item: @model))
    this