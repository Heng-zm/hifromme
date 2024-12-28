import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/models/category-models.dart';
import 'package:my_app/models/diet_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModels> categories = [];
  List<DietModel> diet = [];

  void _getCategories() {
    categories = CategoryModels.getCategories();
  }

  void _getDiets() {
    diet = DietModel.getDiets();
  }

  void _getinitialInfor() {
    categories = CategoryModels.getCategories();
    diet = DietModel.getDiets();
  }

  @override
  void initState() {
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getinitialInfor();
    return Scaffold(
      appBar: appBer(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 58,
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 222, 222, 222),
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search Here',
                helperStyle: const TextStyle(
                  color: Color(0xffdddada),
                  fontSize: 14,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/magnifying-glass-solid.svg',
                    width: 12,
                    height: 12,
                  ),
                ),
                suffixIcon: SizedBox(
                  width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const VerticalDivider(
                          color: Color(0xffdddada),
                          thickness: 0.1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            'assets/icons/sort-solid.svg',
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                )),
          ),
          _searchField(),
          SizedBox(
            height: 20,
          ),
          _categoriesSection(),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Recommendation\nfor Diet',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 250,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                                color: diet[index].boxColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 44),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 70,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              categories[index].iconpath),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    diet[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    diet[index].level +
                                        ' | ' +
                                        diet[index].duration +
                                        ' | ' +
                                        diet[index].calorie,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height: 40,
                                      width: 120,
                                      child: Center(
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Color(0xff9dceff),
                                            Color(0xff92a3fd)
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
                  itemCount: diet.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Catelory",
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 125,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(categories[index].iconpath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 45, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1d1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
    );
  }

  AppBar appBer() {
    return AppBar(
      title: const Text(
        "Order",
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 0.0,
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 222, 209, 203),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(
          'assets/icons/arrow-left-solid.svg',
          width: 20,
          height: 20,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 37,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 222, 209, 203),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/bars-solid.svg',
              height: 20,
              width: 20,
            ),
          ),
        )
      ],
    );
  }
}
