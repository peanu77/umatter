import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/controllers/intervention/intervention_page_controller.dart';
import 'package:get/get.dart';
import 'package:umatter/models/contants/constants.dart';

class ExternalDirectoriesPage extends StatefulWidget {
  const ExternalDirectoriesPage({Key? key}) : super(key: key);
  @override
  _ExternalDirectoriesPageState createState() =>
      _ExternalDirectoriesPageState();
}

class _ExternalDirectoriesPageState extends State<ExternalDirectoriesPage> {
  final interventionPage = InterventionPageController();
  final url = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.chevron_left),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.25,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                color: Colors.blue,
              ),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/img/download.jpg'),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                'Landline',
                style: kTitle,
              ),
            ),
            _buildLandLineCard(size),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                'Globe and TM',
                style: kTitle,
              ),
            ),
            _buildPrePaid1(size),
            _buildPrePaid2(size),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                'Smart, Sun and TNT',
                style: kTitle,
              ),
            ),
            _buildSmart(size),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                'Social Media',
                style: kTitle,
              ),
            ),
            _buildFacebook(size),
            _buildTwitter(size),
            const SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
      floatingActionButton: _buildCardInfo(),
    );
  }

  _buildLandLineCard(Size size) => SizedBox(
        height: size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onPressed: () => interventionPage
                .launchPhoneCall('tel:${interventionPage.landlineNum}'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interventionPage.landlineNum.toString(),
                  style: kBtnFnt,
                ),
                const Icon(Icons.call),
              ],
            ),
          ),
        ),
      );
  _buildPrePaid1(Size size) => SizedBox(
        height: size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onPressed: () => interventionPage
                .launchPhoneCall('tel: ${interventionPage.prepaid1}'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interventionPage.prepaid1,
                  style: kBtnFnt,
                ),
                const Icon(Icons.smartphone),
              ],
            ),
          ),
        ),
      );
  _buildPrePaid2(Size size) => SizedBox(
        height: size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onPressed: () => interventionPage
                .launchPhoneCall('tel: ${interventionPage.prepaid2}'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interventionPage.prepaid2,
                  style: kBtnFnt,
                ),
                const Icon(Icons.smartphone),
              ],
            ),
          ),
        ),
      );
  _buildSmart(Size size) => SizedBox(
        height: size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onPressed: () => interventionPage
                .launchPhoneCall('tel: ${interventionPage.smartPrepaid}'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interventionPage.smartPrepaid,
                  style: kBtnFnt,
                ),
                const Icon(Icons.smartphone),
              ],
            ),
          ),
        ),
      );

  /// List of Social Media
  _buildFacebook(Size size) => SizedBox(
        height: size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onPressed: () => interventionPage
                .launchPhoneCall('https://www.facebook.com/ncmhcrisishotline/'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interventionPage.fb_page,
                  style: kBtnFnt,
                ),
                SvgPicture.asset(
                  'assets/img/additional/fb.svg',
                  height: 50.0,
                  width: 100.0,
                ),
              ],
            ),
          ),
        ),
      );

  /// DOH Twitter Page
  _buildTwitter(Size size) => SizedBox(
        height: size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            onPressed: () => interventionPage
                .launchPhoneCall('https://twitter.com/ncmhhotline'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interventionPage.twitter_page,
                  style: kBtnFnt,
                ),
                SvgPicture.asset(
                  'assets/img/additional/twitter.svg',
                  height: 50.0,
                  width: 100.0,
                ),
              ],
            ),
          ),
        ),
      );

  _buildCardInfo() => Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          onPressed: () {
            interventionPage
                .launchUrl('https://doh.gov.ph/NCMH-Crisis-Hotline');
          },
          label: const Text('For More Info'),
        ),
      );
}
