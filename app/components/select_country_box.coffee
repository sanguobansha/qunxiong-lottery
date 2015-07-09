Dom = React.DOM

IDBox = React.createClass
  displayName: "select country box"

  getInitialState: ->
    selectedCountryId: [-1, -1, -1]

  onSubmit: (event) ->
    @props.onSubmit(@state.selectedCountryId)

  onChange: (index, selection_id) ->
    selectedCountryId = @state.selectedCountryId
    selectedCountryId[index] = selection_id
    @setState(selectedCountryId: selectedCountryId)

  radioArea: (index, playerName, selections, nations) ->
    selectionAmount = selections.length
    [
      Dom.label {key: "label-for-#{index}"}, "#{playerName}:"
      for i in [0..selectionAmount-1]
        Dom.label
          # className: classNames('mdl-checkbox', 'mdl-js-checkbox', 'mdl-js-ripple-effect')
          htmlFor: "option-for-#{index}"
          key: selections[i]
          Dom.input
            type: 'checkbox'
            id: "option-for-#{index}-#{i}"
            key: "option-for-#{index}-#{i}"
            className: "mdl-checkbox__input"
            name: "option-for-#{index}"
            value: "#{selections[i]}"
            checked: @state.selectedCountryId[index] == selections[i]
            onChange: @onChange.bind(null, index, selections[i])

          Dom.span
            className: "mdl-checkbox__label"
            key: "span-for-#{index}-#{i}",
            "#{nations[selections[i]].name}"
    ]

  render: ->
    Dom.div
      id: "select-country-box"
      className: classNames('mdl-card', 'mdl-shadow--2dp')
      [
        for i in [0..2]
          @radioArea(i, @props.players[i], @props.countrySlots[i], @props.nations)
        Dom.button
          className: "mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect"
          onClick: @onSubmit,
          disabled: @state.selectedCountryId.indexOf(-1) != -1
          "提交"
      ]

module.exports = IDBox
