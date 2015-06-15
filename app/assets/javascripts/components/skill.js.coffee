@Skill = React.createClass
  render: ->
    React.DOM.div
      className: 'list-group-item'
      @props.skill.name
