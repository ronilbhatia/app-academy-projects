import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Weather from './weather';
import Tabs from './tabs';
import Autocomplete from './autocomplete';

const panes = [
  {
    title: "one",
    content: "I am the first"
  },
  {
    title: "two",
    content: "Second pane here"
  },
  {
    title: "three",
    content: "Third pane here"
  }
];

const names = ["Abba", "Barney", "Barbara", "Jeff", "Jenny", "Sarah", "Sally", "Xander"];

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(
    <div>
      <Clock />
      <Weather />
      <div className="interactive">
        <Tabs tabs={panes}/>
        <Autocomplete names={names}/>
      </div>
    </div>, root
  );
});
