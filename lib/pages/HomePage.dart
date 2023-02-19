import 'package:flutter/material.dart';
import 'package:mytestingserver/widgets/particles/CircularParticles.dart';
import 'package:mytestingserver/utili/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mytestingserver/utili/responsive/HomePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMobile = false;
  late HomePageResponsive res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, con) {
        HomePageResponsive res = HomePageResponsive(
          screenHeight: con.maxHeight,
          screenWidth: con.maxWidth,
        );
        return Container(
          decoration: BoxDecoration(
            color: kHomeBackGroundColor,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: CircularParticle(
                  key: UniqueKey(),
                  awayRadius: 80,
                  numberOfParticles: res.numberOfParticle(),
                  speedOfParticles: 1.5,
                  height: con.maxHeight,
                  width: con.maxWidth,
                  onTapAnimation: true,
                  particleColor: Colors.grey.withOpacity(0.5),
                  awayAnimationDuration: Duration(milliseconds: 600),
                  maxParticleSize: 8,
                  isRandSize: true,
                  isRandomColor: true,
                  randColorList: [
                    Colors.red.withAlpha(210),
                    Colors.blue.withAlpha(210),
                    Colors.yellow.withAlpha(210),
                    Colors.green.withAlpha(210)
                  ],
                  awayAnimationCurve: Curves.easeInOutBack,
                  enableHover: true,
                  hoverColor: Colors.grey.withOpacity(0.5),
                  hoverRadius: 90,
                  connectDots: true, //not recommended
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  height: con.maxHeight,
                  width: con.maxWidth,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: res.profileRadius(),
                            child: ClipOval(
                              child: Image.asset(kHomeProfileImage,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            width: con.maxWidth / 10,
                          ),
                          SizedBox(
                            width: res.textBoxSize(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hello! Welcome to My Testing Server',
                                  style: TextStyle(
                                    fontSize: res.primeryTextSize(),
                                    color: kHomeTextColor,
                                  ),
                                ),
                                Text(
                                  'I\' $kHomeUserName',
                                  style: TextStyle(
                                    fontSize: res.secondaryTextSize(),
                                    fontWeight: FontWeight.bold,
                                    color: kHomeTextColor,
                                  ),
                                ),
                                Text(
                                  '$kHomeUserTagLine',
                                  style: TextStyle(
                                    fontSize: res.primeryTextSize(),
                                    color: kHomeTextColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '$kHomeUserMessage',
                                  style: TextStyle(
                                    fontSize: res.teriaryTextSize(),
                                    color: kHomeTextMessageColor,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(
                                  height: con.maxHeight / 25,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _launchWhatsapp(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            kHomeButtonPrimeryColor),
                                    overlayColor: MaterialStateProperty
                                        .resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.hovered))
                                          return kHomeButtonSecondaryColor; //<-- SEE HERE
                                        return null; // Defer to the widget's default.
                                      },
                                    ),
                                  ),
                                  child: Text(
                                    '$kHomeButttonText',
                                    style: TextStyle(
                                      fontSize: res.primeryTextSize(),
                                      color: kHomeTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        );
      }),
    );
  }

  _launchWhatsapp(context) async {
    var whatsapp = "$kWhatsappNumber";
    var whatsappAndroid = Uri.parse(
        "whatsapp://send?phone=$whatsapp&text=Hello! I liked your Website");
    var whatsappBrowser = Uri.parse(
        "https://wa.me/923362578282?Hello!%20I%20liked%20your%20Website");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else if (await canLaunchUrl(whatsappBrowser)) {
      await launchUrl(whatsappBrowser);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }
}
