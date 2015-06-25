@Project = React.createClass
  projectForm: ->
    React.DOM.div
      className: 'row'
    React.DOM.form
      className: 'form-horizontal'
      role: 'form'
      React.DOM.div
        className: "col-md-6"
        React.DOM.div
          className: 'form-group row'
          React.DOM.label
            className: 'control-label col-md-2'
            for: 'name'
            I18n.t 'project.name'
          React.DOM.div
            className: 'col-md-10'
            React.DOM.input
              type: 'email'
              className: 'form-control'
              placeholder: I18n.t 'project.enter_name'
        React.DOM.div
          className: 'form-group row'
          React.DOM.label
            className: 'control-label col-md-2'
            for: 'abbreviation'
            I18n.t 'project.abbreviation'
          React.DOM.div
            className: 'col-md-10'
            React.DOM.input
              type: 'email'
              className: 'form-control'
              placeholder: I18n.t 'project.enter_abbreviation'
        React.DOM.div
          className: 'form-group row'
          React.DOM.label
            className: 'control-label col-md-2'
            for: 'start_date'
            I18n.t 'project.start_date'
          React.DOM.div
            className: 'col-md-10'
            React.DOM.input
              type: 'date'
              className: 'form-control'
        React.DOM.div
          className: 'form-group row'
          React.DOM.label
            className: 'control-label col-md-2'
            for: 'end_date'
            I18n.t 'project.end_date'
          React.DOM.div
            className: 'col-md-10'
            React.DOM.input
              type: 'date'
              className: 'form-control'
      React.DOM.div
        className: 'col-md-6'
        React.DOM.div
          className: 'form-group row'
          React.DOM.label
            className: 'control-label col-md-2'
            for: 'name'
            I18n.t 'project.leader'
          React.DOM.div
            className: 'col-md-10'
            React.DOM.select
              className: 'form-control'
              

  render: ->
    @projectForm()
