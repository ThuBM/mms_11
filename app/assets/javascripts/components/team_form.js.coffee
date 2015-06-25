@TeamForm = React.createClass
  getInitialState: ->
    name: ''
    leader_id: ''
    description: ''
    member_ids: []

  valid: ->
    @state.name

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {team: @state}, (data) =>
      @props.handleNewTeam data
      @setState @getInitialState()
    , 'JSON'

  handleDescription: (e) ->
    e.preventDefault()
    @setState description: e.target.value

  onLeaderChange: (e) ->
    e.preventDefault()
    @setState leader_id: e.target.value
    $.ajax
      url: "/admin/teams"
      type: "POST"
      data:
        leader_id: e.target.value
      success: (data, status, response) ->
        alert data

  onCheckChange: (e) ->
    e.preventDefault()
    member_ids = @state.member_ids.slice()
    member_ids.push e.target.checked
    @setState member_ids: member_ids

  onCheckMember: (e) ->
    member_ids = @state.member_ids.slice()
    if e.target.value not in member_ids
      member_ids.push e.target.value
    else
      i = member_ids.indexOf(e.target.value)
      member_ids.splice(i, 1)
    @setState member_ids: member_ids

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'skills'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: I18n.t "team.name"
          name: 'name'
          value: @state.name
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: I18n.t "team.description"
          name: 'description'
          onChange: @handleDescription
        React.DOM.select
          className: "form-control select"
          name: "leader_id"
          for user in @props.users
            React.DOM.option
              value: user.id
              user.name
        React.DOM.div
          className: "col-md-10 members-list"
          React.DOM.table
            className: "table"
            for user in @props.users
              React.DOM.tr null,
                React.DOM.td null, user.name
                React.DOM.td null,
                  React.DOM.input
                    type: "checkbox"
                    name: "team[member_ids][]"
                    value: user.id
                    onChange: @onCheckMember

      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        I18n.t "team.create"
