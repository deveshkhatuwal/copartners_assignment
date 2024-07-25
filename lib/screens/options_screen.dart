

import 'package:copartner_assignment/widgets/expert_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExpertsScreen extends StatelessWidget {
  ExpertsScreen( {super.key,  required this.experts});
 final List<dynamic> experts;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Subscription",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),

            ListView.builder(

              physics: const ScrollPhysics(),
              itemCount: experts.length,
              padding:const EdgeInsets.only(top: 1) ,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final expert = experts[index];
                // return Text(expert['experts']['legalName'].toString(), style: TextStyle(fontSize: 30 , color: Colors.white),);
                return _ExpertCard(
                    expert['experts']['name'].toString(),
                    expert['experts']['legalName'].toString(),
                    expert['experts']['expertImagePath'].toString(),
                    expert['durationMonth'],
                    expert['discountedAmount'],
                    expert['amount'],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _ExpertCard(String? channelName, legalName , imageUrl,int duration, double discountedAmount , double amount ) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.black.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(isThreeLine: false,
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading:  CircleAvatar(
                  child: Image(image: NetworkImage("$imageUrl")),
                ),
                title:  Text(channelName!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
                subtitle: Text(legalName,
                    style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                        fontWeight: FontWeight.w400)),
                trailing: TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    "SEBI Reg.",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  icon: const Icon(
                    Icons.verified_rounded,
                    color: Colors.blue,
                    size: 12,
                  ),
                ),
              ),
            ),
             ExpertPlanCard(discountedAmount: discountedAmount,amount: amount, duration: duration,),
            const SizedBox(height: 15),
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


}