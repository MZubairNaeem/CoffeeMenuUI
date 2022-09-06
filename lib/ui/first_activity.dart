import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/utils/coffee_tile.dart';
import 'package:flutter_application_1/utils/coffe_type.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //list of coffee type
  final List coffeeType = [
    [
      'Cappacino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Hot Chocolate',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  //user tap on coffee type
  void cofeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body: Column(
        children: [
          //find the coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find The Best Coffee For You',
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),
          SizedBox(height: 25),
          //search bar
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee.....',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          //horizontal list view coffee types
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          cofeeTypeSelected(index);
                        },
                    );
                  })),
          //horizontal list view coffee tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [CoffeeTile(
              coffeeImagePath: 'lib/images/img1.jpg',
              coffeeNamePath: 'Latte',
              coffeePrice: '420',
            ),
              CoffeeTile(
                coffeeImagePath: 'lib/images/img2.jpg',
                coffeeNamePath: 'Cappucino',
                coffeePrice: '450',
              ),
              CoffeeTile(
                coffeeImagePath: 'lib/images/img3.jpg',
                coffeeNamePath: 'Hot Chocolate',
                coffeePrice: '410',
              )],
          )),
        ],
      ),
    );
  }
}
