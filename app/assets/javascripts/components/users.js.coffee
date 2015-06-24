@AdminEdit = React.createClass
  getInitialState: ->
    users: @props.data
  getDefaultProps: ->
    users: []

  addUser: (user) ->
    users = @state.users.slice()
    users.push user
    @setState users: users

  deleteUser: (user) ->
    users = @state.users.slice()
    index = users.indexOf user
    users.splice index, 1
    @replaceState users: users

  updateUser: (user, data) ->
    index = @state.users.indexOf user
    users = React.addons.update(@state.users, {$splice: [[index, 1, data]]})
    @replaceState users: users

  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        I18n.t "user.title"
        React.createElement UserForm, handleNewUser: @addUser
        React.DOM.hr null
      React.DOM.li
        className: "title"
        I18n.t "user.index"
        React.DOM.hr null
        React.DOM.li
          for user in @state.users
            React.createElement UserRole,
              key: user.id,
              user: user,
              handleDeleteUser: @deleteUser,
              handleEditUser: @updateUser
