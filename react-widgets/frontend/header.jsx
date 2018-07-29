import React from 'react';

const Header = (props) => {
  const tabs = props.tabs;
  const changeTab = props.onTabClick;
  const selectedPane = props.selectedPane;

  console.log(props);
  return (
    <ul className="tab-header">
      {
        tabs.map((tab, idx) => {
          const klass = selectedPane === idx ? 'tab-title selected' : 'tab-title';
          return (
            <h3 className={klass} key={idx} data-key={idx} onClick={changeTab}>{tab.title}</h3>
          );
        })
      }
    </ul>
  );
};


export default Header;
