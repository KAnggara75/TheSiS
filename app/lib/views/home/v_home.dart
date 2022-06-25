import 'package:flutter/material.dart';
import 'package:thesis/models/m_board.dart';
import '../../constant/size.dart';
import '../../widget/w_card.dart';
import '../../widget/w_title.dart';
import '../../widget/w_control.dart';
import '../../controllers/c_home.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends HomeController {
  @override
  Widget build(BuildContext context) {
    // Add french messages
    timeago.setLocaleMessages('id', timeago.IdMessages());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Tittle Section
        const Flexible(
          flex: 2,
          child: TitleBar(),
        ),
        Flexible(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 1,
                  child: FutureBuilder<Board>(
                    future: futureBoard,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CardMini(
                          color: const Color(0xffffd6a5),
                          title: "Jumlah Lokasi Tersimpan",
                          content: "${snapshot.data!.location.length}",
                          subtitle: "Koordinat",
                        );
                      } else if (snapshot.hasError) {
                        return const CardMini(
                          color: Color(0xffffd6a5),
                          isLoaded: false,
                        );
                      }
                      return const CardMini(
                        color: Color(0xffffd6a5),
                        isLoaded: false,
                      );
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FutureBuilder<Board>(
                    future: futureBoard,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CardMini(
                          color: const Color(0xfffdffb6),
                          title: "Jarak dengan Kendaraan",
                          content: "${harvesin(
                            snapshot.data!.location.last.lat,
                            snapshot.data!.location.last.lon,
                          )}",
                          subtitle: "Km",
                        );
                      } else if (snapshot.hasError) {
                        return const CardMini(
                          color: Color(0xfffdffb6),
                          isLoaded: false,
                        );
                      }
                      return const CardMini(
                        color: Color(0xfffdffb6),
                        isLoaded: false,
                      );
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FutureBuilder<Board>(
                    future: futureBoard,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CardMini(
                          color: const Color(0xffcaffbf),
                          title: "Status Kendaraan",
                          content: snapshot.data!.location.last.updatedAt
                                  .add(const Duration(seconds: 30))
                                  .isAfter(DateTime.now())
                              ? "Online"
                              : "Offline",
                          titleColor: snapshot.data!.location.last.updatedAt
                                  .add(const Duration(seconds: 30))
                                  .isAfter(DateTime.now())
                              ? Colors.amber
                              : Colors.red,
                        );
                      } else if (snapshot.hasError) {
                        return const CardMini(
                          color: Color(0xffcaffbf),
                          isLoaded: false,
                        );
                      }
                      return const CardMini(
                        color: Color(0xffcaffbf),
                        isLoaded: false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // Control Section
        const Flexible(
          flex: 12,
          child: ControlWidget(),
        ),
        //Acc Chart Section
        Flexible(
          flex: 18,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffcaffbf),
              ),
              height: getProportionateScreenHeight(200),
              // width: getProportionateScreenWidth(100),
              child: Center(
                child: FutureBuilder<Board>(
                  future: futureBoard,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      control = snapshot.data!.control;
                      return Column(
                        children: [
                          Text("Ini ${snapshot.data!.name}"),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      // return Text(snapshot.data!.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
