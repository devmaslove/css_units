# CSS Units

Добавляем конвертер для CSS Viewport Units - `vmin`, `vmax`, `vw`, `vh`, `rem`.

Удобная обертка чтобы задавать размеры относительно экрана
или BoxConstraints LayoutBuilder`а

## Idea

Идея в том чтобы добавить относительные размеры из CSS Units 3 spec.
Сделать это без функций и классов, просто расширяя стандартный `double`:

- `42.vmin` - 42% **наименьшей** стороны экрана в logical pixels (double)
- `42.vmax` - 42% **наибольшей** стороны экрана в logical pixels (double)
- `42.vw` - 42% **ширины** экрана в logical pixels (double)
- `42.vh` - 42% **высоты** экрана в logical pixels (double)
- `1.5.rem` - полторы высоты **размера шрифта** по умолчанию (если ничего не меняли то `fontSize=14.0` по умолчанию) в logical pixels (double)

Плюсом добавлен еще процент:

- `42.pc` - 42%, то есть число 0.42  (double)

Сделано на основе пакета [dimension](https://pub.dev/packages/dimension)

## Features

Читабельность!

Смотрите как красиво и понятно задавать относительные размеры: `width: 4.vmax`

## Install

Change `pubspec.yaml` (and run an implicit pub get):

```yaml
dependencies:
  css_units:
    git:
      url: https://github.com/dmitrymaslovhome/css_units
```

## Usage

Внимание! Перед использованием относительных размеров нужно всегда вызывать
`CssViewportUnits.initContextSizes(context);` - то относительно чего мы будем
вычислять размер. Можно это сделать один раз у самого верхнего родительского виджета.

Инициализацию размеров также можно задавать через:

- `CssViewportUnits.initConstraintsSize(final BoxConstraints constraints)` - задать размеры относительно BoxConstraints LayoutBuilder`а
- `CssViewportUnits.initCustomSize(final Size size)` - задать кастомный размер *экрана*
- `CssViewportUnits.initDefaultFontSize(final double fontSize)` - задать кастомный размер шрифта по умолчанию

Например, зададим размеры `20 vmin` у контейнера:

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

Если все размеры складываете в отдельный файл ресурсов, для получения
значений используйте геттеры (чтобы размеры вычислялись динамически при запросе)
и вынесете туда инициализацию размеров контекста и вызывайте уже его перед использованием.

Например, вынесем размеры в `resources/app_sizes.dart`:

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

## Почитать что это за CSS Viewport Units

- [На английком](https://alligator.io/css/viewport-units/)
- [На русском](https://learn.javascript.ru/css-units#otnositelno-ekrana-vw-vh-vmin-vmax)
