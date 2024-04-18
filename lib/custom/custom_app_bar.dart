import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:word_game/constants/colors.dart';

import '../constants/constans.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final double? leadingWidth;
  final double bottomHeight;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.bottom,
    this.bottomHeight = 0,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 20.w,
        right: 20.w,
      ),
      child: AppBar(
        title: title != null
            ? Text(
                title!,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        leading: leading ??
            (context.router.canPop()
                ? IconButton(
                    onPressed: onBackPressed ?? () => context.maybePop(),
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: textColor,
                      size: 24.sp,
                    ),
                  )
                : null),
        toolbarHeight: 44.h,
        leadingWidth: 44.w,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kAppBarHeight + bottomHeight + 24.h);
}
