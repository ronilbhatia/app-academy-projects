import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      location: "",
      temperature: ""
    };
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount() {
    // debugger
    // navigator.geolocation.getCurrentPosition( position => {
    //   this.getWeather(position.coords.latitude, position.coords.longitude);
    // });
    this.getWeather(1, 2);
  }

  getWeather(lat, lon) {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      const response = JSON.parse(xhr.response);
      const location = response.name;
      let temperature = Math.round(((response.main.temp - 273) * (9/5) + 32) * 10)/10;
      temperature = temperature.toString() + ' degrees';
      this.setState({location, temperature});
    };
    xhr.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=15.3525&lon=120.832703&APPID=4c29cf6c10d012cfedd562ba56ba0a1c`);
    xhr.send();
  }

  render() {
    const klass = this.state.location === "" ? 'weather-attr' : 'hidden';
    return (
      <div className="weather">
        <h1>Weather</h1>
        <div className="city-weather">
          <h2 className={klass}>loading weather...</h2>
          <h2 className="weather-attr">{this.state.location}</h2>
          <h2 className="weather-attr">{this.state.temperature}</h2>
        </div>
      </div>
    );
  }
}

export default Weather;
