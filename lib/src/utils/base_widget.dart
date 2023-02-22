import 'package:base_flutter/src/utils/sizing_information.dart';
import 'package:flutter/widgets.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({Key? key, required this.builder}) : super(key: key);

  DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    var orientation = mediaQuery.orientation;
    double deviceWidth = 0;
    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }
    if (deviceWidth > 950) {
      return DeviceScreenType.Desktop;
    }
    if (deviceWidth > 600) {
      return DeviceScreenType.Tablet;
    }
    return DeviceScreenType.Mobile;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxSizing) {
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        screenSize: mediaQuery.size,
        deviceType: getDeviceType(mediaQuery),
        localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
