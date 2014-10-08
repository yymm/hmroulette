tid = 0;
function start_slot() {
  var menu = document.getElementsByClassName('menu');
  var n = menu.length;
  var r = Math.floor(Math.random(1)*n);
  var mstr = menu[r].innerHTML;
  document.getElementById('roulette').innerHTML = mstr;
  tid = setTimeout('start_slot()', 10);
}
function stop_slot() {
  clearTimeout(tid);
  alert(document.getElementById('roulette').innerHTML + '!!')
  document.getElementById('startbtn').disabled = false;
  document.getElementById('roulette').innerHTML = "Hotto Motto Roulette";
}
