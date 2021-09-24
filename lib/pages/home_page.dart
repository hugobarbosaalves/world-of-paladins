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
            color: Colors.white54,
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
                        return Visibility(
                          visible:
                              true, //controller.campeoes[index]["Roles"].contains("Flanco") ? true : false,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
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
                                    child: Image.network(
                                      controller.campeoesExibicao[index]["ChampionIcon_URL"],
                                      fit: BoxFit.cover,
                                      color: Color.fromRGBO(255, 255, 255, 0.7),
                                      colorBlendMode: BlendMode.modulate,
                                      loadingBuilder: (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.teal,
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                    loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
