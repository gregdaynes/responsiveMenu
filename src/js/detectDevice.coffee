detectDevice = (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))

if detectDevice
  root = document.documentElement;
  root.classList.add 'device'

  DEBUG && console.log 'Mobile/Handheld device'