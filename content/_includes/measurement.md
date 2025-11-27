---
sitemap_ignore: true
---

As of Xcode 14, this is the canonical list of Dimensions [^1] that are supported:

| Unit                                                                                                    | Description                            | Base unit                           | Custom Usage?                  |
|---------------------------------------------------------------------------------------------------------|----------------------------------------|-------------------------------------|--------------------------------|
| [Unit Acceleration](https://developer.apple.com/documentation/foundation/unitacceleration)              | Unit for acceleration                  | meters per second squared (m/s²)    | No                             |
| [Unit Angle](https://developer.apple.com/documentation/foundation/unitangle)                            | Unit for planar angle and rotation     | degrees (°)                         | No                             |
| [Unit Area](https://developer.apple.com/documentation/foundation/unitarea)                              | Unit for area                          | square meters (m²)                  | No                             |
| [Unit Mass](https://developer.apple.com/documentation/foundation/unitconcentrationmass)                 | Unit for concentration of mass         | grams per liter (g/L)               | No                             |
| [Unit Dispersion](https://developer.apple.com/documentation/foundation/unitdispersion)                  | Unit for dispersion                    | parts per million (ppm)             | No                             |
| [Unit Duration](https://developer.apple.com/documentation/foundation/unitduration)                      | Unit for duration of time              | seconds (sec)                       | No                             |
| [Unit Charge](https://developer.apple.com/documentation/foundation/unitelectriccharge)                  | Unit for electric charge               | coulombs (C)                        | No                             |
| [Unit Current](https://developer.apple.com/documentation/foundation/unitelectriccurrent)                | Unit for electric current              | amperes (A)                         | No                             |
| [Unit Difference](https://developer.apple.com/documentation/foundation/unitelectricpotentialdifference) | Unit for electric potential difference | volts (V)                           | No                             |
| [Unit Resistance](https://developer.apple.com/documentation/foundation/unitelectricresistance)          | Unit for electric resistance           | ohms (Ω)                            | No                             |
| [Unit Energy](https://developer.apple.com/documentation/foundation/unitenergy)                          | Unit for energy                        | joules (J)                          | [Yes](#unitenergy)             |
| [Unit Frequency](https://developer.apple.com/documentation/foundation/unitfrequency)                    | Unit for frequency                     | hertz (Hz)                          | No                             |
| [Unit Efficiency](https://developer.apple.com/documentation/foundation/unitfuelefficiency)              | Unit for fuel efficiency               | liters per 100 kilometers (L/100km) | No                             |
| [Unit Illuminance](https://developer.apple.com/documentation/foundation/unitilluminance)                | Unit for illuminance                   | lux (lx)                            | No                             |
| [Unit Storage](https://developer.apple.com/documentation/foundation/unitinformationstorage)             | Unit for quantities of information     | bytes (b)                           | Yes [^2] {{< xcode14-badge >}} |
| [Unit Length](https://developer.apple.com/documentation/foundation/unitlength)                          | Unit for length                        | meters (m)                          | [Yes](#unitlength)             |
| [Unit Mass](https://developer.apple.com/documentation/foundation/unitmass)                              | Unit for mass                          | kilograms (kg)                      | [Yes](#unitmass)               |
| [Unit Power](https://developer.apple.com/documentation/foundation/unitpower)                            | Unit for power                         | watts (W)                           | No                             |
| [Unit Pressure](https://developer.apple.com/documentation/foundation/unitpressure)                      | Unit for pressure                      | newtons per square meter (N/m²)     | No                             |
| [Unit Speed](https://developer.apple.com/documentation/foundation/unitspeed)                            | Unit for speed                         | meters per second (m/s)             | No                             |
| [Unit Temperature](https://developer.apple.com/documentation/foundation/unittemperature)                | Unit for temperature                   | kelvin (K)                          | [Yes](#unittemperature)        |
| [Unit Volume](https://developer.apple.com/documentation/foundation/unitvolume)                          | Unit for volume                        | liters (L)                          | [Yes](#unitvolume)             |


[^1]: [Apple's documentation refers to these units as subclasses of `Dimension`](https://developer.apple.com/documentation/foundation/dimension), which is "An abstract class representing a dimensional unit of measure.".

[^2]: Xcode 14 introduced the Byte Count Format Style (`Measurement<UnitInformationStorage>.FormatStyle.ByteCount`) specifically for this unit. [See the Byte Count Style section for more detail](/byte-count-style/).

Measurement is special in that the localized string output can vary significantly depending on the `Locale` used by the format style. 

By default, it uses the style of your device. You can specify the locale used by adding the `.locale()` method to the end of the style method.

There are three parameters available to customize your output. Only `width` is required.

| Parameter                    | Accepted Type                                 | Description                    |
|------------------------------|-----------------------------------------------|--------------------------------|
| [`width`](#width)            | `Measurement<UnitType>.FormatStyle.UnitWidth` | Sets how verbose the output is |
| [`usage`]($usage) (optional) | `MeasurementFormatUnitUsage<UnitType>`        | Sets how the unit will be used |
| [`numberFormatStyle`](#numberformatstyle) (optional) | `FloatingPointFormatStyle<Double>`            | Sets the format style on the number

``` swift
let speedLimit = Measurement(value: 100, unit: UnitSpeed.kilometersPerHour)
let drivingDistance = Measurement(value: 200, unit: UnitLength.kilometers)
let averageBaseballThrow = Measurement(value: 70, unit: UnitLength.feet)
let bodyTemperature = Measurement(value: 98.5, unit: UnitTemperature.fahrenheit)

speedLimit.formatted() // "62 mph"
drivingDistance.formatted() // "124 mi"
averageBaseballThrow.formatted() // "70 ft"
bodyTemperature.formatted() // "98°F"
```

{{< hint type=important >}}

Due to this format style using your device's current Locale, the examples can output wildly different strings depending on your device's settings.

**All examples for this section are using the English (US) locale (`en-US`) unless the `.locale()` is specified.**

You can read more about this at the [Ampersand Softworks Blog](https://ampersandsoftworks.com/posts/measurements-and-their-formatting/)

{{< /hint >}}

### Width

Regardless of which unit you're using, the format style has three possible widths:

| Width          | Description                                         |
|----------------|-----------------------------------------------------|
| `.wide`        | Displays the full unit description                  |
| `.narrow`      | Displays the unit in the least number of characters |
| `.abbreviated` | Displays an abbreviated unit description            |

``` swift

let speedLimit = Measurement(value: 100, unit: UnitSpeed.kilometersPerHour)
let drivingDistance = Measurement(value: 200, unit: UnitLength.kilometers)
let averageBaseballThrow = Measurement(value: 70, unit: UnitLength.feet)
let bodyTemperature = Measurement(value: 98.5, unit: UnitTemperature.fahrenheit)

speedLimit.formatted(.measurement(width: .wide)) // "62 miles per hour"
speedLimit.formatted(.measurement(width: .abbreviated)) // "62 mph"
speedLimit.formatted(.measurement(width: .narrow)) // "62mph"

drivingDistance.formatted(.measurement(width: .wide)) // "124 miles"
drivingDistance.formatted(.measurement(width: .abbreviated)) // "124 mi"
drivingDistance.formatted(.measurement(width: .narrow)) // "124mi"

averageBaseballThrow.formatted(.measurement(width: .wide)) // "70 feet"
averageBaseballThrow.formatted(.measurement(width: .abbreviated)) // "70 ft"
averageBaseballThrow.formatted(.measurement(width: .narrow)) // "70'"

bodyTemperature.formatted(.measurement(width: .wide)) // "98 degrees Fahrenheit"
bodyTemperature.formatted(.measurement(width: .abbreviated)) // "98°F"
bodyTemperature.formatted(.measurement(width: .narrow)) // "98°"
```

### Usage

The `usage` parameter works with the `Locale` to output a string for a specific purpose. There are two options that are shared between every `Dimension`, while some have special use cases for specific purposes.

The `usage` parameter lets you specify how the unit will be used and displayed to the user. While there are two shared options for all `Dimension` instances, there are special use options for `UnitEnergy`, `UnitLength`, `UnitMass`, `UnitTemperature`, and `UnitVolume`:

Shared Options:

| Option        | Description                                                                          |
|---------------|--------------------------------------------------------------------------------------|
| `.general`    | Outputs the value in the most generalized way for the given locale                   |
| `.asProvided` | Outputs a string value of the unit the `Dimention` was created with, or converted to |


``` swift
let usa = Locale(identifier: "en-US")
let sweden = Locale(identifier: "sv-SE")

let myHeight = Measurement(value: 190, unit: UnitLength.centimeters)

myHeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "6.2 ft"
myHeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(sweden)) // "1.9 m"

myHeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "190 cm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(sweden)) // "190 cm"
```

The `.general` option will output the string with what would be agreed upon as the generalized usage of that unit for the given locale. In the above case, the US locale used fractional feet while the Swedish locale used centimetres. 

#### UnitEnergy

| `UnitEnergy` Option | Description                     |
|---------------------|---------------------------------|
| `.food`             | For energy related to food      |
| `.workout`          | For energy related to a workout |

``` swift
let usa = Locale(identifier: "en-US")
let sweden = Locale(identifier: "sv-SE")

let recommendedCalories = Measurement(value: 2.0, unit: UnitEnergy.kilowattHours)

recommendedCalories.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .food).locale(usa)) // "1,721 Calories"
recommendedCalories.formatted(.measurement(width: .wide, usage: .workout).locale(usa)) // "1,721 Calories"

recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .food).locale(usa)) // "1,721 Cal"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .workout).locale(usa)) // "1,721 Cal"

recommendedCalories.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .food).locale(usa)) // "1,721Cal"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .workout).locale(usa)) // "1,721Cal"

recommendedCalories.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "2 kilowatt-hours"
recommendedCalories.formatted(.measurement(width: .wide, usage: .food).locale(canada)) // "1,721 Calories"
recommendedCalories.formatted(.measurement(width: .wide, usage: .workout).locale(canada)) // "1,721 Calories"

recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "2 kWh"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .food).locale(canada)) // "1,721 Cal"
recommendedCalories.formatted(.measurement(width: .abbreviated, usage: .workout).locale(canada)) // "1,721 Cal"

recommendedCalories.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "2kWh"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .food).locale(canada)) // "1,721Cal"
recommendedCalories.formatted(.measurement(width: .narrow, usage: .workout).locale(canada)) // "1,721Cal"
```

#### UnitLength

| `UnitLength` Option | Description                              |
|---------------------|------------------------------------------|
| `.person`           | For distances as they relate to a person |
| `.personHeight`     | For displaying a person's height         |
| `.road`             | For distances while driving              |
| `.focalLength`      | For the focal length of optics           |
| `.rainfall`         | For displaying rainfall values           |
| `.snowfall`         | For displaying snowfall values           |

``` swift
let usa = Locale(identifier: "en-US")
let sweden = Locale(identifier: "sv-SE")

let myHeight = Measurement(value: 190, unit: UnitLength.centimeters)

myHeight.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "6.2 feet"
myHeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "190 centimeters"
myHeight.formatted(.measurement(width: .wide, usage: .focalLength).locale(usa)) // "1,900 millimeters"
myHeight.formatted(.measurement(width: .wide, usage: .person).locale(usa)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .snowfall).locale(usa)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .road).locale(usa)) // "6 feet"
myHeight.formatted(.measurement(width: .wide, usage: .rainfall).locale(usa)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .personHeight).locale(usa)) // "6 feet, 2.8 inches"

myHeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "6.2 ft"
myHeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "190 cm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .focalLength).locale(usa)) // "1,900 mm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .person).locale(usa)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .snowfall).locale(usa)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .road).locale(usa)) // "6 ft"
myHeight.formatted(.measurement(width: .abbreviated, usage: .rainfall).locale(usa)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .personHeight).locale(usa)) // "6 ft, 2.8 in"

myHeight.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "6.2'"
myHeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "190cm"
myHeight.formatted(.measurement(width: .narrow, usage: .focalLength).locale(usa)) // "1,900mm"
myHeight.formatted(.measurement(width: .narrow, usage: .person).locale(usa)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .snowfall).locale(usa)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .road).locale(usa)) // "6'"
myHeight.formatted(.measurement(width: .narrow, usage: .rainfall).locale(usa)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .personHeight).locale(usa)) // "6'2.8""

myHeight.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "1.9 metres"
myHeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "190 centimetres"
myHeight.formatted(.measurement(width: .wide, usage: .focalLength).locale(canada)) // "1,900 millimetres"
myHeight.formatted(.measurement(width: .wide, usage: .person).locale(canada)) // "75 inches"
myHeight.formatted(.measurement(width: .wide, usage: .snowfall).locale(canada)) // "190 centimetres"
myHeight.formatted(.measurement(width: .wide, usage: .road).locale(canada)) // "2 metres"
myHeight.formatted(.measurement(width: .wide, usage: .rainfall).locale(canada)) // "1,900 millimetres"
myHeight.formatted(.measurement(width: .wide, usage: .personHeight).locale(canada)) // "6 feet, 2.8 inches"

myHeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "1.9m"
myHeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "190 cm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .focalLength).locale(canada)) // "1,900 mm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .person).locale(canada)) // "75 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .snowfall).locale(canada)) // "190 in"
myHeight.formatted(.measurement(width: .abbreviated, usage: .road).locale(canada)) // "2 m"
myHeight.formatted(.measurement(width: .abbreviated, usage: .rainfall).locale(canada)) // "1,900 mm"
myHeight.formatted(.measurement(width: .abbreviated, usage: .personHeight).locale(canada)) // "6 ft, 2.8 in"

myHeight.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "1.9m"
myHeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "190cm"
myHeight.formatted(.measurement(width: .narrow, usage: .focalLength).locale(canada)) // "1,900mm"
myHeight.formatted(.measurement(width: .narrow, usage: .person).locale(canada)) // "75""
myHeight.formatted(.measurement(width: .narrow, usage: .snowfall).locale(canada)) // "190cm"
myHeight.formatted(.measurement(width: .narrow, usage: .road).locale(canada)) // "2m"
myHeight.formatted(.measurement(width: .narrow, usage: .rainfall).locale(canada)) // "1,900mm"
myHeight.formatted(.measurement(width: .narrow, usage: .personHeight).locale(canada)) // "6'2.8""
```

#### UnitMass

| `UnitMass` Option | Description                            |
|-------------------|----------------------------------------|
| `.personWeight`   | For mass relating to a person's weight |

``` swift
let usa = Locale(identifier: "en-US")
let sweden = Locale(identifier: "sv-SE")

let averageWeight = Measurement(value: 197.9, unit: UnitMass.pounds)

averageWeight.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "198 pounds"
averageWeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "197.9 pounds"
averageWeight.formatted(.measurement(width: .wide, usage: .personWeight).locale(usa)) // "198 pounds"

averageWeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "198 lb"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "197.9 lb"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .personWeight).locale(usa)) // "198 lb"

averageWeight.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "198#"
averageWeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "197.9#"
averageWeight.formatted(.measurement(width: .narrow, usage: .personWeight).locale(usa)) // "198#"

averageWeight.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "90 kilograms"
averageWeight.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "197.9 pounds"
averageWeight.formatted(.measurement(width: .wide, usage: .personWeight).locale(canada)) // "90 kilograms"

averageWeight.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "90 kg"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "197.9 lb"
averageWeight.formatted(.measurement(width: .abbreviated, usage: .personWeight).locale(canada)) // "90 kg"

averageWeight.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "90kg"
averageWeight.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "197.9lb"
averageWeight.formatted(.measurement(width: .narrow, usage: .personWeight).locale(canada)) // "90kg"
```

#### UnitTemperature

| `UnitTemperature` Option | Description                     |
|--------------------------|---------------------------------|
| `.person`                | For a person's body temperature |
| `.weather`               | For weather values              |

``` swift
let usa = Locale(identifier: "en-US")
let sweden = Locale(identifier: "sv-SE")

let aNiceDay = Measurement(value: 25.0, unit: UnitTemperature.celsius)

aNiceDay.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .person).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay.formatted(.measurement(width: .wide, usage: .weather).locale(usa)) // "77 degrees Fahrenheit"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather).locale(usa)) // "77°F"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "25°C"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather).locale(usa)) // "77°"

aNiceDay.formatted(.measurement(width: .wide, usage: .general, hidesScaleName: true).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided, hidesScaleName: true).locale(usa)) // "25 degrees"
aNiceDay .formatted(.measurement(width: .wide, usage: .person, hidesScaleName: true).locale(usa)) // "77 degrees Fahrenheit"
aNiceDay .formatted(.measurement(width: .wide, usage: .weather, hidesScaleName: true).locale(usa)) // "77 degrees Fahrenheit"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general, hidesScaleName: true).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided, hidesScaleName: true).locale(usa)) // "25°"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person, hidesScaleName: true).locale(usa)) // "77°F"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather, hidesScaleName: true).locale(usa)) // "77°F"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general, hidesScaleName: true).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided, hidesScaleName: true).locale(usa)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person, hidesScaleName: true).locale(usa)) // "77°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather, hidesScaleName: true).locale(usa)) // "77°"

aNiceDay.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .person).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .weather).locale(canada)) // "25 degrees Celsius"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather).locale(canada)) // "25°C"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather).locale(canada)) // "25°"

aNiceDay .formatted(.measurement(width: .wide, usage: .general, hidesScaleName: true).locale(canada)) // "25 degrees Celsius"
aNiceDay.formatted(.measurement(width: .wide, usage: .asProvided, hidesScaleName: true).locale(canada)) // "25 degrees"
aNiceDay .formatted(.measurement(width: .wide, usage: .person, hidesScaleName: true).locale(canada)) // "25 degrees Celsius"
aNiceDay .formatted(.measurement(width: .wide, usage: .weather, hidesScaleName: true).locale(canada)) // "25 degrees Celsius"

aNiceDay.formatted(.measurement(width: .abbreviated, usage: .general, hidesScaleName: true).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .asProvided, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .person, hidesScaleName: true).locale(canada)) // "25°C"
aNiceDay.formatted(.measurement(width: .abbreviated, usage: .weather, hidesScaleName: true).locale(canada)) // "25°C"

aNiceDay.formatted(.measurement(width: .narrow, usage: .general, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .asProvided, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .person, hidesScaleName: true).locale(canada)) // "25°"
aNiceDay.formatted(.measurement(width: .narrow, usage: .weather, hidesScaleName: true).locale(canada)) // "25°"
```

#### UnitVolume

| `UnitVolume` Option | Description            |
|---------------------|------------------------|
| `.liquid`           | For volumes of liquids |

``` swift
let usa = Locale(identifier: "en-US")
let sweden = Locale(identifier: "sv-SE")

let onePint = Measurement(value: 1, unit: UnitVolume.pints)

onePint.formatted(.measurement(width: .wide, usage: .general).locale(usa)) // "31 cubic inches"
onePint.formatted(.measurement(width: .wide, usage: .asProvided).locale(usa)) // "1 metric pint"
onePint.formatted(.measurement(width: .wide, usage: .liquid).locale(usa)) // "1.1 pints"

onePint.formatted(.measurement(width: .abbreviated, usage: .general).locale(usa)) // "31 in³"
onePint.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(usa)) // "1 mpt"
onePint.formatted(.measurement(width: .abbreviated, usage: .liquid).locale(usa)) // "1.1 pt"

onePint.formatted(.measurement(width: .narrow, usage: .general).locale(usa)) // "31in³"
onePint.formatted(.measurement(width: .narrow, usage: .asProvided).locale(usa)) // "1mpt"
onePint.formatted(.measurement(width: .narrow, usage: .liquid).locale(usa)) // "1.1pt"

onePint.formatted(.measurement(width: .wide, usage: .general).locale(canada)) // "500 cubic centimetres"
onePint.formatted(.measurement(width: .wide, usage: .asProvided).locale(canada)) // "1 metric pint"
onePint.formatted(.measurement(width: .wide, usage: .liquid).locale(canada)) // "500 millilitres"

onePint.formatted(.measurement(width: .abbreviated, usage: .general).locale(canada)) // "500/cu cm"
onePint.formatted(.measurement(width: .abbreviated, usage: .asProvided).locale(canada)) // "1 mpt"
onePint.formatted(.measurement(width: .abbreviated, usage: .liquid).locale(canada)) // "500 mL"

onePint.formatted(.measurement(width: .narrow, usage: .general).locale(canada)) // "500cm³"
onePint.formatted(.measurement(width: .narrow, usage: .asProvided).locale(canada)) // "1mpt"
onePint.formatted(.measurement(width: .narrow, usage: .liquid).locale(canada)) // "500mL"
```

### NumberFormatStyle

The `numberFormatStyle` parameter controls the formatting of the numerical portion of the measurement output. Specifically, it's a `FloatingPointFormatStyle<Double>` and can accept any numeric format style you'd like.
  
[See the Number Style section for more detailed information](/numeric-styles/#number-style).

The example below shows how to output a person's height without fractional inches.

``` swift
let usa = Locale(identifier: "en-US")

myHeight.formatted(
    .measurement(
        width: .wide,
        usage: .personHeight,
        numberFormatStyle: .number.precision(.fractionLength(0))
    )
    .locale(usa)
) // "6 feet, 3 inches"


myHeight.formatted(
    .measurement(
        width: .abbreviated,
        usage: .personHeight,
        numberFormatStyle: .number.precision(.fractionLength(0))
    )
    .locale(usa)
) // "6 ft, 3 in"


myHeight.formatted(
    .measurement(
        width: .narrow,
        usage: .personHeight,
        numberFormatStyle: .number.precision(.fractionLength(0))
    )
    .locale(usa)
) // "6′ 3″"
```

<h3>Attributed String Output</h3>

You can output Attributed Strings by appending the `attributed` method onto the end of the format style.

``` swift
gForce.formatted(.measurement(width: .wide).attributed)
```