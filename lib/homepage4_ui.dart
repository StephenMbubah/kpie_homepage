
import 'package:flutter/material.dart';
import 'package:kpie_homepage/Components/gap.dart';

import 'homePage4_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var image  = Image.asset('assets/images/house.jpg',fit: BoxFit.cover,height: size.height,width: size.width,key:const ValueKey(2));
    Widget? myAnimatedWidget(){
      setState(() {
        image = Image.asset('assets/images/lady.jpg',fit: BoxFit.cover,height: size.height,width: size.width,key: const ValueKey(1),);
      });
      return image;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      //Color(0xffF7F7F7),
      body: SafeArea(
        child: Stack(
          children: [
             AnimatedSwitcher(duration: const Duration(seconds: 2),
              transitionBuilder: (Widget child,Animation<double> animation) => ScaleTransition(scale: animation,child: child,),
               child: myAnimatedWidget(),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 23.38, right: 23.38),
              child: Column(
                  children: [
                    const Gap(23),
                    Row(
                      children: [
                        Image.asset("assets/images/home_image.png"),
                        const Text("HAV’I-LAH\nHOME FINANCE",
                            style: TextStyle(
                                fontSize:12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF)
                            )),
                      ],
                    ),
                    const SizedBox(),
                    const Gap(53),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text("BUYING PROPERTIES\n MADE EASY",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Color(0xFFFFD700),

                        ),),
                    ),
                    const Gap(170),
                    const SizedBox(
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Take a tour",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFFD700))),
                            const Gap(5),
                            Image.asset("assets/images/arrow_forward.png"),
                          ],
                        ),
                        const Text("Welcome, James",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFD700)
                          ),)
                      ],
                    ),
                    const Gap(40),
                    const SizedBox(
                    ),
                    Expanded(

                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 8.0,
                          children: List.generate(containerList.length, (index) {
                            return Center(
                              child: buildContainer(containerList[index],context),
                            );
                          }
                          )
                      ),
                    ),
                  ]),
            )
          ],
        )
    )
    );
  }
}
