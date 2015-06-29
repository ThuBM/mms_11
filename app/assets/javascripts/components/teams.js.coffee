@Teams = React.createClass
  getInitialState: ->
    teams: @props.teams
  getDefaultProps: ->
    teams: []

  addTeam: (team) ->
    teams = @state.teams.slice()
    teams.push team
    @setState teams: teams

  render: ->
    React.DOM.div
      className: 'skills'
      React.DOM.h2
        "create teams"
        React.createElement TeamForm,
          users: @props.users,
          handleNewTeam: @addTeam
        React.DOM.hr null
