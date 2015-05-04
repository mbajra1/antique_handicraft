# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update = ->
  $.get '/bid_actions.json', null, (data, status, jqXHR) ->
    msgsSorted = _.sortBy data, (bid_action) ->
      new Date(bid_action.created_at).getTime() # get messages sorted by creation time ascending

    # refreshing messages list
    $('#chat').empty()
    for m in msgsSorted
      d = moment(m.created_at)
      $('#chat').append('<li>' +
        '<span class="created_at">' + d.format('hh:mm') + '</span>' +
        m.bidder_id +
        m.bid_amount +

        '</li>')

    setTimeout update, 750 # polling at least every 750 ms but don't overlap between requests

update()


