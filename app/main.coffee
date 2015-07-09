mainBox = require("components/main_box")
nations = require("data").nations

mainBoxFactory = React.createFactory(mainBox)

document.addEventListener 'DOMContentLoaded', ->
  React.render(mainBoxFactory(nations: nations), document.getElementById("wrapped-react-box"))
, false
