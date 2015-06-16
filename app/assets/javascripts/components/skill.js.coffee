@Skill = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name: React.findDOMNode(@refs.name).value
    $.ajax
      method: 'PUT'
      url: "/admin/skills/#{@props.skill.id}"
      dataType: 'JSON'
      data:
        skill: data
      success: (data) =>
        @setState edit: false
        @props.handleEditSkill @props.skill, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/admin/skills/#{@props.skill.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteSkill @props.skill

  skillDefault: ->
    React.DOM.div
      className: 'list-group-item'
      @props.skill.name
      React.DOM.a
        className: 'btn btn-default'
        onClick: @handleToggle
        I18n.t "skill.edit_link"
      React.DOM.a
        className: 'btn btn-danger'
        onClick: @handleDelete
        I18n.t "skill.delete_link"

  skillForm: ->
    React.DOM.div
      className: 'skills'
      React.DOM.input
        className: 'form-control'
        type: 'text'
        defaultValue: @props.skill.name
        ref: 'name'
      React.DOM.a
        className: 'btn btn-default'
        onClick: @handleEdit
        I18n.t "skill.update"
      React.DOM.a
        className: 'btn btn-danger'
        onClick: @handleToggle
        I18n.t "skill.cancel"

  render: ->
    if @state.edit
      @skillForm()
    else
      @skillDefault()
           