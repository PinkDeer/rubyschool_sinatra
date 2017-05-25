function something()
{
  var x = window.localStorage.getItem('key');

  x = x * 1 + 1;

  window.localStorage.setItem('key', x);

  alert(x);
}
