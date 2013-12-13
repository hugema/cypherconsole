function save_uri_in_localStorage() {
  // set form parameters to localStorage
  localStorage.setItem('uri', document.getElementById('uri').value);
  localStorage.setItem('query', document.getElementById('query').value);
  localStorage.setItem('parameters', document.getElementById('parameters').value);
  return true;
}
function init() {
  if (document && document.getElementById) {
    // focus on query textarea
    document.getElementById('query').focus();
    // get server uri from localStorage
    document.getElementById('uri').value = localStorage.getItem('uri');
    document.getElementById('query').value = localStorage.getItem('query');
    document.getElementById('parameters').value = localStorage.getItem('parameters');
    // install save hooks when submiting query
    document.getElementById('form').onsubmit = save_uri_in_localStorage;
  }
}
window.onload = init;
