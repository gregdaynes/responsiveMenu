###
Nested Menus
###

# Global Variables
menuParents = document.getElementsByClassName('is-parent')
body = document.body


# getParent
# Recursive selector
this.getParent = (el, tag) ->
  while el.parentNode
    el = el.parentNode

    if el.tagName is tag
      if el.classList.contains('is-parent')
        el.classList.add('is-expanded')

  return null

# clickHandler
# detect clicks and process
this.clickHandler = ->
  event.preventDefault()
  this.focus(event)

# focusIn
# main focus function
# controls events
this.focus = (event) ->
  # Focused Element
  element = event.srcElement

  if element.parentNode.classList.contains('is-expanded')
    #console.log('has is-expanded')
    element.parentNode.classList.remove('is-expanded')
    return

  # find all expanded menus
  for expanded in menuParents when expanded.classList.contains('is-expanded')
    # remove expanded class
    expanded.classList.remove('is-expanded')

  # send to recursive expander
  this.getParent(element, "LI")


# Focus
document.addEventListener "focusin", (event) => this.focus(event)

# Click
for menuItemParent in menuParents
  menuItemParent.firstElementChild.addEventListener "click", (event) => this.clickHandler(event)



# Prevent document scrolling behind menu
menuLabel = document.getElementById 'responsive-menu__handler'

menuLabel.addEventListener "click", () ->
  if menuLabel.checked is true
    body.classList.add 'disable-scroll'
    return

  body.classList.remove 'disable-scroll'
