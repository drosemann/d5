(function () {
  var catalog = window.SHADOWCORE_CATALOG || [];
  var grid = document.getElementById('grid');
  var q = document.getElementById('q');
  var cat = document.getElementById('cat');
  var stack = document.getElementById('stack');
  var count = document.getElementById('count');

  var cats = [];
  catalog.forEach(function (p) { if (cats.indexOf(p.category) === -1) cats.push(p.category); });
  cats.sort();
  cats.forEach(function (c) {
    var o = document.createElement('option');
    o.value = c; o.textContent = c || '(root)';
    cat.appendChild(o);
  });

  function render() {
    var needle = q.value.trim().toLowerCase();
    var shown = catalog.filter(function (p) {
      if (cat.value && p.category !== cat.value) return false;
      if (stack.value && p.stack.indexOf(stack.value) === -1) return false;
      if (needle && (p.name + ' ' + p.category + ' ' + p.stack + ' ' + p.slug).toLowerCase().indexOf(needle) === -1) return false;
      return true;
    });
    count.textContent = shown.length + ' of ' + catalog.length + ' projects';
    grid.innerHTML = '';
    shown.forEach(function (p) {
      var el = document.createElement('article');
      el.className = 'project';
      var readme = p.hasReadme
        ? '<p class="meta"><a href="../' + p.path + '/">Open project folder</a> (README inside)</p>'
        : '<p class="meta">No README in the original repo.</p>';
      el.innerHTML =
        '<h2></h2>' +
        '<p class="meta"></p>' +
        '<p class="meta"></p>' +
        '<p class="status"></p>' + readme +
        '<p class="meta">License: ' + (p.hasLicense ? 'see ALL-LICENSES.md and the project folder' : 'none found') + '</p>';
      el.querySelector('h2').textContent = p.name;
      var metas = el.querySelectorAll('.meta');
      metas[0].textContent = p.category || '(root)';
      metas[1].textContent = 'Stack: ' + p.stack + ' · ' + p.path;
      el.querySelector('.status').textContent = p.status;
      grid.appendChild(el);
    });
    if (!shown.length) {
      grid.innerHTML = '<p>No projects match.</p>';
    }
  }

  q.addEventListener('input', render);
  cat.addEventListener('change', render);
  stack.addEventListener('change', render);
  render();
})();
