import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './models/category_model.dart';
import './models/diet_model.dart';
import './models/popular_model.dart';

class HomePage extends StatefulWidget
{
  HomePage({super.key});
  @override
  State<HomePage> createState()=> _HomePageState();

}

class _HomePageState extends State<HomePage>
{
  List<CategoryModel> categories = [];
  List<DietModel> dietModels = [];
  List<PopularDietsModel> popularDiets = [];
  void _getAllInfo(){
    categories = CategoryModel.getAllItem();
    dietModels = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context){
    _getAllInfo();
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        children: [
          _inputBar(context),
          const SizedBox(height: 40,),
          _category(context),
          const SizedBox(height : 40,),
          _recommededDiet(context),
          const SizedBox(height : 40,),
          _popularDiet(context),
        ],
      ),
    );
  }


  Column _popularDiet(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Popular",
            style: TextStyle(
              color : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15,),
        ListView.separated(
          itemCount: popularDiets.length,
          separatorBuilder: (context , index) => const SizedBox(height: 15,),
          shrinkWrap: true,
          itemBuilder: (context , index){
            return Container(
              height: 100,
              padding: const EdgeInsets.only(left: 20 , right : 20),
              decoration: BoxDecoration(
                  color: popularDiets[index].boxIsSelected ?
                  Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: popularDiets[index].boxIsSelected ? [
                    BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.07),
                        offset: const Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0
                    )
                  ] : []
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                      popularDiets[index].iconPath
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calorie,
                        style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: SvgPicture.asset(
                      'assets/icons/button.svg',
                      width : 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Column _recommededDiet(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Recommended Diet",
            style: TextStyle(
              color : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 240,
          child: ListView.separated(
            itemCount: dietModels.length,
            padding: const EdgeInsets.only(
                left: 20,
                right : 20
            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context , index)=> const SizedBox(width: 25,),
            itemBuilder: (context , index){
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: dietModels[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(dietModels[index].iconPath),
                    Column(
                      children: [
                        Text(
                          dietModels[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          dietModels[index].level + ' | ' + dietModels[index].calorie + ' | ' + dietModels[index].duration,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: 130,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff9DCEFF),
                                Color(0xff92A3FD),
                              ]
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child : const Center(
                          child: Text(
                            "View",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              );
            },
          ),
        )

      ],
    );
  }

  Column _category(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left : 20),
            child: Text(
                'Category',
                style : TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )
            )
        ),
        const SizedBox(height: 15,),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
                left : 25,
                right : 25
            ),
            separatorBuilder: (context , index)=> const SizedBox(width: 25,),
            itemBuilder: (context , index){
              return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width : 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          )
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
              );
            },
          ),
        )
      ],
    );
  }

  Container _inputBar(BuildContext context){
    return Container(
        margin : const EdgeInsets.only(top: 40.0 , left : 20.0 , right: 20.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color : Colors.black.withOpacity(0.11),
                blurRadius: 40.0,
                spreadRadius: 0.0,
              )
            ]
        ),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              hintText: "Search",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child : SvgPicture.asset('assets/icons/Filter.svg'),
              ),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              )
          ),
        )
    );
  }

  AppBar appBar(BuildContext context){
    return AppBar(
      title: const Text(
        "BreakFast",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset('assets/icons/dots.svg'),
        ),
      ],
    );
  }
}