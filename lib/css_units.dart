library css_units;

import 'package:flutter/material.dart';

extension CssViewportUnits on double {
  static const double _fontSizeDef = 14.0;
  static Size? _screenSize;
  static double? _fontSize;

  static initContextSizes(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _fontSize = DefaultTextStyle.of(context).style.fontSize ?? _fontSizeDef;
  }

  static initDefaultFontSize(final double fontSize) {
    _fontSize = fontSize;
  }

  static initConstraintsSize(final BoxConstraints constraints) {
    initCustomSize(constraints.biggest);
  }

  static initCustomSize(final Size size) {
    _screenSize = size;
  }

  double get vmin {
    return this / 100.0 * (_screenSize?.shortestSide ?? 100.0);
  }

  double get vmax {
    return this / 100.0 * (_screenSize?.longestSide ?? 100.0);
  }

  double get vw {
    return this / 100.0 * (_screenSize?.width ?? 100.0);
  }

  double get vh {
    return this / 100.0 * (_screenSize?.height ?? 100.0);
  }

  double get rem {
    return this * (_fontSize ?? _fontSizeDef);
  }

  /// pc - Percent % = 1/100 of value
  ///
  /// FractionallySizedBox(
  ///         widthFactor: 50.pc,
  ///         heightFactor: 50.pc,
  ///         child: ...
  double get pc {
    return this / 100.0;
  }
}

extension IntCssViewportUnits on int {
  double get vmin => toDouble().vmin;

  double get vmax => toDouble().vmax;

  double get vw => toDouble().vw;

  double get vh => toDouble().vh;

  double get rem => toDouble().rem;

  /// pc - Percent % = 1/100 of value
  ///
  /// FractionallySizedBox(
  ///         widthFactor: 50.pc,
  ///         heightFactor: 50.pc,
  ///         child: ...
  double get pc => toDouble().pc;
}
