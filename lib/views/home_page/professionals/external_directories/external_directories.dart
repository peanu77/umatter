import 'package:flutter/material.dart';

import 'package:umatter/controllers/professionals_page_controller/external_directories_page_controller.dart';
import 'package:umatter/models/contants/constants.dart';

class ExternalDirectoriesPage extends StatefulWidget {
  const ExternalDirectoriesPage({Key? key}) : super(key: key);
  @override
  _ExternalDirectoriesPageState createState() =>
      _ExternalDirectoriesPageState();
}

class _ExternalDirectoriesPageState extends State<ExternalDirectoriesPage> {
  final interventionPage = InterventionPageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DOH Directories',
          style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.chevron_left, color: Colors.grey[600]),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                'Landline',
                style: kTitle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              _buildLandLineCard(size),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Globe and TM',
                style: kTitle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              _buildPrePaid1(size),
              const SizedBox(
                height: 10.0,
              ),
              _buildPrePaid2(size),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Smart, Sun and TNT',
                style: kTitle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              _buildSmart(size),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Social Media',
                style: kTitle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              _buildFacebook(size),
              const SizedBox(
                height: 10.0,
              ),
              _buildTwitter(size),
              const SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildCardInfo(),
    );
  }

  _buildLandLineCard(Size size) => SizedBox(
        height: size.height * 0.08,
        child: GestureDetector(
          onTap: () => interventionPage
              .launchPhoneCall('tel:${interventionPage.landlineNum}'),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.90)),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(interventionPage.landlineNum.toString(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 0.7,
                      )),
                  const Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  _buildPrePaid1(Size size) => SizedBox(
        height: size.height * 0.08,
        child: GestureDetector(
          onTap: () => interventionPage
              .launchPhoneCall('tel: ${interventionPage.prepaid1}'),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.90)),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(interventionPage.prepaid1,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 0.7,
                      )),
                  const Icon(
                    Icons.smartphone,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  _buildPrePaid2(Size size) => SizedBox(
        height: size.height * 0.08,
        child: GestureDetector(
          onTap: () => interventionPage
              .launchPhoneCall('tel: ${interventionPage.prepaid2}'),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.90)),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(interventionPage.prepaid2,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 0.7,
                      )),
                  const Icon(
                    Icons.smartphone,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  _buildSmart(Size size) => SizedBox(
        height: size.height * 0.08,
        child: GestureDetector(
          onTap: () => interventionPage
              .launchPhoneCall('tel: ${interventionPage.smartPrepaid}'),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.90)),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(interventionPage.smartPrepaid,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 0.7,
                      )),
                  const Icon(
                    Icons.smartphone,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  /// List of Social Media

  _buildFacebook(Size size) => SizedBox(
        height: size.height * 0.08,
        child: GestureDetector(
          onTap: () => interventionPage
              .launchPhoneCall('https://www.facebook.com/ncmhcrisishotline/'),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.90)),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(interventionPage.fbPage,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 0.7,
                      )),
                  const Icon(
                    Icons.smartphone,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  _buildTwitter(Size size) => SizedBox(
        height: size.height * 0.08,
        child: GestureDetector(
          onTap: () => interventionPage
              .launchPhoneCall('https://twitter.com/ncmhhotline'),
          child: Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.90)),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(interventionPage.twitterPage,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        letterSpacing: 0.7,
                      )),
                  const Icon(
                    Icons.smartphone,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  _buildCardInfo() => Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          backgroundColor: kBtnPrimary,
          onPressed: () {
            interventionPage
                .launchUrl('https://doh.gov.ph/NCMH-Crisis-Hotline');
          },
          label: const Text('For More Info'),
        ),
      );
}
