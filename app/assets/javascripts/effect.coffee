`!function(a){function f(a,b){if(!(a.originalEvent.touches.length>1)){a.preventDefault();var c=a.originalEvent.changedTouches[0],d=document.createEvent("MouseEvents");d.initMouseEvent(b,!0,!0,window,1,c.screenX,c.screenY,c.clientX,c.clientY,!1,!1,!1,!1,0,null),a.target.dispatchEvent(d)}}if(a.support.touch="ontouchend"in document,a.support.touch){var e,b=a.ui.mouse.prototype,c=b._mouseInit,d=b._mouseDestroy;b._touchStart=function(a){var b=this;!e&&b._mouseCapture(a.originalEvent.changedTouches[0])&&(e=!0,b._touchMoved=!1,f(a,"mouseover"),f(a,"mousemove"),f(a,"mousedown"))},b._touchMove=function(a){e&&(this._touchMoved=!0,f(a,"mousemove"))},b._touchEnd=function(a){e&&(f(a,"mouseup"),f(a,"mouseout"),this._touchMoved||f(a,"click"),e=!1)},b._mouseInit=function(){var b=this;b.element.bind({touchstart:a.proxy(b,"_touchStart"),touchmove:a.proxy(b,"_touchMove"),touchend:a.proxy(b,"_touchEnd")}),c.call(b)},b._mouseDestroy=function(){var b=this;b.element.unbind({touchstart:a.proxy(b,"_touchStart"),touchmove:a.proxy(b,"_touchMove"),touchend:a.proxy(b,"_touchEnd")}),d.call(b)}}}(jQuery);`

$ -> 
	$('#cart li').draggable
	  helper: 'clone'
	  cursor: 'move'
	  appendTo: 'body'
	$('#products #catalog #place').droppable
	  activeClass: 'ui-state-default'
	  hoverClass: 'ui-state-hover'
	  accept: ':not(ol)'
	  drop: (event, ui) ->
	    $('<ol></ol>', 'id': ui.draggable.attr('id'), 'class': "ui-draggable ui-draggable-handle").text(ui.draggable.text()).draggable({appendTo: 'body', helper: 'clone'}).appendTo($('#place'))
	    $('#effect ol ul#' + ui.draggable.attr('id')).remove()
	    $('#effect ol li#' + ui.draggable.attr('id')).remove()
	    ui.draggable.remove()
	    return

$ ->
  $('#catalog').accordion()
  $('#catalog ol').draggable
    appendTo: 'body'
    helper: 'clone'
    cursor: 'move'
  $('#cart ol').droppable(
    activeClass: 'ui-state-default'
    hoverClass: 'ui-state-hover'
    accept: ':not(.ui-sortable-helper)'
    drop: (event, ui) ->
      $(this).find('.placeholder').remove()
      $('<li></li>', 'id': ui.draggable.attr('id')).text(ui.draggable.text()).appendTo this
      $('<li></li>', 'id': ui.draggable.attr('id')).appendTo('#effect ol').text ui.draggable.text()
      $('#effect ol').find('.placeholder').remove()
      $.getJSON 'actions/' + ui.draggable.attr('id') + '.json', (data) ->
        items = []
        $.each data.benefits, (key, val) ->
          items.push '<li>' + val.content + '</li>'
          return
        $.each data.defects, (key, val) ->
          items.push '<li>' + val.content + '</li>'
          return
        $('<ul/>',
          'class': 'my-new-list',
          'id' : ui.draggable.attr('id')
          html: items.join('')).appendTo '#effect ol'
        return
      ui.draggable.remove()
      return
  ).sortable
    items: 'li:not(.placeholder)'
    sort: ->
      # gets added unintentionally by droppable interacting with sortable
      # using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
      $(this).removeClass 'ui-state-default'
      return
  return