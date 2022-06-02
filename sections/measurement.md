---
---
[If you're curious, here's Apple's list of supported units.](https://developer.apple.com/documentation/foundation/dimension)

Regardless of which unit you're using, the format style has three possible widths:

| Width          | Description                                         |
| -------------- | --------------------------------------------------- |
| `.wide`        | Displays the full unit description                  |
| `.narrow`      | Displays the unit in the least number of characters |
| `.abbreviated` | Displays an abbreviated unit description            |

```
let gForce = Measurement(value: 1.0, unit: UnitAcceleration.gravity)

gForce.formatted(.measurement(width: .wide))        // "1 g-force"
gForce.formatted(.measurement(width: .narrow))      // "1G"
gForce.formatted(.measurement(width: .abbreviated)) // "1 G"
```

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

```
let franceLocale = Locale(identifier: "fr_FR")

gForce.formatted(.measurement(width: .wide).locale(franceLocale))        // "1 fois l’accélération de pesanteur terrestre"
gForce.formatted(.measurement(width: .narrow).locale(franceLocale))      // "1G"
gForce.formatted(.measurement(width: .abbreviated).locale(franceLocale)) // "1 force g")
```

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

```
let franceLocale = Locale(identifier: "fr_FR")

gForce.formatted(.measurement(width: .wide).locale(franceLocale))        // "1 fois l’accélération de pesanteur terrestre"
gForce.formatted(.measurement(width: .narrow).locale(franceLocale))      // "1G"
gForce.formatted(.measurement(width: .abbreviated).locale(franceLocale)) // "1 force g"
````

### Initializing a Measurement Style

Due to the associated types required by the Measurement API, initializing a measurement style requires you to set the associated type.

```
let inFrench = Measurement<UnitAcceleration>.FormatStyle(
    width: .wide,
    locale: Locale(identifier: "fr_FR"),
    usage: .general
)

inFrench.format(gForce)     // "1 fois l’accélération de pesanteur terrestre"
gForce.formatted(inFrench)  // "1 fois l’accélération de pesanteur terrestre"
```

<h3>Attributed String Output</h3>

You can output Attributed Strings by appending the `attributed` method onto the end of the format style.

```
gForce.formatted(.measurement(width: .wide).attributed)
```