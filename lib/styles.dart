import 'package:flutter/material.dart';

//Static means: I dont have to create an instance of this class "style" to use this member here, because this is a final member I cannot reassign this.
class Styles {
  static const _textSizeLarge = 35.0;
  static const _textSizeDefault = 16.0;
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('666666');
  static final String _fontNameDefault = 'Sedan';
  static final navBarTitle =
      TextStyle(fontFamily: _fontNameDefault, fontSize: _textSizeLarge);

  static final headerLarge = TextStyle(
      fontFamily: _fontNameDefault,
      fontSize: _textSizeLarge,
      color: _textColorStrong);

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
