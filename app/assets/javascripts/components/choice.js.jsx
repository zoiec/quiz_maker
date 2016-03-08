var Choice = React.createClass({
  render: function(){
    return(
      <label><input name="answer[choice_id]" type="radio" />{this.props.children}</label>
    );
  }
});
