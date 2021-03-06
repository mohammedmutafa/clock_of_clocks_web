// Copyright 2019 Egor Belibov. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import '../../../../../../../../g_components/core_button.dart';
import '../../../../../../../../g_helpers/links.dart';
import '../../../../../../../../g_models/device_type.dart';
import '../../../../../../../../g_styles/colors.dart';
import '../../../../../../../../g_wrapper/custom_cursor.dart';
import 'styles.dart';

const projectUrl = 'https://github.com/egorbelibov/clock_of_clocks';

class ActionButton extends StatelessWidget {
  final String _text;
  final DeviceType deviceType;

  ActionButton(this._text, {@required this.deviceType})
      : assert(_text != null),
        assert(deviceType != null);

  @override
  Widget build(BuildContext context) {
    switch (deviceType) {
      case DeviceType.desktopBig:
      case DeviceType.desktop:
        return Row(
          children: [
            _buildButton(context),
            _buildPlainBox(context),
          ],
        );
      case DeviceType.mobile:
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: _buildButton(context),
        );
      case DeviceType.mobileMini:
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: _buildButton(context),
        );
      default:
        return Container();
    }
  }

  Widget _buildButton(BuildContext context) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: CoreButton(
        height: 50,
        width: buttonWidth(deviceType),
        onTap: () => openWebUrl(projectUrl),
        borderRadius: buttonBorderRadius(deviceType),
        color: themeBasedColor(context, PaletteColor.tertiaryColor),
        child: Padding(
          padding: buttonPadding(deviceType),
          child: Center(
            child: Text(
              _text,
              style: buttonTextStyle(context, deviceType),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlainBox(BuildContext context) {
    if (deviceType.isDesktopBased()) {
      return Container(
        height: 50,
        width: 45,
        color: themeBasedColor(context, PaletteColor.primaryColor),
      );
    } else {
      return Container(
        height: 6,
        width: 70,
        color: themeBasedColor(context, PaletteColor.primaryColor),
      );
    }
  }
}
