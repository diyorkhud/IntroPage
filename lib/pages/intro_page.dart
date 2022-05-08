import 'package:flutter/material.dart';
import 'package:pdpui3/pages/home_page.dart';
import 'package:pdpui3/utils/strings.dart';
class IntroPage extends StatefulWidget {
  static final id = 'intro_page';

  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int currentIndex = 0;
  bool isLastPage = false;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;
                isLastPage = page == 2;
              });
            },
            controller: _pageController,

            children: [
              makePage(
                image: 'assets/images/ic_image1.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: 'assets/images/ic_image2.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: 'assets/images/ic_image3.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          isLastPage ?
          Padding(
            padding: const EdgeInsets.only(left: 330, bottom: 50),
            child: Container(child: TextButton(child: Text('Skip', style: TextStyle(color: Colors.pink, fontSize: 18, fontWeight: FontWeight.w600),),
              onPressed: (){
                Navigator.pushReplacementNamed(context, HomePage.id);
              },

            )
            ),
          ): Text('White Space', style: TextStyle(color: Colors.white, fontSize: 30)),
        ],
      ),
    );
  }
  Widget makePage ({image, title, content }) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.pink, fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Text(content, style: TextStyle(color: Colors.grey, fontSize: 20), textAlign: TextAlign.center,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),

        ],
      ),

    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;

  }
}
