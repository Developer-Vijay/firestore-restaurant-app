import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_major_project/screens/home/components/categories_menu.dart';

class ViewAllCategories extends StatelessWidget {
  final categoryData;
  ViewAllCategories({this.categoryData});
  @override
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(categoryData.length, (index) {
          return Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CatrgoriesRelatedMenues(
                            data: categoryData,
                          ),
                        ));
                  },
                  child: Container(
                    height: sized.height * 0.195,
                    width: sized.height * 0.22,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.lightBlue[100], blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: categoryData[index].image != null
                        ? CachedNetworkImage(
                            imageUrl: categoryData[index].image,
                              
                            imageBuilder: (context, imageProvider) => Container(
                              height: sized.height * 0.195,
                              width: sized.height * 0.22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              "assets/images/Burger4.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    categoryData[index].title,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
