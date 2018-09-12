import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ""
    };
    this.renderNames.bind(this);
  }

  renderNames() {
    const names = this.props.names.filter( (name) => {
      return name.toLowerCase().includes(this.state.inputVal.toLowerCase());
    });

    return (
      <ul className="search-res">
        {
          names.map( (name, idx) => {
            return (
              <li key={idx} className="name">{name}</li>
            );
          })
        }
      </ul>
    );
  }

  handleInput(e) {
    const inputVal = e.target.value;
    this.setState({inputVal});
  }

  render() {
    return (
      <div className="autocomplete">
        <h1>Autocomplete</h1>
        <div className="search">
          <input
            placeholder="Search..."
            className="search-bar"
            onChange={this.handleInput.bind(this)}
          >
          </input>
          {this.renderNames()}
        </div>

      </div>
    );
  }
}

export default Autocomplete;
