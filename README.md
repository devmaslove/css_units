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
- `1.5.rem` - one and a half height **default font size** (if nothing was changed then `fontSize=14.0` by default) in logical pixels (double)

Plus added percentage:

- `42.pc` - 42%, i.e. 0.42  (double)

Made on the basis of the package [dimension](https://pub.dev/packages/dimension)

## Features

Readability!

See how beautiful and clear it is to set relative sizes: `width: 4.vmax`

## Install

Change `pubspec.yaml` (and run an implicit pub get):

```yaml
dependencies:
  css_units:
    git:
      url: https://github.com/dmitrymaslovhome/css_units
```

## Usage

Attention! You should always call `CssViewportUnits.initContextSizes(context);`
before using relative sizes - about what we will calculate size.
You can do this once at the topmost parent widget.

Dimension initialization can also be set via:

- `CssViewportUnits.initConstraintsSize(final BoxConstraints constraints)` - set dimensions relative to LayoutBuilder`s BoxConstraints
- `CssViewportUnits.initCustomSize(final Size size)` - set custom *screen size*
- `CssViewportUnits.initDefaultFontSize(final double fontSize)` - set custom default font size

For example, let's set the dimensions to `20 vmin` for the Container:

```dart
@override
Widget build(BuildContext context) {
  CssViewportUnits.initContextSizes(context);
  return Container(
    width: 20.vmin, // cellSize
    height: 20.vmin, // cellSize
    margin: EdgeInsets.all(1.vmin), // cellGap
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(1.vmin), // borderRadius
    ),
  );
}
```

If you put all the sizes in a separate resource file, to get values,
use getters (so that sizes are calculated dynamically when requested).
Also take out the initialization of the context sizes there and call it before using it.

For example, let's take out the sizes in `resources/app_sizes.dart`:

```dart
class AppSizes {
  static initContextSizes(BuildContext context) {
    CssViewportUnits.initContextSizes(context);
  }

  static get cellSize => 20.vmin;
  static get cellGap => 1.vmin;
  static get borderRadius => 1.vmin;
  static get fontSize => 7.5.vmin;
}
```
