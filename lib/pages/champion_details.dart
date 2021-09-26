import 'package:cached_network_image/cached_network_image.dart';
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "História",
              textAlign: TextAlign.center,
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
            child: Text(
              ct.champion.lore!,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(
            color: Colors.teal.shade300,
            thickness: 2,
            indent: 30,
            endIndent: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Habilidades",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amber,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            children: [
              Obx(
                () => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        ct.habilidades[ct.index.value].summary.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10.0),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.teal.shade300,
                            ),
                          ),
                          onPressed: ct.index.value != 0 ? () => ct.index.value-- : null,
                          child: Text("VOLTAR"),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 120,
                              width: 150,
                              margin: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CachedNetworkImage(
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: ct.habilidades[ct.index.value].uRL,
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
                              ),
                            ),
                          ],
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
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.teal.shade300,
            thickness: 2,
            indent: 30,
            endIndent: 30,
          ),
        ],
      ),
    );
  }
}
