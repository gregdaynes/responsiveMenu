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





# megamenu = document.getElementsByClassName 'megamenu'
# megamenu__panels = document.getElementsByClassName 'megamenu__panel'
# for panel in megamenu__panels
#   panel.style.width=megamenu[0].offsetWidth + 'px'
# DEBUG && console.log megamenu[0].offsetWidth