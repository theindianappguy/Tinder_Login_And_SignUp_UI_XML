// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of dart.core;

// Frequently used character codes.
const int _SPACE = 0x20;
const int _PERCENT = 0x25;
const int _AMPERSAND = 0x26;
const int _PLUS = 0x2B;
const int _DOT = 0x2E;
const int _SLASH = 0x2F;
const int _COLON = 0x3A;
const int _EQUALS = 0x3d;
const int _UPPER_CASE_A = 0x41;
const int _UPPER_CASE_Z = 0x5A;
const int _LEFT_BRACKET = 0x5B;
const int _BACKSLASH = 0x5C;
const int _RIGHT_BRACKET = 0x5D;
const int _LOWER_CASE_A = 0x61;
const int _LOWER_CASE_F = 0x66;
const int _LOWER_CASE_Z = 0x7A;

const String _hexDigits = "0123456789ABCDEF";

/**
 * A parsed URI, such as a URL.
 *
 * **See also:**
 *
 * * [URIs][uris] in the [library tour][libtour]
 * * [RFC-3986](http://tools.ietf.org/html/rfc3986)
 *
 * [uris]: https://www.dartlang.org/docs/dart-up-and-running/ch03.html#uris
 * [libtour]: https://www.dartlang.org/docs/dart-up-and-running/contents/ch03.html
 */
abstract class Uri {
  /**
   * Returns the natural base URI for the current platform.
   *
   * When running in a browser this is the current URL of the current page
   * (from `window.location.href`).
   *
   * When not running in a browser this is the file URI referencing
   * the current working directory.
   */
  external static Uri get base;

  /**
   * Creates a new URI from its components.
   *
   * Each component is set through a named argument. Any number of
   * components can be provided. The [path] and [query] components can be set
   * using either of two different named arguments.
   *
   * The scheme component is set through [scheme]. The scheme is
   * normalized to all lowercase letters. If the scheme is omitted or empty,
   * the URI will not have a scheme part.
   *
   * The user info part of the authority component is set through
   * [userInfo]. It defaults to the empty string, which will be omitted
   * from the string representation of the URI.
   *
   * The host part of the authority component is set through
   * [host]. The host can either be a hostname, an IPv4 address or an
   * IPv6 address, contained in '[' and ']'. If the host contains a
   * ':' character, the '[' and ']' are added if not already provided.
   * The host is normalized to all lowercase letters.
   *
   * The port part of the authority component is set through
   * [port].
   * If [port] is omitted or `null`, it implies the default port for
   * the URI's scheme, and is equivalent to passing that port explicitly.
   * The recognized schemes, and their default ports, are "http" (80) and
   * "https" (443). All other schemes are considered as having zero as the
   * default port.
   *
   * If any of `userInfo`, `host` or `port` are provided,
   * the URI has an authority according to [hasAuthority].
   *
   * The path component is set through either [path] or
   * [pathSegments].
   * When [path] is used, it should be a valid URI path,
   * but invalid characters, except the general delimiters ':/@[]?#',
   * will be escaped if necessary.
   * When [pathSegments] is used, each of the provided segments
   * is first percent-encoded and then joined using the forward slash
   * separator.
   *
   * The percent-encoding of the path segments encodes all
   * characters except for the unreserved characters and the following
   * list of characters: `!$&'()*+,;=:@`. If the other components
   * necessitate an absolute path, a leading slash `/` is prepended if
   * not already there.
   *
   * The query component is set through either [query] or [queryParameters].
   * When [query] is used, the provided string should be a valid URI query,
   * but invalid characters, other than general delimiters,
   * will be escaped if necessary.
   * When [queryParameters] is used the query is built from the
   * provided map. Each key and value in the map is percent-encoded
   * and joined using equal and ampersand characters.
   * A value in the map must be either a string, or an [Iterable] of strings,
   * where the latter corresponds to multiple values for the same key.
   *
   * The percent-encoding of the keys and values encodes all characters
   * except for the unreserved characters, and replaces spaces with `+`.
   * If `query` is the empty string, it is equivalent to omitting it.
   * To have an actual empty query part,
   * use an empty map for `queryParameters`.
   *
   * If both `query` and `queryParameters` are omitted or `null`,
   * the URI has no query part.
   *
   * The fragment component is set through [fragment].
   * It should be a valid URI fragment, but invalid characters other than
   * general delimiters, are escaped if necessary.
   * If `fragment` is omitted or `null`, the URI has no fragment part.
   */
  factory Uri(
      {String scheme,
      String userInfo,
      String host,
      int port,
      String path,
      Iterable<String> pathSegments,
      String query,
      Map<String, dynamic /*String|Iterable<String>*/ > queryParameters,
      String fragment}) = _Uri;

  /**
   * Creates a new `http` URI from authority, path and query.
   *
   * Examples:
   *
   * ```
   * // http://example.org/path?q=dart.