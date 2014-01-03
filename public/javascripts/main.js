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
document.getElementById('tab_json').onclick = function() {
  document.getElementById('data').style.display = 'none';
  document.getElementById('json').style.display = 'block';
  document.getElementById('tab_data').parentNode.classList.remove('active');
  document.getElementById('tab_json').parentNode.classList.add('active');
};
document.getElementById('tab_data').onclick = function() {
  document.getElementById('json').style.display = 'none';
  document.getElementById('data').style.display = 'block';
  document.getElementById('tab_json').parentNode.classList.remove('active');
  document.getElementById('tab_data').parentNode.classList.add('active');
};
