import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpleapp/models/category_models.dart';
import 'package:simpleapp/models/diet_models.dart';
import 'package:simpleapp/models/popular_diets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: Text(
          "SimpleApp",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 238, 233, 233),
          ),
          //alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.black,
            alignment: Alignment.center,
            iconSize: 17,
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 38.0,
            height: 38.0,
            // height: 35.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 233, 233),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_sharp),
              color: Colors.black,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _dietSection,
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text('Popular',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                        height: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: popularDiets[index].boxColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                //decoration: BoxDecoration(),
                                child:
                                    Image.asset(popularDiets[index].iconPath)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(popularDiets[index].name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(
                                  popularDiets[index].level +
                                      ' | ' +
                                      popularDiets[index].duration +
                                      ' | ' +
                                      popularDiets[index].calorie,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                /*Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.purpleAccent.withOpacity(0.3),
                                      Colors.blueAccent.withOpacity(0.3)
                                    ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),*/
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Colors.amber.withOpacity(0.3),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios_outlined)),
                            ),
                          ],
                        ));
                  },
                  padding: EdgeInsets.only(left: 20, right: 20),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 25),
                  itemCount: popularDiets.length),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  List<Widget> get _dietSection {
    return [
      Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Say Cheese !!!",
              hintStyle: GoogleFonts.poppins(
                color: Colors.black,
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded)),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.5,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.auto_awesome_motion_outlined)),
                    ],
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )),
        ),
      ),
      const SizedBox(height: 40),
      _categoriesSection(),
      const SizedBox(height: 20),
      Container(
        height: 120,
        decoration: const BoxDecoration(),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20, right: 20),
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 25,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                color: categories[index].boxColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(categories[index].iconPath)),
                  Text(categories[index].name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      )),
                ],
              ),
            );
          },
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Recommendation \nfor Diet",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 240,
                  //width: double.infinity,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        //margin: const EdgeInsets.only(left: 20, right: 20),
                        height: 200,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: diets[index].boxColor.withOpacity(0.3),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.all(0),
                              child: Image.asset(diets[index].iconPath),
                            ),
                            const SizedBox(height: 7),
                            Text(diets[index].name,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 7),
                            Text(
                              diets[index].level +
                                  ' | ' +
                                  diets[index].duration +
                                  ' | ' +
                                  diets[index].calorie,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  diets[index].viewIsSelected
                                      ? Color(0xff9DCEFF)
                                      : Colors.transparent,
                                  diets[index].viewIsSelected
                                      ? Color(0xcff92A3FD)
                                      : Colors.transparent
                                ]),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text('View',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: diets[index].viewIsSelected
                                            ? Colors.white
                                            : Color(0xffC58BF2),
                                        fontWeight: FontWeight.bold,
                                      ))),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 25),
                    itemCount: diets.length,
                    scrollDirection: Axis.horizontal,
                    //padding: const EdgeInsets.only(right: 20),
                  )),
            ],
          ),
        ],
      )
    ];
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text("Categories",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              )),
        ),
      ],
    );
  }
}
