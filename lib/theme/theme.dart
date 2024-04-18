import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:word_game/constants/system_ui_overlay_styles.dart';

import '../constants/colors.dart';
import '../constants/constans.dart';
import '../constants/font_sizes.dart';
import '../constants/text_styles.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primary),
  floatingActionButtonTheme: _floatingActionButtonThemeData,
  outlinedButtonTheme: _outLinedButtonThemeData,
  cupertinoOverrideTheme: _cupertinoThemeData,
  inputDecorationTheme: _inputDecorationTheme,
  filledButtonTheme: _filledButtomThemeData,
  // datePickerTheme: _datePickerThemeData,
  bottomSheetTheme: _bottomSheetThemeData,
  textButtonTheme: _textButtonThemeData,
  actionIconTheme: _actionIconThemeData,
  iconButtonTheme: _iconButtonThemeData,
  popupMenuTheme: _popupMenuThemeData,
  listTileTheme: _listTileThemeData,
  checkboxTheme: _checkboxThemeData,
  scaffoldBackgroundColor: bgColor,
  dividerTheme: _dividerThemeData,
  drawerTheme: _drawerThemeData,
  primaryTextTheme: _textTheme,
  dialogBackgroundColor: white,
  radioTheme: _radioThemeData,
  primaryColorLight: primary,
  dialogTheme: _dialogTheme,
  appBarTheme: _appBarTheme,
  primaryColor: primary,
  textTheme: _textTheme,
  dividerColor: gray,

  useMaterial3: true,
);

final _outLinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    minimumSize: MaterialStatePropertyAll(Size.fromHeight(56.r)),
    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
    ),
    side: MaterialStatePropertyAll(
      BorderSide(color: primary, width: 1.r),
    ),
    textStyle: MaterialStatePropertyAll(titleSmall.copyWith(color: primary)),
    foregroundColor: const MaterialStatePropertyAll(primary),
    padding: MaterialStatePropertyAll(EdgeInsets.all(2.r)),
  ),
);

final _filledButtomThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    minimumSize: MaterialStatePropertyAll(Size.fromHeight(54.r)),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return gray;
        } else {
          return primary;
        }
      },
    ),
    side: const MaterialStatePropertyAll(BorderSide.none),
    padding: const MaterialStatePropertyAll(EdgeInsets.zero),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
    ),
    textStyle: MaterialStatePropertyAll(titleMedium.copyWith(color: white)),
    foregroundColor: const MaterialStatePropertyAll(white),
    elevation: const MaterialStatePropertyAll(0),
  ),
);

final _popupMenuThemeData = PopupMenuThemeData(
  color: bgColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  elevation: 0,
  textStyle: titleMedium,
);

final _floatingActionButtonThemeData = FloatingActionButtonThemeData(
  backgroundColor: primary,
  foregroundColor: bgColor,
  elevation: 0,
  focusElevation: 0,
  hoverElevation: 0,
  extendedIconLabelSpacing: 0,
  highlightElevation: 0,
  disabledElevation: 0,
  extendedPadding: EdgeInsets.zero,
  sizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  extendedSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  smallSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  largeSizeConstraints: BoxConstraints.tightFor(width: 60.r, height: 60.r),
  iconSize: 36.r,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(100.r),
    ),
  ),
);

const _cupertinoThemeData = CupertinoThemeData(
  primaryColor: primary,
  applyThemeToAll: true,
  scaffoldBackgroundColor: bgColor,
  barBackgroundColor: Colors.white,
  brightness: Brightness.light,
);

final _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: bgColor,
  iconColor: darkBlue,
  suffixIconColor: darkBlue,
  prefixIconColor: darkBlue,
  hintStyle: labelLarge.copyWith(color: darkBlue.withOpacity(.4)),
  labelStyle: labelLarge.copyWith(color: darkBlue),
  errorStyle: bodySmall.copyWith(color: red),
  errorMaxLines: 2,
  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
  floatingLabelStyle: bodySmall.copyWith(color: darkBlue),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: ligthBlue, width: 1.r),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: primary, width: 1.r),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: ligthBlue, width: 1.r),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: red, width: 1.r),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6.r),
    borderSide: BorderSide(color: red, width: 1.r),
  ),
);

final _bottomSheetThemeData = BottomSheetThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
  dragHandleColor: gray,
  clipBehavior: Clip.hardEdge,
  showDragHandle: true,
  backgroundColor: white,
  dragHandleSize: Size(134.w, 5.h),
  elevation: 0,
  modalElevation: 0,
);

final _textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    foregroundColor: const MaterialStatePropertyAll(primary),
    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    padding: const MaterialStatePropertyAll(EdgeInsets.zero),
    textStyle: MaterialStatePropertyAll(titleMedium.copyWith(fontSize: fontSize14)),
  ),
);

final _actionIconThemeData = ActionIconThemeData(
  backButtonIconBuilder: (context) => IconButton(
    onPressed: context.router.maybePop,
    icon: const Icon(Icons.arrow_back_ios),
  ),
);

final _iconButtonThemeData = IconButtonThemeData(style: _iconButtonStyle);

final _iconButtonStyle = ButtonStyle(
  foregroundColor: const MaterialStatePropertyAll(primary),
  backgroundColor: const MaterialStatePropertyAll(primary),
  iconColor: const MaterialStatePropertyAll(bgColor),
  padding: MaterialStatePropertyAll(EdgeInsets.all(10.r)),
  shape: const MaterialStatePropertyAll(CircleBorder()),
);

final _dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
  contentTextStyle: bodyLarge.copyWith(color: textColor),
  titleTextStyle: titleSmall,
  backgroundColor: bgColor,
  elevation: 0,
);

final _dividerThemeData = DividerThemeData(
  color: gray,
  thickness: 1.r,
  space: 0,
);

const _drawerThemeData = DrawerThemeData(
  backgroundColor: darkBlue,
  elevation: 0,
);

final _listTileThemeData = ListTileThemeData(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
  titleTextStyle: titleMedium,
  subtitleTextStyle: bodyMedium.copyWith(color: textColor),
  dense: true,
  textColor: textColor,
  tileColor: ligthBlue,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  horizontalTitleGap: 0,
  iconColor: primary,
);

final _checkboxThemeData = CheckboxThemeData(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  checkColor: const MaterialStatePropertyAll(white),
  shape: RoundedRectangleBorder(
    side: BorderSide(color: primary, width: 1.r),
    borderRadius: BorderRadius.circular(4.r),
  ),
  side: BorderSide(color: darkBlue.withOpacity(.2), width: 1.r),
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) return primary;
    return null;
  }),
);

final _radioThemeData = RadioThemeData(
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  fillColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) return primary;
    return gray;
  }),
);

final _appBarTheme = AppBarTheme(
  iconTheme: _iconThemeData,
  systemOverlayStyle: systemUiOverlayStyle,
  actionsIconTheme: _iconThemeData,
  titleTextStyle: titleMedium,
  foregroundColor: bgColor,
  scrolledUnderElevation: 0,
  elevation: 0,
  centerTitle: true,
  toolbarHeight: kAppBarHeight,
  backgroundColor: Colors.transparent,
);

final _iconThemeData = IconThemeData(
  color: darkBlue,
  size: 100.r,
);

final _textTheme = TextTheme(
  titleSmall: titleSmall,
  titleMedium: titleMedium,
  titleLarge: titleLarge,
  headlineSmall: headlineSmall,
  headlineMedium: headlineMedium,
  headlineLarge: headlineLarge,
  bodySmall: bodySmall,
  bodyMedium: bodyMedium,
  bodyLarge: bodyLarge,
  labelSmall: labelSmall,
  labelMedium: labelMedium,
  labelLarge: labelLarge,
  displaySmall: displaySmall,
  displayMedium: displayMedium,
  displayLarge: displayLarge,
);

final pinFieldTheme = PinTheme(
  height: 52.r,
  textStyle: bodyLarge,
  constraints: BoxConstraints(maxWidth: 52.r),
  decoration: BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(8.r),
    border: Border.all(color: gray),
  ),
);
final errorPinFieldTheme = PinTheme(
  height: 52.r,
  textStyle: bodyLarge,
  constraints: BoxConstraints(maxWidth: 52.r),
  decoration: BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(8.r),
    border: Border.all(color: red),
  ),
);

// final _datePickerThemeData = DatePickerThemeData(
//   backgroundColor: Colors.white,
//   headerBackgroundColor: Colors.white,
//   surfaceTintColor: Colors.white,
//   todayBorder: BorderSide.none,
//   weekdayStyle: lightTitleSmall.copyWith(color: secondaryTextColor),
//   dayStyle: lightTitleSmall,
//   headerForegroundColor: primaryTextColor,
//   headerHelpStyle: lightBodyMedium,
//   headerHeadlineStyle: lightBodySmall,
//   yearStyle: lightBodySmall,
//   shadowColor: requestContainerShadowColor,
//   elevation: 12.r,
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//   dayBackgroundColor: MaterialStateProperty.all(Colors.white),
//   todayBackgroundColor: const MaterialStatePropertyAll(selectedDayBackgroundColor),
//   todayForegroundColor: const MaterialStatePropertyAll(primary),
//   yearBackgroundColor: const MaterialStatePropertyAll(Colors.white),
//   yearOverlayColor: const MaterialStatePropertyAll(selectedDayBackgroundColor),
//   dayOverlayColor: const MaterialStatePropertyAll(selectedDayBackgroundColor),
//   yearForegroundColor: MaterialStateProperty.resolveWith((states) {
//     if (states.contains(MaterialState.selected)) {
//       return primary;
//     } else {
//       return primaryTextColor;
//     }
//   }),
//   dayForegroundColor: MaterialStateProperty.resolveWith((states) {
//     if (states.contains(MaterialState.selected)) {
//       return primary;
//     } else if (states.contains(MaterialState.disabled)) {
//       return hintColor;
//     } else {
//       return primaryTextColor;
//     }
//   }),
// );
