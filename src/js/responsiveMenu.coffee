# Global Variables
menuParents = document.getElementsByClassName('responsive-menu__list__item--parent')

# getParent
# Recursive selector
this.getParent = (el, tag) ->
  while el.parentNode
    el = el.parentNode

    if el.tagName is tag
      if el.classList.contains('responsive-menu__list__item--parent')
        el.classList.add('responsive-menu__list__item--parent-expanded')

  return null

# clickHandler
# detect clicks and process
this.clickHandler = ->
  event.preventDefault()
  this.focusIn(event)

# focusIn
# main focus function
# controls events
this.focusIn = (event) ->
  # Focused Element
  element = event.srcElement

  if element.parentNode.classList.contains('responsive-menu__list__item--parent-expanded')
    #console.log('has is-expanded')
    element.parentNode.classList.remove('responsive-menu__list__item--parent-expanded')
    return

  # find all expanded menus
  for expanded in menuParents when expanded.classList.contains('responsive-menu__list__item--parent-expanded')
    # remove expanded class
    expanded.classList.remove('responsive-menu__list__item--parent-expanded')

  # send to recursive expander
  this.getParent(element, "LI")


# Focus
document.addEventListener "focusin", (event) => this.focusIn(event)

# Click
for menuItem in menuParents
  menuItem.firstElementChild.addEventListener "click", (event) => this.clickHandler(event)