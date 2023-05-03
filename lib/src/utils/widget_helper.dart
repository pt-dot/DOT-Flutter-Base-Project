import 'package:flutter/widgets.dart';

import '../ui/styles/styles.dart';

extension TextWidget on String {
  Widget thinStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.thinStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget extraLightStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.extraLightStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget lightStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.lightStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget regularStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.regularStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget mediumStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.mediumStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget semiBoldStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.semiBoldStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget boldStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.boldStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget extraBoldStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.extraBoldStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget blackStyle({double? fontSize, Color? color}) {
    return Text(
      this,
      style: AppTextStyle.blackStyle.copyWith(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget titleStyle({double? fontSize}) {
    return Text(
      this,
      style: AppTextStyle.titleStyle.copyWith(fontSize: fontSize),
    );
  }
}

extension addMargin on Widget {
  Widget addMarginBottom(double margin) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: this,
    );
  }

  Widget addMarginTop(double margin) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: this,
    );
  }

  Widget addMarginLeft(double margin) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      child: this,
    );
  }

  Widget addMarginRight(double margin) {
    return Container(
      margin: EdgeInsets.only(right: margin),
      child: this,
    );
  }

  Widget addAllMargin(double margin) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: this,
    );
  }

  Widget addPaddingBottom(double padding) {
    return Container(
      padding: EdgeInsets.only(bottom: padding),
      child: this,
    );
  }

  Widget addPaddingTop(double padding) {
    return Container(
      padding: EdgeInsets.only(top: padding),
      child: this,
    );
  }

  Widget addPaddingLeft(double padding) {
    return Container(
      padding: EdgeInsets.only(left: padding),
      child: this,
    );
  }

  Widget addPaddingRight(double padding) {
    return Container(
      padding: EdgeInsets.only(right: padding),
      child: this,
    );
  }

  Widget addAllPadding(double padding) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget addSymmetricPadding({double? vertical, double? horizontal}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 0,
        horizontal: horizontal ?? 0,
      ),
      child: this,
    );
  }

  Widget addSymmetricMargin({double? vertical, double? horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: vertical ?? 0,
        horizontal: horizontal ?? 0,
      ),
      child: this,
    );
  }

  Widget addMarginOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }

  Widget onTap(VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: this,
    );
  }

  Widget get addExpanded {
    return Expanded(child: this);
  }

  Widget get addFlexible {
    return Flexible(child: this);
  }
}

extension AddEdgeInsert on num {
  EdgeInsets get toEdgeInsert {
    return EdgeInsets.all(this.toDouble());
  }

  BorderRadius get toBorderRadius {
    return BorderRadius.circular(this.toDouble());
  }
}

class WidgetHelper {}
