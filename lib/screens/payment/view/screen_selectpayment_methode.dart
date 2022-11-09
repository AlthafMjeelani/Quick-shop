import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/payment/controller/screen_paymentmethode_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/row_twoitem_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ScreenPaymentMethode extends StatefulWidget {
  const ScreenPaymentMethode({
    super.key,
  });
  @override
  State<ScreenPaymentMethode> createState() => _ScreenPaymentMethodeState();
}

late ScreenPaymentMethodeProvider paymentProvider;

class _ScreenPaymentMethodeState extends State<ScreenPaymentMethode> {
  @override
  void initState() {
    paymentProvider =
        Provider.of<ScreenPaymentMethodeProvider>(context, listen: false);
    paymentProvider.razorPayInitFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenPaymentMethodeProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.ksizedBox10,
          const Text(
            'Select a payment methode',
            style: AppTextStyle.kTextBlack20SizeWithUnderLine,
          ),
          Lottie.asset('assets/lottie/payment.json'),
          Container(
            width: double.infinity,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(179, 216, 211, 211),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer(
                builder: (BuildContext context,
                    ScreenPaymentMethodeProvider value, Widget? child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Options',
                        style: AppTextStyle.kTextBlack20Size,
                      ),
                      AppSpacing.ksizedBox20,
                      ListTile(
                        title: const Text(
                          'UPI/ATM Card',
                          style: AppTextStyle.kTextSize18Black,
                        ),
                        leading: Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            value: 'online',
                            groupValue: value.selectedType,
                            onChanged: (newValue) =>
                                value.radionButtonChange(newValue.toString()),
                          ),
                        ),
                        trailing: const Icon(
                          Icons.payment_outlined,
                          size: 40,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Cash on develery',
                          style: AppTextStyle.kTextSize18Black,
                        ),
                        leading: Transform.scale(
                          scale: 1.5,
                          child: Radio(
                            value: 'cod',
                            groupValue: value.selectedType,
                            onChanged: (newValue) =>
                                value.radionButtonChange(newValue.toString()),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          AppSpacing.ksizedBox20,
          Container(
            width: double.infinity,
            height: size.height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(179, 216, 211, 211),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'PRICE DETAILS',
                    style: AppTextStyle.kTextBlack16,
                  ),
                  AppSpacing.ksizedBox20,
                  RowTowItemWidget(
                    title1: Text('Price(items)'),
                    title2: Text('₹7,999'),
                  ),
                  AppSpacing.ksizedBox5,
                  RowTowItemWidget(
                    title1: Text('Delivery Charge'),
                    title2: Text(
                      'FREE',
                      style: AppTextStyle.kTextBlack16,
                    ),
                  ),
                  AppSpacing.ksizedBox5,
                  RowTowItemWidget(
                    title1: Text(
                      'Amount Payable',
                      style: AppTextStyle.kTextBlack16,
                    ),
                    title2: Text(
                      '₹7,999',
                      style: AppTextStyle.kTextBlack16,
                    ),
                  )
                ],
              ),
            ),
          ),
          AppSpacing.ksizedBox20,
          LongButtonWidget(
            text: 'Continue',
            onTap: () {
              data.goToPayment();
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    paymentProvider.razorpay.clear();
    super.dispose();
  }
}
