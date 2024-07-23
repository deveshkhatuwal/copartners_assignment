import 'package:flutter/material.dart';
import 'package:copartner_assignment/screens/options_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            slivers: [

              SliverAppBar(

                // expandedHeight: 120.0, // Adjust height as needed
                pinned: true,
                backgroundColor: Colors.black.withOpacity(0.1),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Rahul",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Good Day",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            " 👋",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.05),
                            minRadius: 22,
                            maxRadius: 22,
                            child: const Icon(Icons.search, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.05),
                            minRadius: 22,
                            maxRadius: 22,
                            child: const Icon(Icons.notifications, color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.05),
                            minRadius: 22,
                            maxRadius: 22,
                            child: const Icon(Icons.person, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: OptionsScreen(), // Your scrolling content here
              ),
            ],
          ),
        ],
      ),
    );
  }
}