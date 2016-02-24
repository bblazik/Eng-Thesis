`!function(a){function f(a,b){if(!(a.originalEvent.touches.length>1)){a.preventDefault();var c=a.originalEvent.changedTouches[0],d=document.createEvent("MouseEvents");d.initMouseEvent(b,!0,!0,window,1,c.screenX,c.screenY,c.clientX,c.clientY,!1,!1,!1,!1,0,null),a.target.dispatchEvent(d)}}if(a.support.touch="ontouchend"in document,a.support.touch){var e,b=a.ui.mouse.prototype,c=b._mouseInit,d=b._mouseDestroy;b._touchStart=function(a){var b=this;!e&&b._mouseCapture(a.originalEvent.changedTouches[0])&&(e=!0,b._touchMoved=!1,f(a,"mouseover"),f(a,"mousemove"),f(a,"mousedown"))},b._touchMove=function(a){e&&(this._touchMoved=!0,f(a,"mousemove"))},b._touchEnd=function(a){e&&(f(a,"mouseup"),f(a,"mouseout"),this._touchMoved||f(a,"click"),e=!1)},b._mouseInit=function(){var b=this;b.element.bind({touchstart:a.proxy(b,"_touchStart"),touchmove:a.proxy(b,"_touchMove"),touchend:a.proxy(b,"_touchEnd")}),c.call(b)},b._mouseDestroy=function(){var b=this;b.element.unbind({touchstart:a.proxy(b,"_touchStart"),touchmove:a.proxy(b,"_touchMove"),touchend:a.proxy(b,"_touchEnd")}),d.call(b)}}}(jQuery);`

$ ->
  # there's the gallery and the trash
  $gallery = $('#gallery')
  $trash = $('#trash')
  # let the gallery items be draggable

  PassingJson = (item) ->
    console.log item.find('h5').attr('id')
    $.getJSON '/symptom/' + item.find('h5').attr('id') + '.json', (data) ->
      items = []
      $.each data.actions, (key, val) ->
        items.push '<li>' + val.name + '</li>'
        return
      $('<ul/>',
        'id': item.find('h5').attr('id')
        html: items.join('')).appendTo '#effect ol'
      return
    return

  deleteImage = ($item) ->
    $item.fadeOut ->
      $list = if $('ul', $trash).length then $('ul', $trash) else $('<ul class=\'gallery ui-helper-reset\'/>').appendTo($trash)
      $item.find('a.ui-icon-trash').remove()
      $item.append(recycle_icon).appendTo($list).fadeIn ->
        $item.animate()
        return
      return
    PassingJson $item
    return

  recycleImage = ($item) ->
    $item.fadeOut ->
      $item.find('a.ui-icon-refresh').remove().end().append(trash_icon).find('img').end().appendTo($gallery).fadeIn()
      return
    RemovePassedJson $item
    return

  RemovePassedJson = (item) ->
    i = item.find('h5').attr('id')
    $('#effect ol ul#' + i).remove()
    return

  $('li', $gallery).draggable
    cancel: 'a.ui-icon'
    revert: 'invalid'
    containment: 'document'
    helper: 'clone'
    cursor: 'move'
    zIndex: 100
  # let the trash be droppable, accepting the gallery items
  $trash.droppable
    accept: '#gallery > li'
    hoverClass: 'drop-hover'
    tolerance: 'intersect'
    activeClass: 'ui-state-highlight'
    drop: (event, ui) ->
      deleteImage ui.draggable
      return
  # let the gallery be droppable as well, accepting items from the trash
  $gallery.droppable
    accept: '#trash li'
    activeClass: 'custom-state-active'
    tolerance: 'intersect'
    drop: (event, ui) ->
      recycleImage ui.draggable
      return
  # image deletion function
  recycle_icon = '<a href=\'link/to/recycle/script/when/we/have/js/off\' title=\'Recycle this image\' class=\'ui-icon ui-icon-refresh\'>Recycle image</a>'
  # image recycle function
  trash_icon = '<a href=\'link/to/trash/script/when/we/have/js/off\' title=\'Renew\' class=\'ui-icon ui-icon-trash\'>Delete image</a>'
  # resolve the icons behavior with event delegation
  $('ul.gallery > li').click (event) ->
    $item = $(this)
    $target = $(event.target)
    if $target.is('a.ui-icon-trash')
      deleteImage $item
    else if $target.is('a.ui-icon-zoomin')
      viewLargerImage $target
    else if $target.is('a.ui-icon-refresh')
      recycleImage $item
    false
  return