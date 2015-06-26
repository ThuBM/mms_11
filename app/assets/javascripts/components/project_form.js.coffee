@Project = React.createClass
  getInitialState: ->
    name: ""
    abbreviation: ""
    start_date: ""
    end_date: ""
  render: ->
    React.DOM.form
      className: "form-horizontal"
      React.DOM.div
        className: "col-md-5 col-md-offset-1"
        React.DOM.h2
          I18n.t "project.basic_info"
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.name"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control"
              type: "text"
              placeholder: I18n.t "project.enter_name"
              name: "name"
              value: @state.name
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.abbreviation"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control"
              type: "text"
              placeholder: I18n.t "project.enter_abbreviation"
              name: "abbrevitaion"
              value: @state.abbreviation
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.start_date"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control date"
              type: "date"
              name: "start_date"
              value: @state.start_date
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.end_date"
          React.DOM.div
            className: "col-md-10"
            React.DOM.input
              className: "form-control date"
              type: "date"
              name: "end_date"
              value: @state.end_date
      React.DOM.div
        className: "col-md-6"
        React.DOM.h2
          I18n.t "project.select_members"
        React.DOM.div
          className: "form-group"
          React.DOM.label
            className: "control-label col-md-2"
            I18n.t "project.select_teams"
          React.DOM.div
            className: "col-md-10"
            React.DOM.select
              className: "form-control select"
              name: "team_id"
              React.DOM.option
                key: "1"
                value: "1"
        