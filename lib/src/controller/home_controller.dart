import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_getx_palette_diary/src/binding/write_binding.dart';
import 'package:flutter_getx_palette_diary/src/view/write.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<DateTime> headerDate = DateTime.now().obs;
  Rx<Size> calendarSize = Size.zero.obs;
  GlobalKey calendarKey = GlobalKey();
  GlobalKey calendarHeaderKey = GlobalKey();
  Rx<Size> calendarHeaderSize = Size.zero.obs;

  void onCalendarCreated(PageController pageController) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        var calendarSizeData = getRenderBoxSize(calendarKey);
        if (calendarSizeData != null) {
          calendarSize(calendarSizeData);
        }
        var calendarHeaderSizeData = getRenderBoxSize(calendarHeaderKey);
        if (calendarHeaderSizeData != null) {
          calendarHeaderSize(calendarHeaderSizeData);
        }
      },
    );
  }

  Size? getRenderBoxSize(GlobalKey key) {
    if (key.currentContext != null) {
      var renderBox = key.currentContext!.findRenderObject() as RenderBox;
      var translation = renderBox.getTransformTo(null).getTranslation();
      return Size(0, renderBox.size.height + translation.y + 20);
    }
    return null;
  }

  void handleFabPress() {
    Get.to(() => const Write(), binding: WriteBinding());
  }
}
