import 'package:ecommerse/core/constents.dart';
import 'package:flutter/material.dart';

class ScreenAllProduct extends StatelessWidget {
  const ScreenAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        backgroundImage: AssetImage('assets/images/pands.png'),
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
                        backgroundImage: AssetImage('assets/images/pands.png'),
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
    );
  }
}

//  @override
//   Widget build(BuildContext context) {
//     final data = Provider.of<ScreenHomeProvider>(context, listen: false);
//     final tabController = TabController(length: 3, vsync: Scaffold.of(context));
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(255, 101, 153, 231),
//               Color.fromARGB(255, 124, 239, 250)
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage(
//                         'assets/images/shopping_cart-removebg-preview.png',
//                       ),
//                     ),
//                     ConstentsItems.ksizedBoxW10,
//                     const Text(
//                       'APP NAME',
//                       style: ConstentsItems.kTextBlack,
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.search,
//                         size: ConstentsItems.kIconsize32,
//                       ),
//                     )
//                   ],
//                 ),
//                 ConstentsItems.ksizedBox20,
//                 TabbarWidget(
//                   tabController: tabController,
//                   tabs: const [
//                     Tab(text: 'ALL'),
//                     Tab(text: 'MEN'),
//                     Tab(text: 'WOMEN'),
//                   ],
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     controller: tabController,
//                     children: const [
//                       ScreenAllProduct(),
//                       ScreenLogin(),
//                       ScreenForgrtPassword()
//                     ],
//                   ),
//                 ),
//                 ConstentsItems.ksizedBox20,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
