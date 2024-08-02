import 'package:flutter/material.dart';

class Spacing {
  // Base spacing unit
  static const double space = 8.0;

  // General spacing
  static const double space0 = 0.0;
  static const double spaceXXS = space * 0.25; // 2.0
  static const double spaceXS = space * 0.5; // 4.0
  static const double spaceS = space; // 8.0
  static const double spaceM = space * 2; // 16.0
  static const double spaceL = space * 3; // 24.0
  static const double spaceXL = space * 4; // 32.0
  static const double spaceXXL = space * 6; // 48.0

  // Padding
  static const EdgeInsets paddingAll0 = EdgeInsets.all(space0);
  static const EdgeInsets paddingAllXS = EdgeInsets.all(spaceXS);
  static const EdgeInsets paddingAllS = EdgeInsets.all(spaceS);
  static const EdgeInsets paddingAllM = EdgeInsets.all(spaceM);
  static const EdgeInsets paddingAllL = EdgeInsets.all(spaceL);

  // Common horizontal paddings
  static const EdgeInsets paddingH0 = EdgeInsets.symmetric(horizontal: space0);
  static const EdgeInsets paddingHS = EdgeInsets.symmetric(horizontal: spaceS);
  static const EdgeInsets paddingHM = EdgeInsets.symmetric(horizontal: spaceM);
  static const EdgeInsets paddingHL = EdgeInsets.symmetric(horizontal: spaceL);

  // Common vertical paddings
  static const EdgeInsets paddingV0 = EdgeInsets.symmetric(vertical: space0);
  static const EdgeInsets paddingVS = EdgeInsets.symmetric(vertical: spaceS);
  static const EdgeInsets paddingVM = EdgeInsets.symmetric(vertical: spaceM);
  static const EdgeInsets paddingVL = EdgeInsets.symmetric(vertical: spaceL);

  // App edge padding
  static const EdgeInsets appEdgePadding =
      EdgeInsets.symmetric(horizontal: spaceM, vertical: spaceS);

  // List item spacing
  static const double listItemSpacing = spaceS;

  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(spaceM);

  // Section spacing
  static const double sectionSpacing = spaceL;

  // Border Radius
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 16.0;

  // Divider
  static const double dividerThin = 0.5;
  static const double dividerThick = 1.0;

  // Icon sizes
  static const double iconS = 16.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;

  // Text sizes
  static const double textXS = 12.0;
  static const double textS = 14.0;
  static const double textM = 16.0;
  static const double textL = 18.0;
  static const double textXL = 20.0;
  static const double textXXL = 24.0;

  // Common widget heights
  static const double appBarHeight = 56.0;
  static const double buttonHeight = 48.0;
  static const double inputFieldHeight = 40.0;

  // Spacers
  static const Widget verticalSpaceXXS = SizedBox(height: spaceXXS);
  static const Widget verticalSpaceXS = SizedBox(height: spaceXS);
  static const Widget verticalSpaceS = SizedBox(height: spaceS);
  static const Widget verticalSpaceM = SizedBox(height: spaceM);
  static const Widget verticalSpaceL = SizedBox(height: spaceL);
  static const Widget verticalSpaceXL = SizedBox(height: spaceXL);

  static const Widget horizontalSpaceXXS = SizedBox(width: spaceXXS);
  static const Widget horizontalSpaceXS = SizedBox(width: spaceXS);
  static const Widget horizontalSpaceS = SizedBox(width: spaceS);
  static const Widget horizontalSpaceM = SizedBox(width: spaceM);
  static const Widget horizontalSpaceL = SizedBox(width: spaceL);
  static const Widget horizontalSpaceXL = SizedBox(width: spaceXL);
}
