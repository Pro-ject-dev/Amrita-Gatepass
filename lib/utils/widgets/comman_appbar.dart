import 'package:amrita_gatepass/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? name;
  final Color? color;
  final bool? isHome;

  const CommonAppBar({
    super.key,
    this.name,
    this.color,
    this.isHome = false,
  });
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: AppColors.primaryColor,
      centerTitle: false,
      title: Text(
        name ?? '',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.appBarForeGroundColor,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          isHome! ? null : Get.back();
        },
        icon: Container(
          child: Icon(
            isHome! ? Icons.home : Icons.arrow_back_ios,
            size: isHome! ? 25.sp : 20.sp,
            color: AppColors.appBarForeGroundColor,
          ),
        ),
      ),
    );
  }
}
