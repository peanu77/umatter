import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/campus_profile_controller.dart';

class CampusProfessionalProfilePage extends StatefulWidget {
  const CampusProfessionalProfilePage({Key? key}) : super(key: key);

  @override
  State<CampusProfessionalProfilePage> createState() =>
      _CampusProfessionalProfilePageState();
}

class _CampusProfessionalProfilePageState
    extends State<CampusProfessionalProfilePage> {
  final _profileController = CampusProfileControllerPage();
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.65,
              child: Image.asset(
                'assets/img/image.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.3,
              child: Container(
                color: Colors.white,
              ),
            ),
            SlidingUpPanel(
              minHeight: _height * 0.38,
              maxHeight: _height * 0.75,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
              panelBuilder: (ScrollController controller) =>
                  SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                      ),
                      height: _height * 0.35,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 4,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          // Name
                          Text(
                            _profileController.campusProfileController[0].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const Spacer(),
                          // Profession
                          Text(
                            _profileController
                                .campusProfileController[0].profession,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[700],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Office Start
                              Column(
                                children: [
                                  const Text(
                                    "Office Start",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      letterSpacing: 0.7,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "${_profileController.campusProfileController[0].officeStart} AM",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.7,
                                    ),
                                  ),
                                ],
                              ),
                              // Office End
                              Column(
                                children: [
                                  const Text(
                                    "Office End",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      letterSpacing: 0.7,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "${_profileController.campusProfileController[0].officeEnd} PM",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.7,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          OutlinedButton(
                            // TODO: NAVIGATE TO MESSENGER
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('Message Counsellor'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Room No.
                              Text(
                                "Room No. \n${_profileController.campusProfileController[0].buildingNo}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const Divider(),
                              Container(
                                height: 50.0,
                                width: 1,
                                color: Colors.grey,
                              ),
                              // Floor No.

                              Text(
                                "Floor No. \n${_profileController.campusProfileController[0].floor}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const Divider(),
                              Container(
                                height: 50.0,
                                width: 1,
                                color: Colors.grey,
                              ),
                              // Room No.
                              Text(
                                "Room No. \n${_profileController.campusProfileController[0].roomNo}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Text(
                            _profileController.campusProfileController[0].bio,
                            style: const TextStyle(
                                fontSize: 16.0, letterSpacing: 0.5),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
