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
    let that = this;
    navigator.geolocation.getCurrentPosition( function(position) {
      that.getWeather(position.coords.latitude, position.coords.longitude);
    });
    // this.getWeather(1, 2);
    // function geoSuccess(position) {
    //   const long = position.coords.longitude;
    //   const lat = position.coords.latitude;
    //   console.log("SUCCESS", lat, long);
    //   that.getWeather(lat, long);
    // }
    //
    // function errorCallback(error) {
    //   alert('ERROR(' + error.code + '): ' + error.message);
    // }
    //
    // var opt = {
    //   enableHighAccuracy: true,
    //   maximumAge        : 30000,
    //   timeout           : 27000
    // };
    //
    // navigator.geolocation.getCurrentPosition(geoSuccess, errorCallback, opt);

  }

  getWeather(lat, lon) {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.readyState > 2) {
        const response = JSON.parse(xhr.response);
        const location = response.name;
        debugger;
        let temperature = Math.round(((response.main.temp - 273) * (9/5) + 32) * 10)/10;
        temperature = temperature.toString() + ' degrees';
        this.setState({location, temperature});
      }
    };
    let url = `api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&APPID=4c29cf6c10d012cfedd562ba56ba0a1c`
    url = `http://` + url;
    xhr.open('GET', url);
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
