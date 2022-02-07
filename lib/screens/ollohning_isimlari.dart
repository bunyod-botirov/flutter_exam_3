import 'package:flutter/material.dart';
import 'package:exam_3/core/constant/size_config.dart';
import 'package:exam_3/datas/database.dart';

class OllohningIsmlari extends StatefulWidget {
  const OllohningIsmlari({Key? key}) : super(key: key);

  @override
  _OllohningIsmlariState createState() => _OllohningIsmlariState();
}

class _OllohningIsmlariState extends State<OllohningIsmlari> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asmoul husno"),
        backgroundColor: Colors.teal,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ExpansionTile(
                leading: Text("${index + 1}"),
                title: Text(
                  ismlar[index]["oqilishi"].toString(),
                  style: TextStyle(
                    fontSize: height(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  ismlar[index]["tarjimasi"].toString(),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  ismlar[index]["arabcha"].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width(20),
                        vertical: height(10),
                      ),
                      child: Text(
                        ismlar[index]["tarjimasi"].toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: height(16),
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: ismlar.length,
        ),
      ),
    );
  }
}
