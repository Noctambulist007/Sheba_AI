import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/presentation/theme/app_theme.dart';
import 'package:sheba_ai/presentation/util/routes.dart';

class ShebaAi extends StatelessWidget {
  const ShebaAi({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

        //
        child: MaterialApp(
          title: 'ShebaAi',
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          onGenerateRoute: Routes.generateRoutes,
          builder: (context, widget) {
            return widget ?? const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
