import 'package:copartner_assignment/providers/controllers/expert_provider.dart';
import 'package:flutter/material.dart';
import 'package:copartner_assignment/screens/options_screen.dart';
import 'package:provider/provider.dart';
import '../providers/controllers/tab_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// late TabProvider _tabProvider;
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  final _selectedColor = const Color(0xFF0081F1);
  final _tabs = [
    const Tab(text: 'Options'),
    const Tab(text: 'Commodity'),
    const Tab(text: 'Equity'),
  ];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final tabProvider = Provider.of<TabProvider>(context, listen: false);
      final expertProvider = Provider.of<ExpertProvider>(context, listen: false).fetchExperts();
      tabProvider.initializeTabController(this);

    });
  }
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF070522),
                    Color(0xFF110839),
                    Color(0xFF220A41),
                    Color(0xFF330C47),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Scrollable content

            CustomScrollView(
              // physics: const ClampingScrollPhysics(),
              slivers: [
                SliverAppBar(stretch: false,
                  pinned: true,
                  backgroundColor: Colors.transparent.withOpacity(0.5),

                  bottom: PreferredSize(preferredSize: const Size.fromHeight(40), child:  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTabButton("Options", 0),
                        const SizedBox(width: 10,),
                        _buildTabButton("Commodity", 1),
                        const SizedBox(width: 10,),
                        _buildTabButton("Equity", 2),
                      ],
                    ),
                  ),),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Rahul",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Good Day",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            " 👋",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.05),
                            minRadius: 15,
                            maxRadius: 15,
                            child:
                            const Icon(Icons.search, color: Colors.white, size: 17,),
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.05),
                            minRadius: 15,
                            maxRadius: 15,
                            child: const Icon(Icons.notifications,
                                color: Colors.white,size: 17
                            ),
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.05),
                            minRadius: 15,
                            maxRadius: 15,
                            child:
                              const Image(image: AssetImage('assets/image/profile_icon.jpg',))
                            // const Icon(Icons.person, color: Colors.white,size: 17
                            // ),
                          ),
                        ],
                      )
                    ],
                  ),

                ),
                SliverFillRemaining(
                  child: Consumer<TabProvider>(
                    builder: (context, tabProvider, child) {
                      return DefaultTabController(
                        length: 3,
                        child: Consumer<ExpertProvider>(
                          builder: (context, expertProvider, child) {
                            if (expertProvider.isLoading) {
                              return const Center(
                              child: SizedBox(width: 30 , height: 30,
                                  child: CircularProgressIndicator(strokeWidth: 2,)),
                            );}
                            if (expertProvider.error != null) {
                              return  Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      expertProvider.cleardata();
                                      expertProvider.fetchExperts();
                                    },
                                    child: const Text("Retry", style: TextStyle( ),),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(expertProvider.error!, style: const TextStyle(color: Colors.white, fontSize: 10)),
                                ],
                              ));
                            }

                              return TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: tabProvider.tabController,
                              children: [
                                ExpertsScreen(experts:  expertProvider.optionsExperts),
                                ExpertsScreen(experts: expertProvider.commodityExperts),
                                ExpertsScreen(experts: expertProvider.equityExperts),

                              ],
                            );

                          },
                        )
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTabButton(String title, int index) {
    final tabProvider = Provider.of<TabProvider>(context);
    return IntrinsicWidth(
      child: ElevatedButton(

        onPressed: () {
          tabProvider.selectTab(index);
        },
        // onPressed: () => _onTabButtonPressed(index),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero, // Ensure no default minimum size
          fixedSize: const Size(60, 30), // Control the exact size of the button
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // padding:  EdgeInsets.symmetric(vertical: 0, horizontal: 7),
padding: EdgeInsets.zero,
          backgroundColor: tabProvider.selectedIndex == index ? _selectedColor : Colors.transparent.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            side :  tabProvider.selectedIndex == index ? BorderSide.none: const BorderSide(color: Colors.white54 , width: 1) ,
            // side: BorderSide(color: Colors.white , width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10
          ),
        ),
      ),
    );
  }

}