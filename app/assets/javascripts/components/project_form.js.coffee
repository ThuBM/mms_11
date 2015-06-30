@Project = React.createClass
  getInitialState: ->
    name: ""
    abbreviation: ""
    start_date: ""
    end_date: ""
    leader_id: ""
    team_id: ""
    team: @props.teams.first
    members: []

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {project: @state, is_submit: true}, (data) =>
      @setState @getInitialState()
    , 'JSON'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  onTeamChange: (e) ->
    @setState team_id: e.target.value
    $.ajax
      url: "/admin/projects"
      type: "POST"
      data:
        team_id: e.target.value
        is_submit: false
      success: (data) =>
        users = data
        @setState members: users

  render: ->
    React.DOM.form
      className: "form-horizontal"
      onSubmit: @handleSubmit
      React.DOM.div
        className: "col-md-5 col-md-offset-1"
        React.DOM.h2
          I18n.t "project.basic_info"
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.name"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control"
              type: "text"
              placeholder: I18n.t "project.enter_name"
              name: "name"
              value: @state.name
              onChange: @handleChange
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.abbreviation"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control"
              type: "text"
              placeholder: I18n.t "project.enter_abbreviation"
              name: "abbreviation"
              value: @state.abbreviation
              onChange: @handleChange
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.start_date"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control date"
              type: "date"
              name: "start_date"
              value: @state.start_date
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.end_date"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control date"
              type: "date"
              name: "end_date"
              value: @state.end_date
      React.DOM.div
        className: "col-md-6"
        React.DOM.h2
          I18n.t "project.select_members"
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.select_teams"
          React.DOM.div
            className: "col-md-10"
            React.DOM.select
              onChange: @onTeamChange
              className: "form-control select"
              name: "team_id"
              for team in @props.teams
                React.DOM.option
                  value: team.id
                  team.name
      React.DOM.div
        className: "col-md-6"
        React.DOM.h2
          I18n.t "project.select_leader"
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.select_leader"
          React.DOM.div
            className: "col-md-10"
            React.DOM.select
              onChange: @handleChange
              className: "form-control select"
              name: "leader_id"
              for user in @state.members
                React.DOM.option
                  value: user.id
                  user.name
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.members"
          React.DOM.div
            className: "col-md-10 members-list"
            React.DOM.table
              className: "table"
              React.DOM.tbody null,
                for user in @state.members
                  React.DOM.tr null,
                    React.DOM.td null, user.name
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        I18n.t "team.create"
