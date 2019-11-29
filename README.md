# OWMW: Open Weather Map Wrapper
OWMW is an acronym for Open Weather Map Wrapper. With OWMW you can easily gather data about the weather in the area. All you need is a (free) token from [OWM](https://openweathermap.org/api).

## Installation
To install OWMW, you can use [VPM](https://github.com/yue-best-practices/vpm).

```bash
$ vpm init
$ vpm get https://github.com/Bowero/owmw owmw
```

## Quickstart
```go
module main

import owmw

const (
    Token = 'TOKEN'
)

fn main() {
    w := owmw.start(Token, 1)
    city := w.city_by_name('Rotterdam')
    println(city.temperature())
}
```

```bash
$ v run test.v 
30.129999
```

As you see, it is hot nowadays.

## Commands
To start, you will have to initialize the wrapper with your token:

```go
w := owmw.start(Token, metric)
```

If you prefer the imperial system, you pass `0` to `metric`. For metric systems you pass `1`.

After initializing, you can store a city:

```go
city := owmw.city_by_name('Rotterdam')
city := owmw.city_by_id(2747891)
```

A least with the IDs can be found on [the website of Open Weather Map](http://bulk.openweathermap.org/sample/).

After selecting a city, you can gather data from it.

### Available data
I am still developing this wrapper, but I wanted to share this before version 1. Be aware that this is an alpha stage and that many things are still missing.

+ **Coordinates**
  + `.longitude()`: The longitude of the city as `f32`
  + `.latitude()`: The latitude of the city as `f32`
  
+ **Weather** *(An overview of these values can be found [here](https://openweathermap.org/weather-conditions))*
  + `.condition_id()`: The condition ID of the weather as `int`
  + `.description()`: The description of the weather as `string`, can also be determined from the `.condition_id()`
  + `.description_long()`: The detailed description of the weather as `string`, can also be determined from the `.condition_id()`
  + `.icon()`: The icon of the weather as `string`, can also be determined from the `.condition_id()`
  
+ **Main**
  + `.temperature()`: The current temperature as `f32`
  + `.pressure()`: The air pressure as `int`
  + `.humidity()`: The humidity percentage as `int`
  + `.min_temperature()`: The minimum temperature as `f32`
  + `.max_temperature()`: The maximum temperature as `f32`
  
+ **Wind**
  + `.wind_speed()`: The wind speed as `f32`
  + `.wind_degrees()`: The wind direction in meteorical degrees as `int`
  
+ **City**
  + `.city_id()`: The ID of the city as `int`
  + `.city_name()`: The name of the city as `string`
  + `.country()`: The name of the country of the city as `string`
  + `.sunrise()`: The UNIX timestamp of the sunrise as `int`
  + `.sunset()`: The UNIX timestamp of the sunset as `int`
  
+ **Miscellaneous**
  + `.visible_meters()`: The visibility in meters as `int`
  + `.cloudiness()`: The cloudiness as percentage as `int`
  + `.data_calculation()`: The UNIX timestamp at which the data has been calculated as `int`
