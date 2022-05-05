# CSS Units

Adding a converter for [CSS Viewport Units](https://alligator.io/css/viewport-units/) - `vmin`, `vmax`, `vw`, `vh`, `rem`.

Convenient wrapper to set dimensions relative to a screen
or LayoutBuilder`s BoxConstraints.

[Русский README.md](README.ru.md)

## Idea

The idea is to add relative sizes from CSS Units 3 spec.
To do this without functions and classes, just extending the `double`:

- `42.vmin` - 42% of the **smallest** side of the screen in logical pixels (double)
- `42.vmax` - 42% of the **largest** side of the screen in logical pixels (double)
- `42.vw` - 42% of the **width** of the screen in logical pixels (double)
- `42.vh` - 42% of the **height** of the screen in logical pixels (double)
- `3.rem` - 42 - three heights of **default font size** (if you didn't change then `14.0 * 3`) in logical pixels (double)

Plus added percentage:

- `42.pc` - 42%, i.e. 0.42  (double)

Inspired by the idea from the package [dimension](https://pub.dev/packages/dimension)

## Features

Readability!

See how beautiful and clear it is to set relative sizes: `width: 4.vmax`

## Install

Change `pubspec.yaml` (and run an implicit pub get):

```yaml
dependencies:
  css_units: <latest_version>
```

Or get the latest version from github:

```yaml
dependencies:
  css_units:
    git:
      url: https://github.com/dmitrymaslovhome/css_units
```

## Usage

Attention! You should always call `CssViewportUnits.initContextSizes(context);`
before using relative sizes.

Dimension initialization can also be set via:

- `CssViewportUnits.initConstraintsSize(final BoxConstraints constraints)` - set dimensions relative to LayoutBuilder`s BoxConstraints
- `CssViewportUnits.initCustomSize(final Size size)` - set custom *screen size*
- `CssViewportUnits.initDefaultFontSize(final double fontSize)` - set custom default font size

Attention! Call them directly in the context where you use relative sizes.
You need to understand that the relative sizes are calculated dynamically.
This means that if you set viewport size in one widget, and use relative sizes in others,
they will not rebuild when viewport size change.

For example, let's set the dimensions to `60 vmin` for the Container:

```dart
@override
Widget build(BuildContext context) {
  CssViewportUnits.initContextSizes(context);
  return Container(
    width: 60.vmin, // cellSize
    height: 60.vmin, // cellSize
    margin: EdgeInsets.all(1.vmin), // cellGap
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(1.vmin), // borderRadius
    ),
  );
}
```

![](.github/example.png)

If you put all the sizes in a separate resource file, to get values,
use getters (so that sizes are calculated dynamically when requested).
Also take out the initialization of the context sizes there and call it before using it.

For example, let's take out the sizes in `resources/app_sizes.dart`:

```dart
class AppSizes {
  static initContextSizes(BuildContext context) {
    CssViewportUnits.initContextSizes(context);
  }

  static get cellSize => 60.vmin;
  static get cellGap => 1.vmin;
  static get borderRadius => 1.vmin;
  static get fontSize => 7.5.vmin;
}
```
