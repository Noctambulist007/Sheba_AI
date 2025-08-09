import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheba_ai/injection.dart';
import 'package:sheba_ai/sheba_ai.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
  );

  await ScreenUtil.ensureScreenSize();

  // Initialize dependency injection
  await setup();

  runApp(
      ProviderScope(
          child: const ShebaAi(),
      ),
  );
}
