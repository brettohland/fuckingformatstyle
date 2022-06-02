---
---
## The Basics

You can access this new system in a few ways:

1. Call `.formatted()` on a data type for a sensible, localized default
2. Call `.formatted(_: FormatStyle)` on a data type, and pass in a pre-defined or custom FormatStyle to customize your output
3. Call `.format()` on an instance of a FormatStyle

At its most basic, calling `.formatted()` will give you a sensible default that uses your device's current locale and calendar to display the value.

```
// Dates
Date(timeIntervalSinceReferenceDate: 0).formatted() // "12/31/2000, 5:00 PM"

// Measurements
Measurement(value: 20, unit: UnitDuration.minutes).formatted()     // "20 min"
Measurement(value: 300, unit: UnitLength.miles).formatted()        // "300 mi"
Measurement(value: 10, unit: UnitMass.kilograms).formatted()       // "22 lb"
Measurement(value: 100, unit: UnitTemperature.celsius).formatted() // "212°F"

// Numbers
32.formatted()               // "32"
Decimal(20.0).formatted()    // "20"
Float(10.0).formatted()      // "10"
Int(2).formatted()           // "2"
Double(100.0003).formatted() // "100.0003"

// Names
PersonNameComponents(givenName: "Johnny", familyName: "Appleseed").formatted() // "Johnny Appleseed"

// Lists
["Alba", "Bruce", "Carol", "Billson"].formatted() // "Alba, Bruce, Carol, and Billson"

// TimeInterval
let referenceDay = Date(timeIntervalSinceReferenceDate: 0)
(referenceDay ..< referenceDay.addingTimeInterval(200)).formatted() // "12/31/00, 5:00 – 5:03 PM"

// Calling format on a style
let byteCountStyle = ByteCountFormatStyle(
    style: .file,
    allowedUnits: .all,
    spellsOutZero: true,
    includesActualByteCount: true,
    locale: Locale.current
)

byteCountStyle.format(1_000_000_000) //"1 GB (1,000,000,000 bytes)"

```

In general, these are useful to quickly convert your values into strings.