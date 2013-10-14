function save_uri_in_localStorage() {
  // set form parameters to localStorage
  localStorage.setItem('uri', document.getElementById('uri').value);
  localStorage.setItem('query', document.getElementById('query').value);
  localStorage.setItem('node_id', document.getElementById('node_id').value);
  return true;
}
function init() {
  if (document && document.getElementById) {
    // focus on query textarea
    document.getElementById('query').focus();
    // get server uri from localStorage
    document.getElementById('uri').value = localStorage.getItem('uri');
    document.getElementById('query').value = localStorage.getItem('query');
    document.getElementById('node_id').value = localStorage.getItem('node_id');
    // install save hooks when submiting query
    document.getElementById('form').onsubmit = save_uri_in_localStorage;
  }
}
window.onload = init;
