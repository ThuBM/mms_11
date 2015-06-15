@Skills = React.createClass
  getInitialState: ->
    skills: @props.data
  getDefaultProps: ->
    skills: []

  addSkill: (skill) ->
    skills = @state.skills.slice()
    skills.push skill
    @setState skills: skills

  render: ->
    React.DOM.div
      className: 'skills'
      React.DOM.h2
        'SKILLs'
        React.createElement SkillForm, handleNewSkill: @addSkill
        React.DOM.hr null
      React.DOM.li
        className: 'title'
        'Skills'
        for skill in @state.skills
          React.createElement Skill, 
            key: skill.id,
            skill: skill

