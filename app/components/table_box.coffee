Dom = React.DOM

IDBox = React.createClass
  displayName: "table box"

  render: ->
    playerAmount = @props.idList.length
    Dom.table {id: "table-box", className: "mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp"},
      Dom.head {}
        Dom.tr {}
          Dom.th className: 'mdl-data-table__cell--non-numeric', "ID"
          Dom.th className: 'mdl-data-table__cell--non-numeric', "身份"
      Dom.tbody {}
        for i in [0..playerAmount-1]
          Dom.tr {key: i},
            Dom.td className: 'mdl-data-table__cell--non-numeric', @props.idList[i]
            Dom.td className: 'mdl-data-table__cell--non-numeric', @props.roleList[i]

module.exports = IDBox
