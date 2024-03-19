---
sitemap_ignore: true
---

There are two format styles available for the `Duration` type:

<h2 id="time-style">Time Style {{< xcode14-badge >}}</h2>

Time format style allows you to output your `Duration` as a combination of hours, minutes, and seconds, which is set by the `pattern` parameter on the style.

You can either initialize a new instance of `Duration.TimeFormatStyle`, or use the `.time(pattern:)` extension on FormatStyle.

```
Duration.seconds(1_000).formatted() // "0:16:40"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute)) // "0:17"
Duration.TimeFormatStyle(pattern: .hourMinute).format(Duration.seconds(1_000)) // "0:17"

```

{{< hint type=note >}}

You'll notice that this is the default style when calling `.formatted()` on any `Duration` without specifying a style.

{{< /hint >}}

### Available Patterns

There are six total patterns available, broken out into two types: properties and methods.

The properties are the "defaults" for each type of pattern and will choose the configuration for you.

| Pattern           | Description                                                     |
| ----------------- | --------------------------------------------------------------- |
| `.hourMinute`       | Displays the hour and minute values for the Duration          |
| `.hourMinuteSecond` | Displays the hour, minute, and second values for the Duration |
| `.minuteSecond`     | Displays the minute and second values for the Duration        |

```
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute)) // "0:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinuteSecond)) // "0:16:40"
Duration.seconds(1_000).formatted(.time(pattern: .minuteSecond)) // "16:40"
```

The method variants allow you to fully customize the behaviour of each of the patterns:

| Pattern               | Description                                                   |
| --------------------- | ------------------------------------------------------------- |
| `.hourMinute()`       | Displays the hour and minute values for the Duration          |
| `.hourMinuteSecond()` | Displays the hour, minute, and second values for the Duration |
| `.minuteSecond()`     | Displays the minute and second values for the Duration        |

The following are the parameter options for `hourMinute`:

| Parameter         | Description                                                                                                                       |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `padHourToLength` | Pads the output to include that number of digits.                                                                                 |
| `roundSeconds`    | The rounding rule to use on the seconds value ([See Rounding for all options](#numbers-rounding)). Defaults to `.toNearestOrEven` |

```
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 3, roundSeconds: .awayFromZero))) // "000:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .down))) // "000:16"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .toNearestOrAwayFromZero))) // "0:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .toNearestOrEven))) // "0:17"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .towardZero))) // "0:16"
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute(padHourToLength: 1, roundSeconds: .up))) // "0:17"
```
The following are the parameter options for both `hourMinuteSecond` and 'minuteSecond`:

| Parameter                               | Description                                                                                                                       |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `padHourToLength` / `padMinuteToLength` | Pads the largest unit to include that number of digits.                                                                           |
| `fractionalSecondsLength`               | The number of digits to include when displaying fractional seconds.                                                               |
| `roundFractionalSeconds`                | The rounding rule to use on the seconds value ([See Rounding for all options](#numbers-rounding)). Defaults to `.toNearestOrEven` |

```
Duration.seconds(1_000).formatted(
    .time(
        pattern: .hourMinuteSecond(
            padHourToLength: 3,
            fractionalSecondsLength: 3,
            roundFractionalSeconds: .awayFromZero
        )
    )
) // "000:16:40.000"

Duration.seconds(1_000).formatted(
    .time(
        pattern: .minuteSecond(
            padMinuteToLength: 3,
            fractionalSecondsLength: 3,
            roundFractionalSeconds: .awayFromZero
        )
    )
) // "016:40.000"
```

### Setting the Locale

You can set the `Locale` of the style by adding the `.locale()` method to your `.time(pattern:)` method, or including the locale parameter in the `Duration.TimeFormatStyle` initializer.

```
Duration.seconds(1_000).formatted(.time(pattern: .hourMinute).locale(Locale(identifier: "fr_FR"))) // "0:17"

let frenchTimeFormatStyle = Duration.TimeFormatStyle(pattern: .minuteSecond, locale: Locale(identifier: "fr_FR"))

frenchTimeFormatStyle.format(Duration.seconds(1_000)) // "16:40"
```

### Attributed String Output

You can output `AttributedString` values by adding the `.attributed` method.

```
Duration.seconds(1_000).formatted(.time(pattern: .hourMinuteSecond).attributed)
```

<h2 id="units-style">Unit Style {{< xcode14-badge >}}</h2>

The units style allows you to declare and customize the specific units to display for your duration. 

You can either initialize a new instance of `Duration.UnitsFormatStyle`, or use the `.units()` extension on FormatStyle.

```
Duration.seconds(100).formatted(.units()) // "1 min, 40 sec"
Duration.UnitsFormatStyle(allowedUnits: [.hours, .minutes, .seconds], width: .abbreviated).format(.seconds(100)) // "1 min, 40 sec"
```

In both cases, there are two variants the initializer or style method. 

| Parameter          | Description                                                 |
| ------------------ | ----------------------------------------------------------- |
| `.allowed`         | A Set stating the possible units to display.                |
| `width`            | The "width" of the output string.                           |
| `maximumUnitCount` | The maximum number of time units to display.                |
| `zeroValueUnits`   | How to handle units with zero values.                       |
| `valueLength`      | How to pad or truncate values for display.                  |
| `fractionalPart`   | How to display fractional values if the unit can't be shown |

| Parameter           | Description                                                 |
| ------------------- | ----------------------------------------------------------- |
| `.allowed`          | A Set stating the possible units to display.                |
| `width`             | The "width" of the output string.                           |
| `maximumUnitCount`  | The maximum number of time units to display.                |
| `zeroValueUnits`    | How to handle units with zero values.                       |
| `valueLengthLimits` | How to pad or truncate values for display.                  |
| `fractionalPart`    | How to display fractional values if the unit can't be shown |

If you can't spot it at a glance, the difference is the `valueLength`/`valueLengthLimits` parameter which configures how each unit is padded or truncated. `valueLength` accepts an optional `Integer`, while `valueLengthLimits` takes an optional `ValueRange` value. 

---

#### allowed

This parameter, passed in as a `Set< Duration.UnitsFormatStyle.Unit>`, declares which units to use in the final display. By default, if a unit has a value of "0", then it will be omitted from the final string. You can override this functionality with the `zeroValueUnits` parameter.

The following units are available (from smallest to largest):

- `.nanoseconds`
- `.microseconds`
- `.miliseconds`
- `.seconds`
- `.minutes`
- `.hours`
- `.days`
- `.weeks`

```
Duration.milliseconds(500).formatted(.units(allowed: [.nanoseconds])) // "500,000,000 ns"
Duration.milliseconds(500).formatted(.units(allowed: [.microseconds])) // "500,000 μs"
Duration.milliseconds(500).formatted(.units(allowed: [.milliseconds])) // "500 ms"
Duration.milliseconds(500).formatted(.units(allowed: [.seconds])) // "0 sec"
Duration.milliseconds(500).formatted(.units(allowed: [.minutes])) // "0 min"
Duration.milliseconds(500).formatted(.units(allowed: [.hours])) // "0 hr"
Duration.milliseconds(500).formatted(.units(allowed: [.days])) // "0 days"
Duration.milliseconds(500).formatted(.units(allowed: [.weeks])) // "0 wks"

Duration.seconds(1_000_000.00123).formatted(
    .units(
        allowed: [
            .nanoseconds,
            .milliseconds,
            .milliseconds,
            .seconds,
            .minutes,
            .hours,
            .days,
            .weeks
        ]
    )
) // "1 wk, 4 days, 13 hr, 46 min, 40 sec, 1 ms, 230,000 ns"

Duration.seconds(1).formatted(
    .units(
        allowed: [
            .nanoseconds,
            .milliseconds,
            .milliseconds,
            .seconds,
            .minutes,
            .hours,
            .days,
            .weeks
        ]
    )
) // "1 sec"
```

---

#### width

This parameter controls how verbose/wordy and condensed the string output is.

| Parameter               | Description                                                                   |
| ----------------------- | ----------------------------------------------------------------------------- |
| `.wide`                 | Shows the full unit name, eg. "3 hours"                                       |
| `.abbreviated`          | Shows the shortened version of the unit "3 hrs"                               |
| `.condensedAbbreviated` | Shows the shortened version, without a space between the value and unit "3hr" |
| `.narrow`               | Shows the shortest possible unit name                                         |


```
Duration.seconds(100).formatted(.units(width: .abbreviated)) // "1 min, 40 sec"
Duration.seconds(100).formatted(.units(width: .condensedAbbreviated)) // "1 min,40 sec"
Duration.seconds(100).formatted(.units(width: .narrow)) // "1m 40s"
Duration.seconds(100).formatted(.units(width: .wide)) // "1 minute, 40 seconds"
```

---

#### maximumUnitCount

Controls the number of units to display in the final string. This works in tandem with the `.units` property.

```
Duration.seconds(10000).formatted(.units(maximumUnitCount: 1)) // "3 hr"
Duration.seconds(10000).formatted(.units(maximumUnitCount: 2)) // "2 hr, 47 min"
Duration.seconds(10000).formatted(.units(maximumUnitCount: 3)) // "2 hr, 46 min, 40 sec"
```

---

#### zeroValueUnits

Controls how units with a value of zero are shown or not, and if set to `.show`, how many zeros to use in their display.

```
Duration.seconds(100).formatted(.units(zeroValueUnits: .hide)) // "1 min, 40 sec"
Duration.seconds(100).formatted(.units(zeroValueUnits: .show(length: 1))) // "0 hr, 1 min, 40 sec"
Duration.seconds(100).formatted(.units(zeroValueUnits: .show(length: 3))) // "000 hr, 001 min, 040 sec"
```

---

#### valueLength and valueLengthLimits

Controls how many digits of each unit to display. `valueLength` accepts a fixed integer, while `valueLengthLimits` accepts a range.

```
Duration.seconds(1_000).formatted(.units(valueLength: 1)) // "16 min, 40 sec"
Duration.seconds(1_000).formatted(.units(valueLength: 3)) // "016 min, 040 sec"

Duration.seconds(10_000).formatted(.units(valueLengthLimits: 1...)) // This is a bug (Feedback FB10607619)
Duration.seconds(10_000).formatted(.units(valueLengthLimits: ...3)) // "2 hr, 46 min, 40 sec"
Duration.seconds(100).formatted(.units(valueLengthLimits: 2 ... 3)) // "01 min, 40 sec"
```

{{< hint type=warning >}}
As of Xcode 14.0 beta 3 (14A5270f), there's a bug when you use a `ValueRange` of `1...`. In the above example, the output is "16.0 measure-unit/duration-minute, 40.0 measure-unit/duration-second” instead of “16 min, 40 sec”. Feedback FB10607619 has been submitted.
{{< /hint >}}

---

#### fractionalPart

Controls how fractional values are handled for display.

```
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide)) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .up))) // "11 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .towardZero))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .toNearestOrEven))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .toNearestOrAwayFromZero))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .down))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .hide(rounded: .awayFromZero))) // "11 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 0))) // "10 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 5))) // "10.00230 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .up))) // "10.003 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .towardZero))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .toNearestOrEven))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .toNearestOrAwayFromZero))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .down))) // "10.002 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, rounded: .awayFromZero))) // "10.003 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, increment: 1))) // "10.000 sec"
Duration.seconds(10.0_023).formatted(.units(fractionalPart: .show(length: 3, increment: 0.001))) // "10.002 sec"
```
