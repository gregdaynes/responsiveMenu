var menuItem,menuParents,_i,_len,_this=this;for(menuParents=document.getElementsByClassName("responsive-menu__list__item--parent"),this.getParent=function(a,b){for(;a.parentNode;)a=a.parentNode,a.tagName===b&&a.classList.contains("responsive-menu__list__item--parent")&&a.classList.add("responsive-menu__list__item--parent-expanded");return null},this.clickHandler=function(){return event.preventDefault(),this.focusIn(event)},this.focusIn=function(a){var b,c,d,e;if(b=a.srcElement,b.parentNode.classList.contains("responsive-menu__list__item--parent-expanded"))return b.parentNode.classList.remove("responsive-menu__list__item--parent-expanded"),void 0;for(d=0,e=menuParents.length;e>d;d++)c=menuParents[d],c.classList.contains("responsive-menu__list__item--parent-expanded")&&c.classList.remove("responsive-menu__list__item--parent-expanded");return this.getParent(b,"LI")},document.addEventListener("focusin",function(a){return _this.focusIn(a)}),_i=0,_len=menuParents.length;_len>_i;_i++)menuItem=menuParents[_i],menuItem.firstElementChild.addEventListener("click",function(a){return _this.clickHandler(a)});