idBox = require("components/id_box")
// React = require("React")

document.addEventListener('DOMContentLoaded', function() {
  idBoxFactory = React.createFactory(idBox)
  React.render(idBoxFactory(), document.getElementById("main-box"))
}, false);
