import 'package:flutter/material.dart';
import 'package:mobile_app/model/onboard_model.dart';
import 'package:mobile_app/pages/bottomnavbar_page.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => OnboardingScreen()), (route) => false);
    },);
    return Scaffold(
      body: Center(
        child: Image.asset('images/logo.png', fit: BoxFit.cover,),
      ) 
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  
  const OnboardingScreen({Key? key}) : super(key: key);
  
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _indexPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage(onboard_data[_indexPage].image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //untuk mengskip onboarding dan langsung ke home screen
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) => MyBottomNavigationBar()));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _indexPage = index;
                  });
                },
                itemCount: onboard_data.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnboardingContent(
                    image: onboard_data[index].image,
                    title: onboard_data[index].title,
                    description: onboard_data[index].description),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 1, // Sesuaikan dengan kebutuhan Anda
                  children: List<Widget>.generate(
                    onboard_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: DotIndicator(
                        isActive: index == _indexPage,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40, top: 50),
              child: InkWell(
                onTap: () {
                  //untuk tombol dapat pindah menuju Home Screen
                   if (_indexPage == onboard_data.length - 1) {
                     Navigator.push(
                         context, MaterialPageRoute(builder:
                         (context) => MyBottomNavigationBar()));
                   }
                  // untuk pindah ke halaman selanjutnya
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 255, 234, 142),
                  ),
                  child: Center(
                    child: Text(
                      _indexPage == onboard_data.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({Key? key,
    required this.image,
    required this.title,
    required this.description})
      : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15,),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key,this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 5,
        width: isActive? 15 : 5,
        decoration: BoxDecoration(
          color: isActive ? Color.fromARGB(255, 255, 234, 142) : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))
        ),
      ),
    );
  }
}


