// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/constants/port_folio_dimensions.dart';

class PortFolioSpacing extends StatelessWidget {
  final double height;
  final double width;

  const PortFolioSpacing.height(this.height) : width = PortFolioDimensions.zero;

  const PortFolioSpacing.width(this.width) : height = PortFolioDimensions.zero;

  PortFolioSpacing.tinyHeight() : this.height(PortFolioDimensions.tiny.h);
  PortFolioSpacing.smallHeight() : this.height(PortFolioDimensions.small.h);
  PortFolioSpacing.mediumHeight() : this.height(PortFolioDimensions.medium.h);
  PortFolioSpacing.bigHeight() : this.height(PortFolioDimensions.big.h);
  PortFolioSpacing.largeHeight() : this.height(PortFolioDimensions.large.h);
  PortFolioSpacing.tinyWidth() : this.width(PortFolioDimensions.tiny.w);
  PortFolioSpacing.smallWidth() : this.width(PortFolioDimensions.small.w);
  PortFolioSpacing.mediumWidth() : this.width(PortFolioDimensions.medium.w);
  PortFolioSpacing.bigWidth() : this.width(PortFolioDimensions.big.w);
  PortFolioSpacing.largeWidth() : this.width(PortFolioDimensions.large.w);
  const PortFolioSpacing.empty()
      : width = PortFolioDimensions.zero,
        height = PortFolioDimensions.zero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
