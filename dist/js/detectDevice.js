var detectDevice,root;detectDevice=/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent),detectDevice&&(root=document.documentElement,root.classList.add("device"));