---
sitemap_ignore: true
---

## Available Options

| Parameter                 | Description                                       |
| ------------------------- | ------------------------------------------------- |
| `.always`                 | Always display this value                         |
| `.never`                  | Omit this value                                   |
| `.omitIfHTTPFamily`       | Omit this value if the URL is `http` or `https`   |
| `.displayWhen(_:matches)` | Only display this value when the condition is met |
| `.omitWhen(:matches)`     | Omit this value when the condition is met         |

{{< hint type=important >}}

Brushing up on the [URLComponents documentation](https://developer.apple.com/documentation/foundation/urlcomponents/) can be very helpful to know the use cases for each individual component.

{{< /hint >}}

<pre class="splash"><code><span class="type token">Swift</span>
<span class="keyword token">let</span> appleURL = <span class="type token">URL</span>(string: <span class="string token">"https://apple.com"</span>)!
appleURL.<span class="call token">formatted</span>() <span class="comment token">// "https://apple.com"</span>
appleURL.<span class="call token">formatted</span>(.<span class="dotAccess token">url</span>) <span class="comment token">// "https://apple.com"</span>
appleURL.<span class="call token">formatted</span>(.<span class="dotAccess token">url</span>.<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))) <span class="comment token">// "https://apple.com"</span>

<span class="keyword token">var</span> httpComponents = <span class="type token">URLComponents</span>(url: appleURL, resolvingAgainstBaseURL: <span class="keyword token">false</span>)!
httpComponents.<span class="property token">scheme</span> = <span class="string token">"https"</span>
httpComponents.<span class="property token">user</span> = <span class="string token">"jAppleseed"</span>
httpComponents.<span class="property token">password</span> = <span class="string token">"Test1234"</span>
httpComponents.<span class="property token">host</span> = <span class="string token">"apple.com"</span>
httpComponents.<span class="property token">port</span> = <span class="number token">80</span>
httpComponents.<span class="property token">path</span> = <span class="string token">"/macbook-pro"</span>
httpComponents.<span class="property token">query</span> = <span class="string token">"get-free"</span>
httpComponents.<span class="property token">fragment</span> = <span class="string token">"someFragmentOfSomething"</span>

<span class="keyword token">let</span> complexURL = httpComponents.<span class="property token">url</span>!
<span class="keyword token">let</span> everythingStyle = <span class="type token">URL</span>.<span class="type token">FormatStyle</span>(
    scheme: .<span class="dotAccess token">always</span>,
    user: .<span class="dotAccess token">always</span>,
    password: .<span class="dotAccess token">always</span>,
    host: .<span class="dotAccess token">always</span>,
    port: .<span class="dotAccess token">always</span>,
    path: .<span class="dotAccess token">always</span>,
    query: .<span class="dotAccess token">always</span>,
    fragment: .<span class="dotAccess token">always</span>
)

everythingStyle.<span class="call token">format</span>(complexURL) <span class="comment token">// "https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething"</span>

<span class="keyword token">let</span> omitStyle = <span class="type token">URL</span>.<span class="type token">FormatStyle</span>(
    scheme: .<span class="dotAccess token">omitIfHTTPFamily</span>,
    user: .<span class="dotAccess token">omitIfHTTPFamily</span>,
    password: .<span class="dotAccess token">omitIfHTTPFamily</span>,
    host: .<span class="dotAccess token">omitIfHTTPFamily</span>,
    port: .<span class="dotAccess token">omitIfHTTPFamily</span>,
    path: .<span class="dotAccess token">omitIfHTTPFamily</span>,
    query: .<span class="dotAccess token">omitIfHTTPFamily</span>,
    fragment: .<span class="dotAccess token">omitIfHTTPFamily</span>
)

<span class="keyword token">var</span> httpsComponent = httpComponents
httpsComponent.<span class="property token">scheme</span> = <span class="string token">"https"</span>
<span class="keyword token">let</span> httpsURL = httpsComponent.<span class="property token">url</span>!

<span class="keyword token">var</span> ftpComponents = httpComponents
ftpComponents.<span class="property token">scheme</span> = <span class="string token">"ftp"</span>
<span class="keyword token">let</span> ftpURL = ftpComponents.<span class="property token">url</span>!

omitStyle.<span class="call token">format</span>(complexURL) <span class="comment token">// ""</span>
omitStyle.<span class="call token">format</span>(httpsURL) <span class="comment token">// ""</span>
omitStyle.<span class="call token">format</span>(ftpURL) <span class="comment token">// "ftp://jAppleseed@apple.com:80/macbook-pro?get-free#someFragmentOfSomething"</span>

<span class="keyword token">let</span> localhostURL = <span class="type token">URL</span>(string: <span class="string token">"https://localhost:80/macbook-pro"</span>)!

<span class="keyword token">let</span> displayWhen = <span class="type token">URL</span>.<span class="type token">FormatStyle</span>(
    scheme: .<span class="dotAccess token">always</span>,
    user: .<span class="dotAccess token">never</span>,
    password: .<span class="dotAccess token">never</span>,
    host: .<span class="call token">displayWhen</span>(.<span class="dotAccess token">host</span>, matches: [<span class="string token">"localhost"</span>]),
    port: .<span class="dotAccess token">always</span>,
    path: .<span class="dotAccess token">always</span>,
    query: .<span class="dotAccess token">never</span>,
    fragment: .<span class="dotAccess token">never</span>
)

displayWhen.<span class="call token">format</span>(complexURL) <span class="comment token">// "https://:80/macbook-pro"</span>
displayWhen.<span class="call token">format</span>(localhostURL) <span class="comment token">// "https://localhost:80/macbook-pro"</span>

<span class="keyword token">let</span> omitWhen = <span class="type token">URL</span>.<span class="type token">FormatStyle</span>(
    scheme: .<span class="dotAccess token">always</span>,
    user: .<span class="dotAccess token">never</span>,
    password: .<span class="dotAccess token">never</span>,
    host: .<span class="call token">omitWhen</span>(.<span class="dotAccess token">host</span>, matches: [<span class="string token">"localhost"</span>]),
    port: .<span class="dotAccess token">always</span>,
    path: .<span class="dotAccess token">always</span>,
    query: .<span class="dotAccess token">never</span>,
    fragment: .<span class="dotAccess token">never</span>
)

omitWhen.<span class="call token">format</span>(complexURL) <span class="comment token">// "https://apple.com:80/macbook-pro"</span>
omitWhen.<span class="call token">format</span>(localhostURL) <span class="comment token">// "https://:80/macbook-pro"</span>

<span class="keyword token">let</span> omitSpecificWhen = <span class="type token">URL</span>.<span class="type token">FormatStyle</span>(
    scheme: .<span class="dotAccess token">always</span>,
    user: .<span class="dotAccess token">never</span>,
    password: .<span class="dotAccess token">never</span>,
    host: .<span class="call token">omitSpecificSubdomains</span>([<span class="string token">"secret"</span>], includeMultiLevelSubdomains: <span class="keyword token">false</span>),
    port: .<span class="dotAccess token">always</span>,
    path: .<span class="dotAccess token">always</span>,
    query: .<span class="dotAccess token">never</span>,
    fragment: .<span class="dotAccess token">never</span>
)

<span class="keyword token">var</span> secretAppleURL = <span class="type token">URL</span>(string: <span class="string token">"https://secret.apple.com/macbook-pro"</span>)!

omitSpecificWhen.<span class="call token">format</span>(complexURL) <span class="comment token">// "https://apple.com:80/macbook-pro"</span>
omitSpecificWhen.<span class="call token">format</span>(secretAppleURL) <span class="comment token">// "https://apple.com/macbook-pro"</span>

<span class="keyword token">let</span> omitSpecificWhenWhere = <span class="type token">URL</span>.<span class="type token">FormatStyle</span>(
    scheme: .<span class="dotAccess token">always</span>,
    user: .<span class="dotAccess token">never</span>,
    password: .<span class="dotAccess token">never</span>,
    host: .<span class="call token">omitSpecificSubdomains</span>([<span class="string token">"secret"</span>], includeMultiLevelSubdomains: <span class="keyword token">false</span>, when: .<span class="dotAccess token">user</span>, matches: [<span class="string token">"jAppleseed"</span>]),
    port: .<span class="dotAccess token">always</span>,
    path: .<span class="dotAccess token">always</span>,
    query: .<span class="dotAccess token">never</span>,
    fragment: .<span class="dotAccess token">never</span>
)

<span class="keyword token">let</span> complexSecretURL = <span class="type token">URL</span>(string: <span class="string token">"https://jAppleseed:Test1234@secret.apple.com:80/macbook-pro?get-free#someFragmentOfSomething"</span>)!

omitSpecificWhenWhere.<span class="call token">format</span>(complexSecretURL) <span class="comment token">// "https://apple.com:80/macbook-pro"</span>
omitSpecificWhenWhere.<span class="call token">format</span>(secretAppleURL) <span class="comment token">// "https://secret.apple.com/macbook-pro"</span></code></pre>

## Parsing URLs

The venerable URL initializer `URL(string:relativeTo:)` has been available to us since Xcode 10.2. In most cases this will work well for most use cases.

If you're looking to parse URLs in a structured way, you can use the URL parse strategy on the URL.FormatStyle struct.

### Available Options

For each component of the URL (scheme, user, password, host, port, path, query, or fragment) you can configure them with the following options:

| Parameter         | Description                               |
| ----------------- | ----------------------------------------- |
| `.optional`       | Sets the unit as optional                 |
| `.required`       | Sets the unit as required for a valid URL |
| `.defaultValue()` | If missing, uses the default value        |

{{< hint type=note >}}

By default, only the scheme and the host are set as required.

{{< /hint >}}

<pre class="splash"><code><span class="type token">Swift</span>
<span class="keyword token">try</span> <span class="type token">URL</span>.<span class="type token">FormatStyle</span>.<span class="type token">Strategy</span>(port: .<span class="call token">defaultValue</span>(<span class="number token">80</span>)).<span class="call token">parse</span>(<span class="string token">"http://www.apple.com"</span>) <span class="comment token">// http://www.apple.com:80</span>
<span class="keyword token">try</span> <span class="type token">URL</span>.<span class="type token">FormatStyle</span>.<span class="type token">Strategy</span>(port: .<span class="dotAccess token">optional</span>).<span class="call token">parse</span>(<span class="string token">"http://www.apple.com"</span>) <span class="comment token">// http://www.apple.com</span>
<span class="keyword token">try</span> <span class="type token">URL</span>.<span class="type token">FormatStyle</span>.<span class="type token">Strategy</span>(port: .<span class="dotAccess token">required</span>).<span class="call token">parse</span>(<span class="string token">"http://www.apple.com"</span>) <span class="comment token">// throws an error

// This returns a valid URL</span>
<span class="keyword token">try</span> <span class="type token">URL</span>.<span class="type token">FormatStyle</span>.<span class="type token">Strategy</span>()
    .<span class="call token">scheme</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">user</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">password</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">host</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">port</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">path</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">query</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">fragment</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">parse</span>(<span class="string token">"https://jAppleseed:Test1234@apple.com:80/macbook-pro?get-free#someFragmentOfSomething"</span>)

<span class="comment token">// This throws an error (the port is missing)</span>
<span class="keyword token">try</span> <span class="type token">URL</span>.<span class="type token">FormatStyle</span>.<span class="type token">Strategy</span>()
    .<span class="call token">scheme</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">user</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">password</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">host</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">port</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">path</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">query</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">fragment</span>(.<span class="dotAccess token">required</span>)
    .<span class="call token">parse</span>(<span class="string token">"https://jAppleseed:Test1234@apple.com/macbook-pro?get-free#someFragmentOfSomething"</span>)</code></pre>
