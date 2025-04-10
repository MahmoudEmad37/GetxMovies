import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/values/localization/local_keys.dart';

class CustomOnError extends StatelessWidget {
  final String? error;

  const CustomOnError({
    super.key,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 0.75.sh,
      child: Text(
        error ?? LocalKeys.kGenericErrorMessage.tr,
      ),
    );
  }
}
