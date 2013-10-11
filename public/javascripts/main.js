function save_uri_in_localStorage() {
  // set server uri to localStorage
  localStorage.setItem('uri', document.getElementById('uri').value);
  return true;
}
function init() {
  if (document && document.getElementById) {
    // focus on query textarea
    document.getElementById('query').focus();
    // get server uri from localStorage
    document.getElementById('uri').value = localStorage.getItem('uri');
    // install save hooks when submiting query
    document.getElementById('form').onsubmit = save_uri_in_localStorage;
  }
}
window.onload = init;
