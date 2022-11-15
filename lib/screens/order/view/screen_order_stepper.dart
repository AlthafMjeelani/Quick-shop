import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/address/widgets/address_stepper_widget.dart';
import 'package:ecommerse/screens/address/widgets/screen_addresslist.dart';
import 'package:ecommerse/screens/order/view/screen_order_summery.dart';
import 'package:ecommerse/screens/payment/controller/screen_paymentmethode_provider.dart';
import 'package:ecommerse/screens/payment/view/screen_selectpayment_methode.dart';
import 'package:ecommerse/screens/order/controller/screen_stepper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenStepperOrder extends StatelessWidget {
  const ScreenStepperOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentProvider =
        Provider.of<ScreenPaymentMethodeProvider>(context, listen: false);
    final stepperProvider =
        Provider.of<ScreenStepperProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      stepperProvider.currentStep = 0;
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // data.navigatorPop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Order',
          style: AppTextStyle.kTextSize18Black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (BuildContext context, ScreenStepperProvider value,
                  Widget? child) {
                return Stepper(
                  controlsBuilder: (context, details) {
                    return const SizedBox();
                  },
                  type: StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  currentStep: value.currentStep,
                  onStepContinue: value.continued,
                  onStepCancel: value.cancel,
                  steps: <Step>[
                    Step(
                      title: value.currentStep > 0
                          ? const Divider()
                          : const Text('Address'),
                      content: const ScreenAddressWidget(),
                      isActive: value.currentStep != 0,
                      state: value.currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: value.currentStep > 1
                          ? const Divider()
                          : const Text('Order Summery'),
                      content: const ScreenOrderSummay(),
                      isActive: value.currentStep >= 0,
                      state: value.currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: const Text('Payment'),
                      content: const ScreenPaymentMethode(),
                      isActive: value.currentStep >= 0,
                      state: value.currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Consumer(
              builder: (BuildContext context, ScreenStepperProvider value,
                  Widget? child) {
                return Row(
                  children: [
                    value.currentStep != 0
                        ? IconButton(
                            onPressed: () {
                              value.cancel();
                            },
                            icon: const Icon(
                              Icons.keyboard_double_arrow_left_outlined,
                              size: 50,
                            ),
                          )
                        : const SizedBox(),
                    const Spacer(),
                    value.currentStep < 2
                        ? IconButton(
                            onPressed: () {
                              value.continued();
                            },
                            icon: const Icon(
                              Icons.keyboard_double_arrow_right,
                              size: 50,
                            ),
                          )
                        : Consumer(
                            builder: (BuildContext context,
                                ScreenPaymentMethodeProvider value,
                                Widget? child) {
                              return paymentProvider.isSuccess == true
                                  ? TextButton(
                                      onPressed: () {},
                                      child: const Text('View Order Details'),
                                    )
                                  : const SizedBox();
                            },
                          )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}