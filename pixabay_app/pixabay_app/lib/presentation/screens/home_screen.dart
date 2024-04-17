import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pixabay_app/controller/data_controller.dart';
import 'package:pixabay_app/presentation/screens/detal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      if (homeController.dataList.isEmpty) {
        homeController.dataListApi();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pixabay ImagesApi")),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          print("length=====${controller.dataList.length}");
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    // GridView.builder(
                    //   scrollDirection: Axis.vertical,
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: controller.dataList.length,
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     childAspectRatio: 1 / 1.275,
                    //     crossAxisSpacing: 8.0,
                    //     mainAxisSpacing: 10.0,
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return InkWell(
                    //       onTap: () {
                    //         Get.to(() => DetailScreen(
                    //               image: controller.dataList[index].webformatURL,
                    //               like: controller.dataList[index].likes,
                    //               view: controller.dataList[index].views,
                    //             ));
                    //       },
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           // color: Colors.purple.withOpacity(.1),
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Hero(
                    //               tag: 'hero-rectangle',
                    //               child: Container(
                    //                 width: double.infinity,
                    //                 height: 165,
                    //                 decoration: BoxDecoration(
                    //                     color: Colors.grey,
                    //                     borderRadius: BorderRadius.circular(10),
                    //                     image: DecorationImage(
                    //                         image: NetworkImage(
                    //                           "${controller.dataList[index].webformatURL}",
                    //                         ),
                    //                         fit: BoxFit.cover
                    //                         // image: DecorationImage(image: NetworkImage("${controller.dataList[index]["webformatURL"]}")
                    //                         )),
                    //               ),
                    //             ),
                    //             SizedBox(height: 7),
                    //             Padding(
                    //               padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    //               child: Row(
                    //                 children: [
                    //                   Column(
                    //                     children: [
                    //                       Icon(
                    //                         Icons.favorite,
                    //                         color: Colors.pink,
                    //                       ),
                    //                       SizedBox(height: 5),
                    //                       Text("${controller.dataList[index].likes}"),
                    //                     ],
                    //                   ),
                    //                   SizedBox(width: 20),
                    //                   Column(
                    //                     children: [
                    //                       Icon(
                    //                         Icons.remove_red_eye,
                    //                         color: Colors.pink,
                    //                       ),
                    //                       SizedBox(height: 5),
                    //                       Text("${controller.dataList[index].views}"),
                    //                     ],
                    //                   )
                    //                 ],
                    //               ),
                    //             )
                    //             // Padding(
                    //             //   padding: const EdgeInsets.all(8.0),
                    //             //   child: Text(
                    //             //     'All Name $index',
                    //             //     style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    //             //   ),
                    //             // ),
                    //             // const Row(
                    //             //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //             //   children: [
                    //             //     Text(
                    //             //       '₹ 10.00',
                    //             //     ),
                    //             //     Text(
                    //             //       '₹ 10.00',
                    //             //       style: TextStyle(
                    //             //         decoration: TextDecoration.lineThrough,
                    //             //       ),
                    //             //     ),
                    //             //   ],
                    //             // ),
                    //             // // const SizedBox(
                    //             // //   height: 21,
                    //             // // ),
                    //             // const Spacer(),
                    //             // Container(
                    //             //   decoration: BoxDecoration(
                    //             //       borderRadius: BorderRadius.circular(8.0),
                    //             //       gradient: LinearGradient(
                    //             //         colors: [
                    //             //           Colors.pinkAccent.withOpacity(.5),
                    //             //           Colors.black.withOpacity(.7),
                    //             //         ],
                    //             //         stops: const [0.0, 1.0],
                    //             //         begin: FractionalOffset.topCenter,
                    //             //         end: FractionalOffset.bottomCenter,
                    //             //         // tileMode: TileMode.repeated
                    //             //       )),
                    //             //   padding: const EdgeInsets.all(8.0),
                    //             //   child: const Center(
                    //             //     child: Text(
                    //             //       'USE 1200 UNIBONUS',
                    //             //       style: TextStyle(
                    //             //         fontWeight: FontWeight.bold,
                    //             //         color: Colors.white,
                    //             //         fontSize: 14.0,
                    //             //       ),
                    //             //     ),
                    //             //   ),
                    //             // ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    Wrap(
                      spacing: 12.0, // Adjust the spacing between items as needed
                      runSpacing: 8.0, // Adjust the spacing between lines as needed
                      children: List.generate(controller.dataList.length, (index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => DetailScreen(
                                      image: controller.dataList[index].webformatURL,
                                      like: controller.dataList[index].likes,
                                      view: controller.dataList[index].views,
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.purple.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: 'hero-rectangle',
                                      child: Container(
                                        width: 100,
                                        height: 165,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "${controller.dataList[index].webformatURL}",
                                                ),
                                                fit: BoxFit.cover
                                                // image: DecorationImage(image: NetworkImage("${controller.dataList[index]["webformatURL"]}")
                                                )),
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.pink,
                                              ),
                                              SizedBox(height: 5),
                                              Text("${controller.dataList[index].likes}"),
                                            ],
                                          ),
                                          SizedBox(width: 15),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.pink,
                                              ),
                                              SizedBox(height: 5),
                                              Text("${controller.dataList[index].views}"),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Text(
                                    //     'All Name $index',
                                    //     style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                                    //   ),
                                    // ),
                                    // const Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //   children: [
                                    //     Text(
                                    //       '₹ 10.00',
                                    //     ),
                                    //     Text(
                                    //       '₹ 10.00',
                                    //       style: TextStyle(
                                    //         decoration: TextDecoration.lineThrough,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // // const SizedBox(
                                    // //   height: 21,
                                    // // ),
                                    // const Spacer(),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(8.0),
                                    //       gradient: LinearGradient(
                                    //         colors: [
                                    //           Colors.pinkAccent.withOpacity(.5),
                                    //           Colors.black.withOpacity(.7),
                                    //         ],
                                    //         stops: const [0.0, 1.0],
                                    //         begin: FractionalOffset.topCenter,
                                    //         end: FractionalOffset.bottomCenter,
                                    //         // tileMode: TileMode.repeated
                                    //       )),
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: const Center(
                                    //     child: Text(
                                    //       'USE 1200 UNIBONUS',
                                    //       style: TextStyle(
                                    //         fontWeight: FontWeight.bold,
                                    //         color: Colors.white,
                                    //         fontSize: 14.0,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ).paddingOnly(right: 8, bottom: 8),
                            ),
                          ],
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
