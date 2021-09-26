import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:world_of_paladins/controllers/home_controller.dart';

class HomePage extends GetView {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'World Of Paladins',
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        //backgroundColor: Colors.teal.shade300,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.teal,
                Colors.blue.shade400,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.blueGrey,
          image: DecorationImage(
            image: AssetImage("assets/images/PaladinsBackGround.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Obx(
              () => Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            child: TextButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10.0),
                                backgroundColor: controller.btnAll.value
                                    ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
                                    : MaterialStateProperty.all<Color>(Colors.teal.shade300),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                alignment: Alignment.center,
                              ),
                              onPressed: () => controller.selecionafiltroClass(0),
                              child: Text(
                                'Todos',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 120,
                            child: TextButton.icon(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10.0),
                                backgroundColor: controller.btnSupSelecionado.value
                                    ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
                                    : MaterialStateProperty.all<Color>(Colors.teal.shade300),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                alignment: Alignment.topLeft,
                              ),
                              onPressed: () => controller.selecionafiltroClass(1),
                              icon: Image.asset(
                                "assets/icons/Support.png",
                                color: Colors.black,
                              ),
                              label: Text(
                                'Supporte',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 120,
                            child: TextButton.icon(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10.0),
                                backgroundColor: controller.btntankSelecionado.value
                                    ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
                                    : MaterialStateProperty.all<Color>(Colors.teal.shade300),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                alignment: Alignment.topLeft,
                              ),
                              onPressed: () => controller.selecionafiltroClass(2),
                              icon: Image.asset(
                                "assets/icons/Front_Line.png",
                                color: Colors.black,
                              ),
                              label: Text(
                                'Tanker',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 120,
                            child: TextButton.icon(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10.0),
                                backgroundColor: controller.btnFlankSelecionado.value
                                    ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
                                    : MaterialStateProperty.all<Color>(Colors.teal.shade300),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                alignment: Alignment.topLeft,
                              ),
                              onPressed: () => controller.selecionafiltroClass(3),
                              icon: Image.asset(
                                "assets/icons/Flank.png",
                                color: Colors.black,
                              ),
                              label: Text(
                                'Flanco',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: 120,
                            child: TextButton.icon(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10.0),
                                backgroundColor: controller.btnDmgSelecionado.value
                                    ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
                                    : MaterialStateProperty.all<Color>(Colors.teal.shade300),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                alignment: Alignment.topLeft,
                              ),
                              onPressed: () => controller.selecionafiltroClass(4),
                              icon: Image.asset(
                                "assets/icons/Damage.png",
                                color: Colors.black,
                              ),
                              label: Text(
                                'Damage',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GetBuilder(
                init: controller,
                autoRemove: false,
                builder: (HomeController controller) {
                  if (controller.campeoesExibicao.length <= 0) return Container();
                  return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      controller.campeoesExibicao.length,
                      (index) {
                        return Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(90),
                                border: Border.all(color: Colors.teal, width: 2.0),
                              ),
                              child: InkWell(
                                onTap: () => Get.toNamed(
                                  '/championDetails',
                                  arguments: controller.campeoesExibicao[index],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: CachedNetworkImage(
                                    fadeOutDuration: Duration(milliseconds: 500),
                                    imageUrl: controller.campeoesExibicao[index]["ChampionIcon_URL"],
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.teal.shade300,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                  // CachedNetworkImage(
                                  //   imageUrl: controller.campeoesExibicao[index]["ChampionIcon_URL"],
                                  //   fadeOutDuration: Duration(milliseconds: 2000),
                                  //   placeholder: (context, url) => Image.asset(
                                  //     'assets/images/PaladinsBackGround.png',
                                  //     width: 150,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                                  //   fit: BoxFit.contain,
                                  // ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                controller.campeoesExibicao[index]["Name"],
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
