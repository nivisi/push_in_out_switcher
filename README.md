# push_in_out_switcher [![pub version][pub-version-img]][pub-version-url]

🔄 An animated switcher with the push-in-out animation.

## How to use

### Install the package

Add the dependency to **pubspec.yaml**:

```
dependencies:
  push_in_out_switcher: ^1.0.0
```

### Use it!

```dart
Widget build(BuildContext context) {
  final icon = isPasswordVisible = isPasswordVisible
    ? Icons.visibility_off
    : Icons.visibility;

  return PushInOutSwitcher(
    child: Icon(
      icon,
      key: ValueKey(icon),
    ),
  );
}
```

### Optional params

| Param    | Default                      | What's this        |
| :------- | :--------------------------- | :----------------- |
| duration | Duration(milliseconds: 250)  | Animation duration |
| curve    | Curves.easeInOut             | Animation curve    |
| fade     | true                         | Whether to use fading aimation along with scaling animation. |

<!-- References -->
[pub-version-img]: https://img.shields.io/badge/pub-v1.0.0-0175c2?logo=flutter
[pub-version-url]: https://pub.dev/packages/push_in_out_switcher