Dom = React.DOM

IDBox = React.createClass
  displayName: "id box"

  render: ->
    Dom.div {id: "id-box", className: classNames('mdl-card', 'mdl-shadow--2dp')},
      Dom.div className: classNames('mdl-textfield', 'mdl-js-textfield'),
        Dom.textarea {className: 'mdl-textfield__input', type: "text", rows: "1", id: "id_text_area"}, null
        Dom.label {className: 'mdl-textfield__label', htmlFor: "id_text_area"},
          "在此粘贴所有 ID, 每行一个, 数量大于等于 21"

module.exports = IDBox
