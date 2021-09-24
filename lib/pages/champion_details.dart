import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_of_paladins/controllers/campion_details_controller.dart';

class ChampionPage extends GetView {
  final ct = Get.put(ChampionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ct.champion.name ?? "",
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "História",
              style: TextStyle(
                color: Colors.amber,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(ct.champion.lore!),
          ),
          Divider(
            color: Colors.teal.shade300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Habilidades",
              style: TextStyle(
                color: Colors.amber,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Obx(
                  () => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(ct.habilidades[ct.index.value].summary.toUpperCase()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10.0),
                              backgroundColor: MaterialStateProperty.all(Colors.teal.shade300),
                            ),
                            onPressed: ct.index.value != 0 ? () => ct.index.value-- : null,
                            child: Text("VOLTAR"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 120,
                                width: 150,
                                margin: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    ct.habilidades[ct.index.value].uRL,
                                    fit: BoxFit.cover,
                                    color: Color.fromRGBO(255, 255, 255, 0.9),
                                    colorBlendMode: BlendMode.modulate,
                                    loadingBuilder: (BuildContext context, Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.teal.shade300,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10.0),
                              backgroundColor: MaterialStateProperty.all(Colors.teal.shade300),
                            ),
                            onPressed:
                                ct.index.value != ct.habilidades.length - 1 ? () => ct.index.value++ : null,
                            child: Text("PROXIMA"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: Get.width,
                        child: Text(
                          ct.habilidades[ct.index.value].description,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
