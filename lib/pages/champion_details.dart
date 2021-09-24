import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_of_paladins/controllers/campion_details_controller.dart';
import 'package:world_of_paladins/models/champion_model.dart';

class ChampionPage extends GetView {
  final ct = Get.put(ChampionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ct.champion.name ?? "",
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
      body: Column(
        children: [
          Container(
            height: 400,
            width: Get.width,
            child: GetBuilder(
              builder: (ChampionController ct) {
                if (ct.habilidades.length <= 0) return Container();
                return ListView.builder(
                  itemCount: ct.habilidades.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(ct.habilidades[index].summary),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 120,
                          width: 150,
                          margin: EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              ct.habilidades[index].uRL,
                              fit: BoxFit.cover,
                              color: Color.fromRGBO(255, 255, 255, 0.7),
                              colorBlendMode: BlendMode.modulate,
                              loadingBuilder:
                                  (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
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
                        Text(
                          ct.habilidades[index].description,
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
