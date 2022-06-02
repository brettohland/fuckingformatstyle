---
---
```
let guest = PersonNameComponents(
    namePrefix: "Dr",
    givenName: "Elizabeth",
    middleName: "Jillian",
    familyName: "Smith",
    nameSuffix: "Esq.",
    nickname: "Liza"
)

guest.formatted() // "Elizabeth Smith"
```

### Available Opyions

You can set the following style options:

| Option         | Description                        |
| -------------- | ---------------------------------- |
| `.abbreviated` | Displays the person's initials     |
| `.short`       | Displays only the given name       |
| `.medium`      | Displays the given and family name |
| `.long`        | Displays all components            | 

```
guest.formatted(.name(style: .abbreviated)) // "ES"
guest.formatted(.name(style: .short))       // "Liza"
guest.formatted(.name(style: .medium))      // "Elizabeth Smith"
guest.formatted(.name(style: .long))        // "Dr Elizabeth Jillian Smith Esq.
```

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

```
let chinaLocale = Locale(identifier: "zh_CN")

guest.formatted(.name(style: .abbreviated).locale(chinaLocale))    // "SE"
guest.formatted(.name(style: .short).locale(chinaLocale))          // "Liza"
guest.formatted(.name(style: .medium).locale(chinaLocale))         // "Smith Elizabeth"
guest.formatted(.name(style: .long).locale(chinaLocale))           // "Dr Smith Elizabeth Jillian Esq."

let inFrance = PersonNameComponents.FormatStyle(style: .long, locale: Locale(identifier: "fr_FR"))

inFrance.format(guest)
guest.formatted(inFrance)
```

