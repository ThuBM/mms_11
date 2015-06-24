@Skills = React.createClass
  getInitialState: ->
    skills: @props.data
  getDefaultProps: ->
    skills: []

  addSkill: (skill) ->
    skills = @state.skills.slice()
    skills.push skill
    @setState skills: skills

  deleteSkill: (skill) ->
    index = @state.skills.indexOf skill
    skills = React.addons.update(@state.skills, {$splice: [[index, 1]]})
    @replaceState skills: skills

  updateSkill: (skill, data) ->
    index = @state.skills.indexOf skill
    skills = React.addons.update(@state.skills, {$splice: [[index, 1, data]]})
    @replaceState skills: skills

  render: ->
    React.DOM.div
      className: 'skills'
      React.DOM.h2
        I18n.t "skill.title"
        React.createElement SkillForm, handleNewSkill: @addSkill
        React.DOM.hr null
      React.DOM.li
        className: 'title'
        I18n.t "skill.index"
        for skill in @state.skills
          React.createElement Skill,
            key: skill.id,
            skill: skill,
            handleDeleteSkill: @deleteSkill,
            handleEditSkill: @updateSkill

