
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List <ContainerListModel> containerList= [
  ContainerListModel(text1: "Need a \n Property?",
      text2: "Own a Property & Pay with Ease", assets: "assets/images/home_image.png"),
  ContainerListModel(text1: "Agents & \n Developers?",
      text2: "Post & Sell Your Properties", assets: "assets/images/agents.png"),
  ContainerListModel(text1: "Mortgage \n Financing?",
      text2: "Access funds to power that ongoing project", assets: "assets/images/mortgage_financing.png"),
  ContainerListModel(text1: "My Account \n Area?",
      text2: "Take me to my Dashboard", assets: "assets/images/user_account.png"),
];

class ContainerListModel {
  final String text1;
  final String text2;
  final String assets;
  ContainerListModel({
    required this.text1,
    required this.text2,
    required this.assets
  });
}

Widget buildContainer(ContainerListModel model,BuildContext context) {
  return Container(
    // margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.only(left: 10,right: 5,bottom: 10),
    height: 170,
    width: MediaQuery.of(context).size.width / 2,
    decoration: BoxDecoration(
      gradient:const LinearGradient(colors: [Color(0xFF2B99FB), Color(0xFF372275)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          model.assets,
          height: 70,
          width: 46,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        Text(
          model.text1,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFD700),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            model.text2,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFF7F7F7).withOpacity(0.8)
            ),
          ),
        ),
      ],
    ),
  );
}
