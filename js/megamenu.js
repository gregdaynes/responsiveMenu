var detectDevice, item, megaMenu, menu, menuItems, menuLabel, root, _i, _j, _len, _len1, _this;

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

this.getParent = function(el, tag, newClass, task) {
  while (el.parentNode) {
    el = el.parentNode;
    if (el.tagName === tag) {
      if (task === "add") {
        el.classList.add(newClass);
      } else {
        el.classList.remove(newClass);
      }
    }
  }
  return null;
};

megaMenu = document.getElementsByClassName("megamenu");

for (_i = 0, _len = megaMenu.length; _i < _len; _i++) {
  menu = megaMenu[_i];
  _this = this;
  menuItems = menu.getElementsByTagName("A");
  for (_j = 0, _len1 = menuItems.length; _j < _len1; _j++) {
    item = menuItems[_j];
    item.addEventListener("focusin", function(event) {
      var element;
      element = event.srcElement;
      return _this.getParent(element, "LI", "has-focus", "add");
    });
    item.addEventListener("focusout", function(event) {
      var element;
      element = event.srcElement;
      return _this.getParent(element, "LI", "has-focus", "remove");
    });
  }
}

/*
//@ sourceMappingURL=megamenu.js.map
*/