class BuyMeSth.Views.MenuView extends Backbone.View
  className: 'row'
  template: _.template($('#menu_view').html())

  events:
    'click #solicitante': 'showRequestor'
    'click #comprador': 'showBuyer'

  render: ->
    @$el.append(@template())
    this

  showRequestor: (event) ->
    event.preventDefault()
    Backbone.history.navigate("", true)

  showBuyer: ->
    event.preventDefault()
    Backbone.history.navigate("comprador", true)