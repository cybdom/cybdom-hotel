import 'package:cybdom_hotel/global.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _pageViewController = PageController();
  bool showPrevious = false;
  int _currentIndex = 0;
  _introPages() {
    return PageView.builder(
      onPageChanged: (value) {
        if (value == 0) {
          showPrevious = false;
        } else {
          showPrevious = true;
        }
        _currentIndex = value;
        setState(() {});
      },
      controller: _pageViewController,
      itemCount: introPages.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${introPages[i]['title']}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "${introPages[i]['subtitle']}",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  "${introPages[i]['image']}",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  showPrevious
                      ? FlatButton(
                          child: Text("Previous"),
                          onPressed: () {
                            _pageViewController.previousPage(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeIn);
                          },
                        )
                      : Container(),
                  FlatButton(
                    child: Text("Skip"),
                    onPressed: () => Navigator.pushNamed(context, 'home'),
                  )
                ],
              ),
              Expanded(
                child: _introPages(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  introPages.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      shape: _currentIndex == index
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      borderRadius: _currentIndex == index
                          ? BorderRadius.circular(9)
                          : null,
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    height: 15,
                    width: _currentIndex == index ? 25 : 15,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    if (_pageViewController.page == introPages.length - 1) {
                      Navigator.pushNamed(context, 'home');
                    } else {
                      _pageViewController.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blueAccent, Colors.greenAccent],
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      "Next",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
