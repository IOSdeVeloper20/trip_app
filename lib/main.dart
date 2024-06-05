import 'package:flutter/material.dart';
import 'package:trip_app/fade_animation.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;
  void _onScroll() {}

  @override
  void initState() {
    //initialize page controller to start the app on the first page: 0
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

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
      //create a horizontal scrollable pages
      body: PageView(
        controller: _pageController,
        children: [
          makePage(
              page: 1,
              image: 'assets/images/egypt.jpg',
              title: 'Egypt',
              description:
                  'Ancient Egypt in the desert of Pharaohs.Egypt is home to one of the world\'s earliest and greatest civilizations'),
          makePage(
              page: 2,
              image: 'assets/images/dubai.jpg',
              title: 'Dubai',
              description: 'Meet the modern city.'),
          makePage(
              page: 3,
              image: 'assets/images/maldives.jpg',
              title: 'Maldives',
              description: 'Have a Greate summer vacation.'),
          makePage(
              page: 4,
              image: 'assets/images/moscow.jpg',
              title: 'Moscow',
              description:
                  'Between modern and ancient buildings Moscow has a greate vibe.'),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
            0.3,
            0.9
          ], colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                //horizontal for row x for column
                mainAxisAlignment: MainAxisAlignment.end,
                //vertical for row x for column
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    page.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '/$totalPage',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      2,
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                        const Text(
                          '4.0',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '(2300)',
                            style:
                                TextStyle(color: Colors.white38, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        description,
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 15,
                            height: 1.9),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Read More',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
