# Detroit Labs Weather App

A basic weather app for technical interview with Detroit Labs. This app was built with SwiftUI and has an MVVM architecture with Combine.

<img src="https://github.com/ajevans99/DetroitLabsWeatherApp/blob/main/screenshots/page1.png" alt="Screenshot of the Weather app's main page" width="200">

## Setup

Clone and open with Xcode 12.0 or later (built with Xcode 13 beta).

Obtain API keys from [OpenWeather](https://home.openweathermap.org). Copy `Config/Debug.xcconfig.sample` and rename to `Config/Debug.xcconfig`. Repeat for `Config/Release.xcconfig` (not required for development). Alternatively, you can run the command below.

```
cp DetroitLabsWeatherApp/Config/Development.xcconfig.sample DetroitLabsWeatherApp/Config/Development.xcconfig && cp DetroitLabsWeatherApp/Config/Release.xcconfig.sample DetroitLabsWeatherApp/Config/Release.xcconfig
```

Add API keys to `Debug.xcconfig` and `Release.xcconfig`.

Build and run :)
