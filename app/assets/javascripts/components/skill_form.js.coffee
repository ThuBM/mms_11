@SkillForm = React.createClass
  getInitialState: ->
    name: ''

  valid: ->
    @state.name

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {skill: @state}, (data) =>
      @props.handleNewSkill data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'skills'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create skill'
