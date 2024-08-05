// File: lib/theme/theme_examples.dart

import 'package:flutter/material.dart';

class ThemeExamples {
  // 1. brightness
  static Widget brightnessExample() {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: AppBar(title: const Text('Light Theme')),
    );
  }

  // 2. primaryColor
  static Widget primaryColorExample(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  // 3. accentColor (deprecated, use colorScheme.secondary instead)
  static Widget secondaryColorExample(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: const Icon(Icons.add),
      onPressed: () {},
    );
  }

  // 4. canvasColor
  static Widget canvasColorExample(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: const Text('Canvas Background'),
    );
  }

  // 5. shadowColor
  static Widget shadowColorExample(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Theme.of(context).shadowColor,
      child: const Text('Elevated Text'),
    );
  }

  // 6. scaffoldBackgroundColor
  static Widget scaffoldBackgroundColorExample(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(child: Text('Scaffold Content')),
    );
  }

  // 7. bottomAppBarColor
  static Widget bottomAppBarColorExample(BuildContext context) {
    return BottomAppBar(
      color: BottomAppBarTheme.of(context).color,
      child:
          const Row(children: [Icon(Icons.menu), Spacer(), Icon(Icons.search)]),
    );
  }

  // 8. cardColor
  static Widget cardColorExample(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Card Content'),
      ),
    );
  }

  // 9. dividerColor
  static Widget dividerColorExample(BuildContext context) {
    return Divider(
      color: Theme.of(context).dividerColor,
    );
  }

  // 10. focusColor
  static Widget focusColorExample(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
      ),
    );
  }

  // 11. hoverColor
  static Widget hoverColorExample(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.hovered))
            return Theme.of(context).hoverColor;
          return null;
        }),
      ),
      child: const Text('Hover Me'),
      onPressed: () {},
    );
  }

  // 12. highlightColor
  static Widget highlightColorExample(BuildContext context) {
    return InkWell(
      highlightColor: Theme.of(context).highlightColor,
      child: const Text('Tap Me'),
      onTap: () {},
    );
  }

  // 13. splashColor
  static Widget splashColorExample(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).splashColor,
      child: const Text('Tap for Splash'),
      onTap: () {},
    );
  }

  // 14. selectedRowColor
  static Widget selectedRowColorExample(BuildContext context) {
    return DataTable(
      columns: const [DataColumn(label: Text('Column 1'))],
      rows: [
        DataRow(
          selected: true,
          color: MaterialStateProperty.all(Theme.of(context).primaryColor),
          cells: const [DataCell(Text('Selected Row'))],
        ),
      ],
    );
  }

  // 15. unselectedWidgetColor
  static Widget unselectedWidgetColorExample(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (_) {},
      activeColor: Theme.of(context).unselectedWidgetColor,
    );
  }

  // 16. disabledColor
  static Widget disabledColorExample(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return Theme.of(context).disabledColor;
          }
          return Colors.blue;
        }),
      ),
      onPressed: null,
      child: const Text('Disabled Button'),
    );
  }

  // 17. buttonTheme
  static Widget buttonThemeExample(BuildContext context) {
    return ButtonTheme(
      minWidth: Theme.of(context).buttonTheme.minWidth,
      height: Theme.of(context).buttonTheme.height,
      child: ElevatedButton(
        child: const Text('Themed Button'),
        onPressed: () {},
      ),
    );
  }

  // 18. toggleButtonsTheme
  static Widget toggleButtonsThemeExample(BuildContext context) {
    return ToggleButtons(
      isSelected: const [true, false],
      onPressed: (_) {},
      color: Theme.of(context).toggleButtonsTheme.color,
      selectedColor: Theme.of(context).toggleButtonsTheme.selectedColor,
      children: const [Icon(Icons.format_bold), Icon(Icons.format_italic)],
    );
  }

  // 19. textTheme
  static Widget textThemeExample(BuildContext context) {
    return Text(
      'Headline Large',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  // 20. primaryTextTheme
  static Widget primaryTextThemeExample(BuildContext context) {
    return AppBar(
      title: Text(
        'App Bar Title',
        style: Theme.of(context).primaryTextTheme.titleLarge,
      ),
    );
  }

  // 21. inputDecorationTheme
  static Widget inputDecorationThemeExample(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Input',
        border: Theme.of(context).inputDecorationTheme.border,
      ),
    );
  }

  // 22. iconTheme
  static Widget iconThemeExample(BuildContext context) {
    return Icon(
      Icons.star,
      color: Theme.of(context).iconTheme.color,
      size: Theme.of(context).iconTheme.size,
    );
  }

  // 23. primaryIconTheme
  static Widget primaryIconThemeExample(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: Theme.of(context).primaryIconTheme.color,
      ),
    );
  }

  // 24. sliderTheme
  static Widget sliderThemeExample(BuildContext context) {
    return Slider(
      value: 0.5,
      onChanged: (_) {},
      activeColor: Theme.of(context).sliderTheme.activeTrackColor,
      inactiveColor: Theme.of(context).sliderTheme.inactiveTrackColor,
    );
  }

  // 25. tabBarTheme
  static Widget tabBarThemeExample(BuildContext context) {
    return TabBar(
      labelColor: Theme.of(context).tabBarTheme.labelColor,
      unselectedLabelColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
      tabs: const [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')],
    );
  }

  // 26. tooltipTheme
  // static Widget tooltipThemeExample(BuildContext context) {
  //   return Tooltip(
  //     message: 'This is a tooltip',
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).tooltipTheme.,
  //     ),
  //     child: const Text('Hover for tooltip'),
  //   );
  // }

  // 27. cardTheme
  static Widget cardThemeExample(BuildContext context) {
    return Card(
      shape: Theme.of(context).cardTheme.shape,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Card with Theme'),
      ),
    );
  }

  // 28. chipTheme
  static Widget chipThemeExample(BuildContext context) {
    return Chip(
      label: const Text('Themed Chip'),
      backgroundColor: Theme.of(context).chipTheme.backgroundColor,
      labelStyle: Theme.of(context).chipTheme.labelStyle,
    );
  }

  // 29. platform
  static Widget platformExample(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(platform: TargetPlatform.iOS),
      child: Switch(value: true, onChanged: (_) {}),
    );
  }

  // 30. materialTapTargetSize
  static Widget materialTapTargetSizeExample(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(materialTapTargetSize: MaterialTapTargetSize.padded),
      child: ElevatedButton(
        child: const Text('Padded Button'),
        onPressed: () {},
      ),
    );
  }

  // 31. applyElevationOverlayColor
  static Widget applyElevationOverlayColorExample(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 8,
      child: Container(
        height: 100,
        width: 100,
        child: const Center(child: Text('Elevated Surface')),
      ),
    );
  }

  // 32. colorScheme
  static Widget colorSchemeExample(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Text(
        'Primary Color',
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }

  // 33. typography
  static Widget typographyExample(BuildContext context) {
    return Text(
      'Typography Example',
      style: Theme.of(context).typography.englishLike.bodyLarge,
    );
  }

  // 34. useMaterial3
  static Widget useMaterial3Example() {
    return Theme(
      data: ThemeData(useMaterial3: true),
      child: const Text('Material 3 Widget'),
    );
  }

  // 35. visualDensity
  static Widget visualDensityExample(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(visualDensity: VisualDensity.compact),
      child: const ListTile(title: Text('Compact List Tile')),
    );
  }
}
