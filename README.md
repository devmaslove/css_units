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

Например, зададим размеры `20 vmin` у контейнера:

```dart
@override
Widget build(BuildContext context) {
  CssViewportUnits.initContextSizes(context);
  return Container(
    width: 20.vmin,
    height: 20.vmin,
    margin: EdgeInsets.all(1.vmin),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(1.vmin),
    ),
  );
}
```

## Почитать что это за размеры

https://alligator.io/css/viewport-units/

https://learn.javascript.ru/css-units#otnositelno-ekrana-vw-vh-vmin-vmax
