import React from 'react';
import Header from './header';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: 0
    };
    this.onTabClick.bind(this);
  }

  onTabClick(e) {
    console.log(e.target);
    this.setState({index: parseInt(e.target.dataset.key)});
  }

  render() {
    const tabs = this.props.tabs;
    const currentTab = tabs[this.state.index];
    const onTabClick = this.onTabClick;
    const selectedPane = this.state.index;

    return (
      <div className="tabs">
        <h1>Tabs</h1>
        <div className = "three-tabs">
          <Header tabs={tabs} onTabClick={onTabClick.bind(this)} selectedPane={selectedPane}/>
          <article className="tab-content">{currentTab.content}</article>
        </div>
      </div>
    );
  }
}

export default Tabs;
