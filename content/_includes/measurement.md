---
sitemap_ignore: true
---

As of Xcode 14, this is the canonical list of Dimensions [^1] that are supported:

| Unit                                                                                                    | Description                            | Base unit                           | Custom Usage?           |
| ------------------------------------------------------------------------------------------------------- | -------------------------------------- | ----------------------------------- | ----------------------- |
| [Unit Acceleration](https://developer.apple.com/documentation/foundation/unitacceleration)              | Unit for acceleration                  | meters per second squared (m/s²)    | No                      |
| [Unit Angle](https://developer.apple.com/documentation/foundation/unitangle)                            | Unit for planar angle and rotation     | degrees (°)                         | No                      |
| [Unit Area](https://developer.apple.com/documentation/foundation/unitarea)                              | Unit for area                          | square meters (m²)                  | No                      |
| [Unit Mass](https://developer.apple.com/documentation/foundation/unitconcentrationmass)                 | Unit for concentration of mass         | grams per liter (g/L)               | No                      |
| [Unit Dispersion](https://developer.apple.com/documentation/foundation/unitdispersion)                  | Unit for dispersion                    | parts per million (ppm)             | No                      |
| [Unit Duration](https://developer.apple.com/documentation/foundation/unitduration)                      | Unit for duration of time              | seconds (sec)                       | No                      |
| [Unit Charge](https://developer.apple.com/documentation/foundation/unitelectriccharge)                  | Unit for electric charge               | coulombs (C)                        | No                      |
| [Unit Current](https://developer.apple.com/documentation/foundation/unitelectriccurrent)                | Unit for electric current              | amperes (A)                         | No                      |
| [Unit Difference](https://developer.apple.com/documentation/foundation/unitelectricpotentialdifference) | Unit for electric potential difference | volts (V)                           | No                      |
| [Unit Resistance](https://developer.apple.com/documentation/foundation/unitelectricresistance)          | Unit for electric resistance           | ohms (Ω)                            | No                      |
| [Unit Energy](https://developer.apple.com/documentation/foundation/unitenergy)                          | Unit for energy                        | joules (J)                          | [Yes](#unitenergy)      |
| [Unit Frequency](https://developer.apple.com/documentation/foundation/unitfrequency)                    | Unit for frequency                     | hertz (Hz)                          | No                      |
| [Unit Efficiency](https://developer.apple.com/documentation/foundation/unitfuelefficiency)              | Unit for fuel efficiency               | liters per 100 kilometers (L/100km) | No                      |
| [Unit Illuminance](https://developer.apple.com/documentation/foundation/unitilluminance)                | Unit for illuminance                   | lux (lx)                            | No                      |
| [Unit Storage](https://developer.apple.com/documentation/foundation/unitinformationstorage)             | Unit for quantities of information     | bytes (b)                           | Yes [^2] {{< xcode14-badge >}}               |
| [Unit Length](https://developer.apple.com/documentation/foundation/unitlength)                          | Unit for length                        | meters (m)                          | [Yes](#unitlength)      |
| [Unit Mass](https://developer.apple.com/documentation/foundation/unitmass)                              | Unit for mass                          | kilograms (kg)                      | [Yes](#unitmass)        |
| [Unit Power](https://developer.apple.com/documentation/foundation/unitpower)                            | Unit for power                         | watts (W)                           | No                      |
| [Unit Pressure](https://developer.apple.com/documentation/foundation/unitpressure)                      | Unit for pressure                      | newtons per square meter (N/m²)     | No                      |
| [Unit Speed](https://developer.apple.com/documentation/foundation/unitspeed)                            | Unit for speed                         | meters per second (m/s)             | No                      |
| [Unit Temperature](https://developer.apple.com/documentation/foundation/unittemperature)                | Unit for temperature                   | kelvin (K)                          | [Yes](#unittemperature) |
| [Unit Volume](https://developer.apple.com/documentation/foundation/unitvolume)                          | Unit for volume                        | liters (L)                          | [Yes](#unitvolume)      |


[^1]: [Apple's documentation refers to these units as subclasses of `Dimension`](https://developer.apple.com/documentation/foundation/dimension), which is "An abstract class representing a dimensional unit of measure.".

[^2]: Xcode 14 introduced the Byte Count Format Style (`Measurement<UnitInformationStorage>.FormatStyle.ByteCount`) specifically for this unit. [See the Byte Count Style section for more detail](/byte-count-style/).

Measurement is special in that the localized string output can vary significantly depending on the `Locale` used by the format style. 

By default, it uses the style of your device. You can specify the locale used by adding the `.locale()` method to the end of the style method.

There are three parameters available to customize your output. Only `width` is required.

| Parameter                                            | Accepted Type                                 | Description                         |
| ---------------------------------------------------- | --------------------------------------------- | ----------------------------------- |
| [`width`](#width)                                    | `Measurement<UnitType>.FormatStyle.UnitWidth` | Sets how verbose the output is      |
| [`usage`]($usage) (optional)                         | `MeasurementFormatUnitUsage<UnitType>`        | Sets how the unit will be used      |
| [`numberFormatStyle`](#numberformatstyle) (optional) | `FloatingPointFormatStyle<Double>`            | Sets the format style on the number

<pre class="splash"><code><span class="keyword token">let</span> speedLimit = <span class="type token">Measurement</span>(value: <span class="number token">100</span>, unit: <span class="type token">UnitSpeed</span>.<span class="property token">kilometersPerHour</span>)
<span class="keyword token">let</span> drivingDistance = <span class="type token">Measurement</span>(value: <span class="number token">200</span>, unit: <span class="type token">UnitLength</span>.<span class="property token">kilometers</span>)
<span class="keyword token">let</span> averageBaseballThrow = <span class="type token">Measurement</span>(value: <span class="number token">70</span>, unit: <span class="type token">UnitLength</span>.<span class="property token">feet</span>)
<span class="keyword token">let</span> bodyTemperature = <span class="type token">Measurement</span>(value: <span class="number token">98.5</span>, unit: <span class="type token">UnitTemperature</span>.<span class="property token">fahrenheit</span>)

speedLimit.<span class="call token">formatted</span>() <span class="comment token">// "62 mph"</span>
drivingDistance.<span class="call token">formatted</span>() <span class="comment token">// "124 mi"</span>
averageBaseballThrow.<span class="call token">formatted</span>() <span class="comment token">// "70 ft"</span>
bodyTemperature.<span class="call token">formatted</span>() <span class="comment token">// "98°F"</span></code></pre>

{{< hint type=important >}}

Due to this format style using your device's current Locale, the examples can output wildly different strings depending on your device's settings.

**All examples for this section are using the English (US) locale (`en-US`) unless the `.locale()` is specified.**

You can read more about this at the [Ampersand Softworks Blog](https://ampersandsoftworks.com/posts/measurements-and-their-formatting/)

{{< /hint >}}

### Width

Regardless of which unit you're using, the format style has three possible widths:

| Width          | Description                                         |
| -------------- | --------------------------------------------------- |
| `.wide`        | Displays the full unit description                  |
| `.narrow`      | Displays the unit in the least number of characters |
| `.abbreviated` | Displays an abbreviated unit description            |

<pre class="splash"><code><span class="keyword token">let</span> speedLimit = <span class="type token">Measurement</span>(value: <span class="number token">100</span>, unit: <span class="type token">UnitSpeed</span>.<span class="property token">kilometersPerHour</span>)
<span class="keyword token">let</span> drivingDistance = <span class="type token">Measurement</span>(value: <span class="number token">200</span>, unit: <span class="type token">UnitLength</span>.<span class="property token">kilometers</span>)
<span class="keyword token">let</span> averageBaseballThrow = <span class="type token">Measurement</span>(value: <span class="number token">70</span>, unit: <span class="type token">UnitLength</span>.<span class="property token">feet</span>)
<span class="keyword token">let</span> bodyTemperature = <span class="type token">Measurement</span>(value: <span class="number token">98.5</span>, unit: <span class="type token">UnitTemperature</span>.<span class="property token">fahrenheit</span>)

speedLimit.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>)) <span class="comment token">// "62 miles per hour"</span>
speedLimit.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "62 mph"</span>
speedLimit.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>)) <span class="comment token">// "62mph"</span>

drivingDistance.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>)) <span class="comment token">// "124 miles"</span>
drivingDistance.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "124 mi"</span>
drivingDistance.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>)) <span class="comment token">// "124mi"</span>

averageBaseballThrow.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>)) <span class="comment token">// "70 feet"</span>
averageBaseballThrow.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "70 ft"</span>
averageBaseballThrow.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>)) <span class="comment token">// "70'"</span>

bodyTemperature.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>)) <span class="comment token">// "98 degrees Fahrenheit"</span>
bodyTemperature.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "98°F"</span>
bodyTemperature.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>)) <span class="comment token">// "98°"</span></code></pre>

### Usage

The `usage` parameter works with the `Locale` to output a string for a specific purpose. There are two options that are shared between every `Dimension`, while some have special use cases for specific purposes.

The `usage` parameter lets you specify how the unit will be used and displayed to the user. While there are two shared options for all `Dimension` instances, there are special use options for `UnitEnergy`, `UnitLength`, `UnitMass`, `UnitTemperature`, and `UnitVolume`:

Shared Options:

| Option        | Description                                                                          |
| ------------- | ------------------------------------------------------------------------------------ |
| `.general`    | Outputs the value in the most generalized way for the given locale                   |
| `.asProvided` | Outputs a string value of the unit the `Dimention` was created with, or converted to |


<pre class="splash"><code><span class="keyword token">let</span> usa = <span class="type token">Locale</span>(identifier: <span class="string token">"en-US"</span>)
<span class="keyword token">let</span> sweden = <span class="type token">Locale</span>(identifier: <span class="string token">"sv-SE"</span>)

<span class="keyword token">let</span> myHeight = <span class="type token">Measurement</span>(value: <span class="number token">190</span>, unit: <span class="type token">UnitLength</span>.<span class="property token">centimeters</span>)

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6.2 ft"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(sweden)) <span class="comment token">// "1.9 m"</span>

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "190 cm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(sweden)) <span class="comment token">// "190 cm"</span></code></pre>

The `.general` option will output the string with what would be agreed upon as the generalized usage of that unit for the given locale. In the above case, the US locale used fractional feet while the Swedish locale used centimetres. 

#### UnitEnergy

| `UnitEnergy` Option | Description                     |
| ------------------- | ------------------------------- |
| `.food`             | For energy related to food      |
| `.workout`          | For energy related to a workout |

<pre class="splash"><code><span class="keyword token">let</span> usa = <span class="type token">Locale</span>(identifier: <span class="string token">"en-US"</span>)
<span class="keyword token">let</span> sweden = <span class="type token">Locale</span>(identifier: <span class="string token">"sv-SE"</span>)

<span class="keyword token">let</span> recommendedCalories = <span class="type token">Measurement</span>(value: <span class="number token">2.0</span>, unit: <span class="type token">UnitEnergy</span>.<span class="property token">kilowattHours</span>)

recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "2 kilowatt-hours"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "2 kilowatt-hours"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">food</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,721 Calories"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">workout</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,721 Calories"</span>

recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "2 kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "2 kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">food</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,721 Cal"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">workout</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,721 Cal"</span>

recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "2kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "2kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">food</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,721Cal"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">workout</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,721Cal"</span>

recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2 kilowatt-hours"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2 kilowatt-hours"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">food</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,721 Calories"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">workout</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,721 Calories"</span>

recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2 kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2 kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">food</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,721 Cal"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">workout</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,721 Cal"</span>

recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2kWh"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">food</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,721Cal"</span>
recommendedCalories.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">workout</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,721Cal"</span></code></pre>

#### UnitLength

| `UnitLength` Option | Description                              |
| ------------------- | ---------------------------------------- |
| `.person`           | For distances as they relate to a person |
| `.personHeight`     | For displaying a person's height         |
| `.road`             | For distances while driving              |
| `.focalLength`      | For the focal length of optics           |
| `.rainfall`         | For displaying rainfall values           |
| `.snowfall`         | For displaying snowfall values           |

<pre class="splash"><code><span class="keyword token">let</span> usa = <span class="type token">Locale</span>(identifier: <span class="string token">"en-US"</span>)
<span class="keyword token">let</span> sweden = <span class="type token">Locale</span>(identifier: <span class="string token">"sv-SE"</span>)

<span class="keyword token">let</span> myHeight = <span class="type token">Measurement</span>(value: <span class="number token">190</span>, unit: <span class="type token">UnitLength</span>.<span class="property token">centimeters</span>)

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6.2 feet"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "190 centimeters"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">focalLength</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,900 millimeters"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75 inches"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">snowfall</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75 inches"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">road</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6 feet"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">rainfall</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75 inches"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">personHeight</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6 feet, 2.8 inches"</span>

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6.2 ft"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "190 cm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">focalLength</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,900 mm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75 in"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">snowfall</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75 in"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">road</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6 ft"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">rainfall</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75 in"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">personHeight</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6 ft, 2.8 in"</span>

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6.2'"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "190cm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">focalLength</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1,900mm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75""</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">snowfall</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75""</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">road</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6'"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">rainfall</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "75""</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">personHeight</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "6'2.8""</span>

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1.9 metres"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "190 centimetres"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">focalLength</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,900 millimetres"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "75 inches"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">snowfall</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "190 centimetres"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">road</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2 metres"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">rainfall</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,900 millimetres"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">personHeight</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "6 feet, 2.8 inches"</span>

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1.9m"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "190 cm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">focalLength</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,900 mm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "75 in"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">snowfall</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "190 in"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">road</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2 m"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">rainfall</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,900 mm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">personHeight</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "6 ft, 2.8 in"</span>

myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1.9m"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "190cm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">focalLength</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,900mm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "75""</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">snowfall</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "190cm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">road</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "2m"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">rainfall</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1,900mm"</span>
myHeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">personHeight</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "6'2.8""</span></code></pre>

#### UnitMass

| `UnitMass` Option | Description                            |
| ----------------- | -------------------------------------- |
| `.personWeight`   | For mass relating to a person's weight |

<pre class="splash"><code><span class="keyword token">let</span> usa = <span class="type token">Locale</span>(identifier: <span class="string token">"en-US"</span>)
<span class="keyword token">let</span> sweden = <span class="type token">Locale</span>(identifier: <span class="string token">"sv-SE"</span>)

<span class="keyword token">let</span> averageWeight = <span class="type token">Measurement</span>(value: <span class="number token">197.9</span>, unit: <span class="type token">UnitMass</span>.<span class="property token">pounds</span>)

averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "198 pounds"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "197.9 pounds"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">personWeight</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "198 pounds"</span>

averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "198 lb"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "197.9 lb"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">personWeight</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "198 lb"</span>

averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "198#"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "197.9#"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">personWeight</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "198#"</span>

averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "90 kilograms"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "197.9 pounds"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">personWeight</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "90 kilograms"</span>

averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "90 kg"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "197.9 lb"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">personWeight</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "90 kg"</span>

averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "90kg"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "197.9lb"</span>
averageWeight.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">personWeight</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "90kg"</span></code></pre>

#### UnitTemperature

| `UnitTemperature` Option | Description                     |
| ------------------------ | ------------------------------- |
| `.person`                | For a person's body temperature |
| `.weather`               | For weather values              | 

<pre class="splash"><code><span class="keyword token">let</span> usa = <span class="type token">Locale</span>(identifier: <span class="string token">"en-US"</span>)
<span class="keyword token">let</span> sweden = <span class="type token">Locale</span>(identifier: <span class="string token">"sv-SE"</span>)

<span class="keyword token">let</span> aNiceDay = <span class="type token">Measurement</span>(value: <span class="number token">25.0</span>, unit: <span class="type token">UnitTemperature</span>.<span class="property token">celsius</span>)

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77 degrees Fahrenheit"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "25 degrees Celsius"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77 degrees Fahrenheit"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">weather</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77 degrees Fahrenheit"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°F"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "25°C"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°F"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">weather</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°F"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "25°C"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">weather</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77 degrees Fahrenheit"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "25 degrees"</span>
aNiceDay .<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">person</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77 degrees Fahrenheit"</span>
aNiceDay .<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">weather</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77 degrees Fahrenheit"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°F"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">person</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°F"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">weather</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°F"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">person</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">weather</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "77°"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees Celsius"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees Celsius"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees Celsius"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">weather</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees Celsius"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°C"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°C"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°C"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">weather</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°C"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">person</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">weather</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>

aNiceDay .<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees Celsius"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees"</span>
aNiceDay .<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">person</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees Celsius"</span>
aNiceDay .<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">weather</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25 degrees Celsius"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°C"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">person</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°C"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">weather</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°C"</span>

aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">person</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span>
aNiceDay.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">weather</span>, hidesScaleName: <span class="keyword token">true</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "25°"</span></code></pre>

#### UnitVolume

| `UnitVolume` Option | Description            |
| ------------------- | ---------------------- |
| `.liquid`           | For volumes of liquids | 

<pre class="splash"><code><span class="keyword token">let</span> usa = <span class="type token">Locale</span>(identifier: <span class="string token">"en-US"</span>)
<span class="keyword token">let</span> sweden = <span class="type token">Locale</span>(identifier: <span class="string token">"sv-SE"</span>)

<span class="keyword token">let</span> onePint = <span class="type token">Measurement</span>(value: <span class="number token">1</span>, unit: <span class="type token">UnitVolume</span>.<span class="property token">pints</span>)

onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "31 cubic inches"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1 metric pint"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">liquid</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1.1 pints"</span>

onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "31 in³"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1 mpt"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">liquid</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1.1 pt"</span>

onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "31in³"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1mpt"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">liquid</span>).<span class="call token">locale</span>(usa)) <span class="comment token">// "1.1pt"</span>

onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "500 cubic centimetres"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1 metric pint"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>, usage: .<span class="dotAccess token">liquid</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "500 millilitres"</span>

onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "500/cu cm"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1 mpt"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>, usage: .<span class="dotAccess token">liquid</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "500 mL"</span>

onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">general</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "500cm³"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">asProvided</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "1mpt"</span>
onePint.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>, usage: .<span class="dotAccess token">liquid</span>).<span class="call token">locale</span>(canada)) <span class="comment token">// "500mL"</span></code></pre>

### NumberFormatStyle

The `numberFormatStyle` parameter controls the formatting of the numerical portion of the measurement output. Specifically, it's a `FloatingPointFormatStyle<Double>` and can accept any numeric format style you'd like.
  
[See the Number Style section for more detailed information](/numeric-styles/#number-style).

The example below shows how to output a person's height without fractional inches.

<pre class="splash"><code><span class="keyword token">let</span> usa = <span class="type token">Locale</span>(identifier: <span class="string token">"en-US"</span>)

myHeight.<span class="call token">formatted</span>(
    .<span class="call token">measurement</span>(
        width: .<span class="dotAccess token">wide</span>,
        usage: .<span class="dotAccess token">personHeight</span>,
        numberFormatStyle: .<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">0</span>))
    )
    .<span class="call token">locale</span>(usa)
) <span class="comment token">// "6 feet, 3 inches"</span>


myHeight.<span class="call token">formatted</span>(
    .<span class="call token">measurement</span>(
        width: .<span class="dotAccess token">abbreviated</span>,
        usage: .<span class="dotAccess token">personHeight</span>,
        numberFormatStyle: .<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">0</span>))
    )
    .<span class="call token">locale</span>(usa)
) <span class="comment token">// "6 ft, 3 in"</span>


myHeight.<span class="call token">formatted</span>(
    .<span class="call token">measurement</span>(
        width: .<span class="dotAccess token">narrow</span>,
        usage: .<span class="dotAccess token">personHeight</span>,
        numberFormatStyle: .<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">0</span>))
    )
    .<span class="call token">locale</span>(usa)
) <span class="comment token">// "6′ 3″"</span></code></pre>

<h3>Attributed String Output</h3>

You can output Attributed Strings by appending the `attributed` method onto the end of the format style.

<pre class="splash"><code>gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>).<span class="property token">attributed</span>)</code></pre>
