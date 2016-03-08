var ChoiceList = React.createClass({
  render: function() {
    var choiceNodes = this.props.data.map(function(choice) {
      return (
        <Choice key={choice.id} >
          {choice.body}
        </Choice>
      );
    });
    return (
      <div className="choicesList">
        {choiceNodes}
      </div>
    );
  }
});
