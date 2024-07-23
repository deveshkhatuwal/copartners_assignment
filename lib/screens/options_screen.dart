import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OptionsScreen extends StatelessWidget {
  OptionsScreen({super.key});

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Subscription",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            // ListView(scrollDirection: Axis.vertical,
            //
            //   children: [
            //   _ExpertCard(),
            //   _ExpertCard(),
            //   _ExpertCard(),
            // ],),
            ListView.builder(

              physics: ScrollPhysics(),
              itemCount: 3,
              padding:EdgeInsets.only(top: 1) ,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return _ExpertCard();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _ExpertCard() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.black.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("Channel Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
              subtitle: Text("Expert Name",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              trailing: TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "SEBI Reg.",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.verified_rounded,
                  color: Colors.blue,
                ),
              ),
            ),
            _ExpertPlanCard(),
            SizedBox(height: 15),
            SmoothPageIndicator(
              controller: controller,
              count: 5,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.white, dotHeight: 5, dotWidth: 12),
              // const WormEffect(
              //   dotHeight: 16,
              //   dotWidth: 16,
              //   type:
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ExpertPlanCard() {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          color: Colors.white12,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Plan Type",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  "10:00 AM",
                  style: TextStyle(
                      color: Colors.white60,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Amount :",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Text(
                    "1,999",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Duration :",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "2 Month",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Discount :",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "30%",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}