@UserRole = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      role: React.findDOMNode(@refs.role).value
    $.ajax
      method: 'PUT'
      url: "/admin/users/#{@props.user.id}"
      dataType: 'JSON'
      data:
        user: data
      success: (data) =>
        @setState edit: false
        @props.handleEditUser @props.user, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/admin/users/#{@props.user.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteUser @props.user

  userShow: ->
    React.DOM.div
      className: 'list-group-item'
      @props.user.name
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          I18n.t "skill.edit_link"
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          I18n.t "skill.delete_link"

  userEdit: ->
    React.DOM.div
      className: "usersss"
      React.DOM.input
        className: "form-control"
        type: "text"
        defaultValue: @props.user.name
        ref: "name"
      React.DOM.input
        type: 'text'
        className: 'form-control'
        defaultValue: @props.user.email
        ref: "email"
      React.DOM.input
        type: 'text'
        className: 'form-control'
        name: 'role'
        defaultValue: @props.user.role
        ref: "role"
      React.DOM.a
        className: 'btn btn-default'
        onClick: @handleEdit
        I18n.t "user.update"
      React.DOM.a
        className: 'btn btn-danger'
        onClick: @handleToggle
        I18n.t "user.cancel"

  render: ->
    if @state.edit
      @userEdit()
    else
      @userShow()
