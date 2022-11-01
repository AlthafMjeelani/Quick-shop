import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SuccessDialouge extends StatelessWidget {
  const SuccessDialouge({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          width: 300,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.offAll(()=>ScreenLogin());
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 32,
                    ),
                  )
                ],
              ),
              const Image(
                image: AssetImage('assets/images/success_resetpass.png'),
              ),
              const Text(
                'Success!',
                style: AppTextStyle.kTextBlack50SizeForget,
              ),
              const Icon(
                Icons.check,
                size: 60,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
