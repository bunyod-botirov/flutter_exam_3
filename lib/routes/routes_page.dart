import 'package:flutter/material.dart';
import 'package:exam_3/screens/masjidlar.dart';
import 'package:exam_3/screens/quron.dart';
import 'package:exam_3/screens/asosiy_page.dart';
import 'package:exam_3/screens/calendar.dart';
import 'package:exam_3/screens/namoz_vaqti.dart';
import 'package:exam_3/screens/ollohning_isimlari.dart';
import 'package:exam_3/screens/tasbeh.dart';

class GenerateRoute {
  static routerGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomePage1());
      case "/namozvaqt":
        return MaterialPageRoute(builder: (context) => const NamozVaqt());
      case "/tasbeh":
        return MaterialPageRoute(builder: (context) => const TasbehPage());
      case "/ism":
        return MaterialPageRoute(
          builder: (context) => const OllohningIsmlari(),
        );
      case "/calendar":
        return MaterialPageRoute(builder: (context) => const CalendarPage());
      case "/masjidlar":
        return MaterialPageRoute(builder: (context) => const MasjidlarPage());
      case "/qur'on":
        return MaterialPageRoute(builder: (context) => const QuronPage());
    }
  }
}
