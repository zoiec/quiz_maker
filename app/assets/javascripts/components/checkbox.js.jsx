var Test = React.createClass({
    getInitialState: function() {
        return {
            data: [
                { id: 1, selected: false },
                { id: 2, selected: false },
                { id: 3, selected: false },
                { id: 4, selected: false }
            ]
        };
    },
    render: function() {
        var checks = this.state.data.map(function(d) {
            return (
                <div>
                    <input type="checkbox" data-id={d.id} checked={d.selected} onChange={this.__changeSelection} />
                    {d.id}
                    <br />
                </div>
            );
        });
        return (
            <form>
                <input type="checkbox" ref="globalSelector" onChange={this.__changeAllChecks} />Global selector
                <br />
                {checks}
            </form>
        );
    },
    __changeSelection: function(e) {
        var id = e.target.getAttribute('data-id');
        var state = this.state.data.map(function(d) {
            return {
                id: d.id,
                selected: (d.id === id ? !d.selected : d.selected)
            };
        });

        this.setState({ data: state });

    },
    __changeAllChecks: function(e) {
        var value = this.refs.globalSelector.getDOMNode().checked;
        var state = this.state.data.map(function(d) {
            return { id: d.id, selected: value };
        });

        this.setState({ data: state });
    }
});

React.renderComponent(<Test />, document.getElementById('content'));
