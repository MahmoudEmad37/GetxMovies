import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_loading.dart';

class CustomOnLoading extends StatelessWidget {
  const CustomOnLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: .75.sh,
      child: const CustomCircleProgress(),
    );
  }
}
