var Question = React.createClass({
  render: function(){
    return (
      <div className="question">
        <h1>{this.props.question.body}</h1>
        <form className="answer_form" data-remote>
          <div className="answer_choice">
            <div className="radio">
              <ChoiceList data={this.props.choices} />
            </div>
          </div>
          <button type="submit" className="button float-right">
            Save Answer
          </button>
        </form>
      </div>
    );
  }
})
