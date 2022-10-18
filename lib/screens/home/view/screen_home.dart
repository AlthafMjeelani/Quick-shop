import 'package:ecommerse/core/constents.dart';
import 'package:ecommerse/screens/authentication/view/screen_forgetpassword.dart';
import 'package:ecommerse/screens/authentication/view/screen_login.dart';
import 'package:ecommerse/screens/authentication/view/screen_registration.dart';
import 'package:ecommerse/screens/home/controller/screen_home_provider.dart';
import 'package:ecommerse/screens/home/view/screen_all_products.dart';
import 'package:ecommerse/screens/splash/view/screen_spalsh.dart';
import 'package:ecommerse/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenHomeProvider>(context, listen: false);
    final tabController = TabController(length: 3, vsync: Scaffold.of(context));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 101, 153, 231),
              Color.fromARGB(255, 124, 239, 250)
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/images/shopping_cart-removebg-preview.png',
                      ),
                    ),
                    ConstentsItems.ksizedBoxW10,
                    const Text(
                      'APP NAME',
                      style: ConstentsItems.kTextBlack,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: ConstentsItems.kIconsize32,
                      ),
                    )
                  ],
                ),
                ConstentsItems.ksizedBox20,
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 133, 227, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ConstentsItems.ksizedBox20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/shirtimage.png'),
                              ),
                              ConstentsItems.ksizedBox20,
                              Text(
                                'Shirts',
                                style: ConstentsItems.kTextBlackLargeSize,
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/t shirt.jpg'),
                              ),
                              ConstentsItems.ksizedBox20,
                              Text(
                                'T Shirts',
                                style: ConstentsItems.kTextBlackLargeSize,
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/pands.png'),
                              ),
                              ConstentsItems.ksizedBox20,
                              Text(
                                'Pants',
                                style: ConstentsItems.kTextBlackLargeSize,
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/pands.png'),
                              ),
                              ConstentsItems.ksizedBox20,
                              Text(
                                'Pants',
                                style: ConstentsItems.kTextBlackLargeSize,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ConstentsItems.ksizedBox10,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
