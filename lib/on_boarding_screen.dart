import 'package:flutter/material.dart';
import 'package:on_boarding_screen/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _page(String image, String title, String subtitle) => Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 200),
          const SizedBox(height: 100),
          Text(
              title,
            style: TextStyle(
              color: Colors.teal.shade800,
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20),
          Text(
              subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: [
              Container(
                  color: Colors.green.shade100,
                  child: _page('images/image_one.png', 'Page 1',
                      "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.")),
              Container(
                  color: Colors.orange.shade100,
                  child: _page('images/image_two.png', 'Page 2',
                      "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.")),
              Container(
                  color: Colors.blue.shade100,
                  child: _page('images/image_three.png', 'Page 3',
                      "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.")),
              Container(
                  color: Colors.yellow.shade100,
                  child: _page('images/image_four.png', 'Page 4',
                      "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.")),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                onDotClicked: (index) {
                  _pageController.jumpToPage(index);
                },
              ),
            ),
          ),
          if (currentPageIndex == 3)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: const Text('Get Started'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
