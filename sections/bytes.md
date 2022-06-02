---
---
### Available Options

The format style has four possible options:

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

{{< hint type=warning >}}

Currently, using any value above `.gb` will cause a crash with the message: "Fatal error: invalid Units value". (Feedback FB10031442 has been submitted to Apple.)

If you're looking to convert between two units, you can use the `Measurement` API and convert between `UnitInformationStorage` values.

{{< /hint >}}

```
let terabyte: Int64 = 1_000_000_000_000

let formatter = ByteCountFormatter()
formatter.countStyle = .binary
formatter.allowedUnits
formatter.includesActualByteCount
formatter.countStyle = .file

terabyte.formatted(.byteCount(style: .binary))  // "931.32 GB"
terabyte.formatted(.byteCount(style: .decimal)) // "1 TB"
terabyte.formatted(.byteCount(style: .file))    // "1 TB"
terabyte.formatted(.byteCount(style: .memory))  // "931.32 GB"

terabyte.formatted(.byteCount(style: .memory, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyte.formatted(.byteCount(style: .memory, allowedUnits: .bytes)) // "1,000,000,000,000 bytes"
terabyte.formatted(.byteCount(style: .memory, allowedUnits: .kb))    // "1,000,000,000 kB"
terabyte.formatted(.byteCount(style: .memory, allowedUnits: .mb))    // "1,000,000 MB"

// .gb, .tb, .pb, .eb, .zb, and .ybOrHigher cause a FatalError (Feedback FB10031442)
// terabyte.formatted(.byteCount(style: .file, allowedUnits: .gb))

Int64(0).formatted(.byteCount(style: .file, allowedUnits: .mb, spellsOutZero: true))   // "Zero bytes"
Int64(0).formatted(.byteCount(style: .file, allowedUnits: .mb, spellsOutZero: false))  // "0 MB"

terabyte.formatted(.byteCount(style: .file, allowedUnits: .mb, includesActualByteCount: true))  // "1,000,000 MB (1,000,000,000,000 bytes)"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .mb, includesActualByteCount: false)) // "1,000,000 MB"
terabyte.formatted(.byteCount(style: .file, allowedUnits: .all, spellsOutZero: true, includesActualByteCount: true)) // "1 TB (1,000,000,000,000 bytes)"
```

### Customizing the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

```
let franceLocale = Locale(identifier: "fr_FR")

terabyte.formatted(.byteCount(style: .binary).locale(franceLocale)) // "931,32 Go"
terabyte.formatted(.byteCount(style: .decimal).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .file).locale(franceLocale)) // "1To"
terabyte.formatted(.byteCount(style: .memory).locale(franceLocale)) // "931,32 Go"

let inFrench = ByteCountFormatStyle(
    style: .memory,
    allowedUnits: .all,
    spellsOutZero: false,
    includesActualByteCount: true,
    locale: Locale(identifier: "fr_FR")
)

inFrench.format(terabyte) // "931,32 Go (1 000 000 000 000 octets)"
terabyte.formatted(inFrench) // "931,32 Go (1 000 000 000 000 octets)"
```

<h3>Attributed String Output</h3>

You can output attributed strings by appending the `attributed` method onto the end of the format style.

```
terabyte.formatted(.byteCount(style: .binary).attributed)
```