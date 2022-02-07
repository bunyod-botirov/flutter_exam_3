import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:exam_3/core/constant/size_config.dart';
import 'package:exam_3/service/namoz_vaqti_service.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePageState1 createState() => _HomePageState1();
}

class _HomePageState1 extends State<HomePage1> {
  @override
  void initState() {
    super.initState();
    SeriveNamozVaqti.getDataNamozVaqti();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Flutter Exam 3",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          SeriveNamozVaqti.getDataNamozVaqti();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                "https://i.pinimg.com/originals/45/39/9c/45399cf18c45bb715d385f60b5bef15d.jpg",
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: container(
                      "Namoz Vaqtlari",
                      "https://www.clipartmax.com/png/full/263-2636327_mosque-clipart-logo-logo-islam.png",
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/namozvaqt");
                    },
                  ),
                  InkWell(
                    child: container(
                      "Tasbeh",
                      "https://www.creativefabrica.com/wp-content/uploads/2020/07/14/muslim-holding-prayer-beads-aka-tasbih-Graphics-4621491-1.jpg",
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/tasbeh");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: container(
                      "Ollohning 99 ismi",
                      "https://cdn.pixabay.com/photo/2020/12/31/20/12/names-of-allah-5877329_1280.jpg",
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/ism");
                    },
                  ),
                  InkWell(
                    child: container(
                      "Calendar",
                      "https://webstockreview.net/images/lamp-clipart-arabian-9.png",
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/calendar");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: container(
                      "Qur'on",
                      "https://tanzeel.dk/____impro/1/onewebmedia/tanzeel-logo%201.png?etag=%22cbc4-5d2cb75b%22&sourceContentType=image%2Fpng",
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/qur'on");
                    },
                  ),
                  InkWell(
                    child: container(
                      "Masjidlar",
                      "https://www.creativefabrica.com/wp-content/uploads/2018/11/Mosque-islamic-Ramadan-kareem-logo-by-Mansel-Brist-1.jpg",
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/masjidlar");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container container(String name, String image) {
    return Container(
      width: width(165),
      height: height(145),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(1)),
        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: topradius(),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    image,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: bottomradius(),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius topradius() {
    return const BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(15.0),
    );
  }

  BorderRadius bottomradius() {
    return const BorderRadius.only(
      bottomLeft: Radius.circular(15.0),
      bottomRight: Radius.circular(15.0),
    );
  }
}
