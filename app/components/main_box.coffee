IDBox = require('components/id_box')
SelectionCountryBox = require('components/select_country_box')
TableBox = require('components/table_box')
shuffle = window.knuthShuffle

IDBoxFactory = React.createFactory(IDBox)
SelectionCountryBoxFactory = React.createFactory(SelectionCountryBox)
TableBoxFactory = React.createFactory(TableBox)

testData =
  players: [
    {name: "player-1", id: 1},
    {name: "player-2", id: 2},
    {name: "player-3", id: 3}
  ]
  countrySlots: [
    [
      {id: 1, name: "后魏"}
      {id: 2, name: "前魏"}
      {id: 3, name: "后魏"}
    ]
    [
      {id: 4, name: "前魏"}
      {id: 5, name: "后魏"}
      {id: 6, name: "前魏"}
      {id: 7, name: "后魏"}
    ]
    [
      {id: 8, name: "前魏"}
      {id: 9, name: "前魏"}
      {id: 10, name: "后魏"}
    ]
  ]

MainBox = React.createClass
  displayName: "main box"

  setupIdList: (idList) ->
    mainCountries = shuffle([[0, 1], [2, 3], [4, 5]])
    otherCountries = shuffle([6, 7, 8, 9, 10, 11])
    countrySlots = (mainCountries[i].concat([otherCountries[i], otherCountries[i+1]]) for i in [0..2])
    randomSlot = Math.floor(Math.random() * 3)
    countrySlots[randomSlot] = countrySlots[randomSlot].concat([12])
    shuffledList = shuffle([0..idList.length-1])
    @setState(currentStage: 1, idList: idList, shuffledList: shuffledList, countrySlots: countrySlots)

  setupNameList: (selectedCountries) ->
    roleList = []
    playerAmount = @state.idList.length
    shuffledList = @state.shuffledList
    console.log selectedCountries
    for i in [0..2]
      for j in [0..6]
        roleList[shuffledList[i * 7 + j]] = @props.nations[selectedCountries[i]].roles[j]

    for i in [21..playerAmount-1]
      roleList[shuffledList[i]] = "在野 #{i-20}"

    @setState(currentStage: 2, roleList: roleList)

  selectCountryPlayers: ->
    [@state.idList[@state.shuffledList[0]], @state.idList[@state.shuffledList[7]], @state.idList[@state.shuffledList[14]]]

  getInitialState: ->
    currentStage: 0
    idList: []
    shuffledList: []
    roleList: []
    selectedCountries: []
    countrySlots: []

  render: ->
    switch @state.currentStage
      when 0 then IDBoxFactory(nextStage: @setupIdList)
      when 1 then SelectionCountryBoxFactory
        players: @selectCountryPlayers()
        countrySlots: @state.countrySlots
        nations: @props.nations
        onSubmit: @setupNameList
      when 2 then TableBoxFactory(idList: @state.idList, roleList: @state.roleList)

module.exports = MainBox
