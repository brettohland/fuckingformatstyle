---
sitemap_ignore: true
---

{{< hint type=warning >}}

**This style is broken in certain ways in Xcode 13** (but fixed in Xcode 14). Providing any unit above gigabyte will cause a crash with the message: "Fatal error: invalid Units value".

Experiment for yourself to see if you can make this work for you, but you may want to fall back to the older `ByteCountFormatter` in this case.

{{< /hint >}}

### Available Options

Both format styles have the following options available:

| Option                    | Description                                           |
| ------------------------- | ----------------------------------------------------- |
| `style`                   | Specifies display of file or storage byte counts      |
| `allowedUnits`            | Which units to display                                |
| `spellsOutZero`           | Specifies if an empty value is shows as "0" or "Zero" |
| `includesActualByteCount` | Specifies if the original count in bytes is included  |

| Style      | Description                                                                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.file`    | Specifies display of file byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the decimal style, but that may change over time.  |
| `.memory`  | Specifies display of memory byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the binary style, but that may change over time. |
| `.decimal` | Causes 1000 bytes to be shown as 1 KB. It is better to use `.memory` or `.file` in most cases                                                                         |
| `.binary`  | Causes 1024 bytes to be shown as 1 KB. It is better to use `.memory` or `.file` in most cases                                                                         |

| Units         | Description                                             |
| ------------- | ------------------------------------------------------- |
| `.all`        | Will use all values as appropriate                      |
| `.default`    | Uses the default value (`.all`)                         |
| `.bytes`      | As bytes                                                |
| `.kb`         | As kilobytes (1,000 bytes)                              |
| `.mb`         | As megabytes (1,000,000 bytes)                          |
| `.gb`         | As gigabytes (1,000,000,000 bytes)                      |
| `.tb`         | As terabytes (1,000,000,000,000 bytes)                  |
| `.pb`         | As petabytes (1,000,000,000,000,000 bytes)              |
| `.eb`         | As exabytes (1,000,000,000,000,000,000 bytes)           |
| `.zb`         | As zetabytes (1,000,000,000,000,000,000,000 bytes)      |
| `.ybOrHigher` | As yottabytes (1,000,000,000,000,000,000,000,000 bytes) |

{{< hint type=important >}}

You can provide a `Set<ByteCountFormatStyle.Units>` for the `units` parameter instead of an individual unit. Doing so will cause the style to use the unit that will provide the smallest number of digits.

{{< /hint >}}

<p>&nbsp;</p>

``` Swift

// MARK: - Int64

let terabyte: Int64 = 1_000_000_000_000

var integerByteCountStyle = ByteCountFormatStyle()
integerByteCountStyle.style = .file
integerByteCountStyle.allowedUnits = [.gb, .tb]
integerByteCountStyle.includesActualByteCount = true

integerByteCountStyle.format(terabyte) // "1 TB (1,000,000,000,000 bytes)"
terabyte.formatted(integerByteCountStyle) // "1 TB (1,000,000,000,000 bytes)"

terabyte.formatted(.byteCount(style: .binary)) // "931.32 GB"
terabyte.formatted(.byteCount(style: .decimal)) // "1 TB"
terabyte.formatted(.byteCount(style: .file)) // "1 TB"
terabyte.formatted(.byteCount(style: .memory)) // "931.32 GB"

terabyte.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .kb)) // "976,562,500 kB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .mb)) // "953,674.3 MB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .gb)) // "931.32 GB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .tb)) // "0.91 TB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .pb)) // "0 PB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .zb)) // "0 PB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .ybOrHigher)) // 0 PB

Int64(1_000).formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 kB"
Int64(1_000_000).formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 MB"

Int64.zero.formatted(.byteCount(style: .file, spellsOutZero: true)) // "Zero kB"
Int64.zero.formatted(.byteCount(style: .file, spellsOutZero: false)) // "0 bytes"

Int64(1_000).formatted(.byteCount(style: .file, includesActualByteCount: true)) // "1 kB (1,000 bytes)"

// MARK: - Measurement

let terabyteMeasurement = Measurement(value: 1, unit: UnitInformationStorage.terabytes)

terabyteMeasurement.formatted(.byteCount(style: .binary)) // "931.32 GB"
terabyteMeasurement.formatted(.byteCount(style: .decimal)) // "1 TB"
terabyteMeasurement.formatted(.byteCount(style: .file)) // "1 TB"
terabyteMeasurement.formatted(.byteCount(style: .memory)) // "931.32 GB"

terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .kb)) // "976,562,500 kB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .mb)) // "953,674.3 MB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .gb)) // "931.32 GB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .tb)) // "0.91 TB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .pb)) // "0 PB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .zb)) // "0 PB"
terabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: .ybOrHigher)) // 0 PB

let kilobyteMeasurement = Measurement(value: 1, unit: UnitInformationStorage.kilobytes)
let megabyteMeasurement = Measurement(value: 1, unit: UnitInformationStorage.megabytes)

kilobyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 kB"
megabyteMeasurement.formatted(.byteCount(style: .file, allowedUnits: [.kb, .mb])) // "1 MB"

let zeroMeasurement = Measurement(value: 0, unit: UnitInformationStorage.bytes)

zeroMeasurement.formatted(.byteCount(style: .file, spellsOutZero: true)) // "Zero kB"
zeroMeasurement.formatted(.byteCount(style: .file, spellsOutZero: false)) // "0 bytes"

megabyteMeasurement.formatted(.byteCount(style: .file, includesActualByteCount: true)) // "1 MB (1,000,000 bytes)"

```

### Customizing the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

``` Swift
let franceLocale = Locale(identifier: "fr_FR")

terabyte.formatted(.byteCount(style: .binary).locale(franceLocale)) // "931,32 Go"
terabyte.formatted(.byteCount(style: .decimal).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .file).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .memory).locale(franceLocale)) // "931,32 Go"

terabyteMeasurement.formatted(.byteCount(style: .binary).locale(franceLocale)) // "931,32 Go"
terabyteMeasurement.formatted(.byteCount(style: .decimal).locale(franceLocale)) // "1To"
terabyteMeasurement.formatted(.byteCount(style: .file).locale(franceLocale)) // "1To"
terabyteMeasurement.formatted(.byteCount(style: .memory).locale(franceLocale)) // "931,32 Go"
```

<h3>Attributed String Output</h3>

You can output attributed strings by appending the `attributed` method onto the end of the format style.

``` Swift
terabyte.formatted(.byteCount(style: .binary).attributed)

terabyteMeasurement.formatted(.byteCount(style: .binary).attributed)
```