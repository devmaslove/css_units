import 'package:css_units/css_units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('check vmin conversion', () {
    CssViewportUnits.initCustomSize(const Size(100, 300));
    expect(10.vmin, 10.0);
  });
}
