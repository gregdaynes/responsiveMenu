detectDevice = (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))

if detectDevice
  root = document.documentElement;
  root.classList.add 'device'

  DEBUG && console.log 'Mobile/Handheld device'




# Prevent document scrolling behind menu
menuLabel = document.getElementById 'megamenu__handler'

menuLabel.addEventListener "click", (event) ->
  if menuLabel.checked is true
    document.body.classList.add 'disable-scroll'
    return

  document.body.classList.remove 'disable-scroll'





# getParent - Recursive selector
this.getParent = (el, tag, newClass, task) ->
  while el.parentNode
    el = el.parentNode

    if el.tagName is tag
      if task is "add"
        el.classList.add(newClass)
      else
        el.classList.remove(newClass)

  return null


# Focus event
megaMenu = document.getElementsByClassName "megamenu"
for menu in megaMenu
  _this = this
  menuItems = menu.getElementsByTagName "A"
  for item in menuItems
    item.addEventListener "focusin", (event) ->
      element = event.srcElement
      _this.getParent(element, "LI", "has-focus", "add")

    item.addEventListener "focusout", (event) ->
      element = event.srcElement
      _this.getParent(element, "LI", "has-focus", "remove")








