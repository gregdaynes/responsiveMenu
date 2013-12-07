var detectDevice, menuLabel, root;

detectDevice = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);

if (detectDevice) {
  root = document.documentElement;
  root.classList.add('device');
  DEBUG && console.log('Mobile/Handheld device');
}

menuLabel = document.getElementById('megamenu__handler');

menuLabel.addEventListener("click", function(event) {
  if (menuLabel.checked === true) {
    document.body.classList.add('disable-scroll');
    return;
  }
  return document.body.classList.remove('disable-scroll');
});

/*
//@ sourceMappingURL=megamenu.js.map
*/