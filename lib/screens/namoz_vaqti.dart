import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:exam_3/core/constant/size_config.dart';
import 'package:exam_3/service/namoz_vaqti_service.dart';

late String popupMenuValue = "toshkent";

class NamozVaqt extends StatefulWidget {
  const NamozVaqt({Key? key}) : super(key: key);

  @override
  _NamozVaqtState createState() => _NamozVaqtState();
}

class _NamozVaqtState extends State<NamozVaqt> {
  List name = ["Bomdod", "Quyosh", "Peshin", "Asr", "Shom", "Hufton"];

  var region;

  @override
  void initState() {
    super.initState();
    SeriveNamozVaqti.box;
    region = SeriveNamozVaqti.box!.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Namoz Vaqtlari"),
        actions: <Widget>[
          popupMenu(),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box("namozvaqti").listenable(),
          builder: (context, box, __) {
            final datas = box.values.toList();
            List region = SeriveNamozVaqti.box!.values.toList();
            List vaqt = [
              datas[0]["times"]["tong_saharlik"],
              datas[0]["times"]["quyosh"],
              datas[0]["times"]["peshin"],
              datas[0]["times"]["asr"],
              datas[0]["times"]["shom_iftor"],
              datas[0]["times"]["hufton"],
            ];
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/masjid3.jpeg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: width(350),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            region[0]["region"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            region[0]["date"].toString().substring(0, 10),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(
                            height(10.0),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.all(
                              Radius.circular(height(11.0)),
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.notifications,
                              color: Colors.black,
                              size: height(26),
                            ),
                            title: Text(
                              name[index].toString(),
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: height(20),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            trailing: Text(
                              vaqt[index].toString(),
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: height(20),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: vaqt.length,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  PopupMenuButton<String> popupMenu() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: Text("Toshkent"),
          value: "toshkent",
        ),
        const PopupMenuItem(
          child: Text("Andijon"),
          value: "andijon",
        ),
        const PopupMenuItem(
          child: Text("Qarshi"),
          value: "qarshi",
        ),
        const PopupMenuItem(
          child: Text("Namangan"),
          value: "namangan",
        ),
        const PopupMenuItem(
          child: Text("Farg'ona"),
          value: "quva",
        ),
        const PopupMenuItem(
          child: Text("Qo'qon"),
          value: "qo'qon",
        ),
        const PopupMenuItem(
          child: Text("Guliston"),
          value: "guliston",
        ),
        const PopupMenuItem(
          child: Text("Jizzax"),
          value: "jizzax",
        ),
        const PopupMenuItem(
          child: Text("Samarqand"),
          value: "samarqand",
        ),
        const PopupMenuItem(
          child: Text("Navoiy"),
          value: "navoiy",
        ),
        const PopupMenuItem(
          child: Text("Buxoro"),
          value: "buxoro",
        ),
        const PopupMenuItem(
          child: Text("Termiz"),
          value: "termiz",
        ),
        const PopupMenuItem(
          child: Text("Urganch"),
          value: "urganch",
        ),
        const PopupMenuItem(
          child: Text("Nukus"),
          value: "nukus",
        ),
      ],
      onSelected: (val) async {
        popupMenuValue = val.toString();
        SeriveNamozVaqti.getDataNamozVaqti();
        setState(() {});
      },
    );
  }
}
