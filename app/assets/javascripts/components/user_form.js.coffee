@UserForm = React.createClass
  getInitialState: ->
    name: ''
    email: ''
    role: ''

  valid: ->
    @state.name

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', {user: @state}, (data) =>
      @props.handleNewUser data
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
          placeholder: I18n.t "user.name_default"
          name: 'name'
          value: @state.name
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: I18n.t "user.email_default"
          name: 'email'
          value: @state.email
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: I18n.t "user.role_default"
          name: 'role'
          value: @state.role
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          name: 'password'
          value: @state.password
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          name: 'password_confirmation'
          value: @state.password_confirmation
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        I18n.t "user.create"
