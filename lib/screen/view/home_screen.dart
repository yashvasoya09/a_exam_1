import 'package:a_exam_1/screen/Model/home%20model.dart';
import 'package:a_exam_1/screen/Model/search_model.dart';
import 'package:a_exam_1/screen/provider/EProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  EProvider? providerF;
  EProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<EProvider>(context, listen: true);
    providerF = Provider.of<EProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                      "***************************\n\n\n\t\t${snapshot.error}\n\n\n***************************"));
            } else if (snapshot.hasData) {
              EModel? e1 = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your Collections",
                          style: GoogleFonts.abrilFatface(
                              fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Stay Home Shop Online",
                            style: GoogleFonts.playfairDisplay(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange),
                          width: double.infinity,
                          child: TextField(
                              style: GoogleFonts.play(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(CupertinoIcons.search,
                                        color: Colors.black, weight: 25),
                                  ),
                                  hintText: "whatever you want Write it down",
                                  hintStyle: GoogleFonts.play(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(20))))),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                 homeModel hm = homeModel(productname: "${e1.data![index].productTitle}",image: "${e1.data![index].productPhotos![0]}",price: "${e1.data![index].offer!.price}",des: "${e1.data![index].productDescription}");
                                  Navigator.pushNamed(context, "viewScreen",arguments: hm);
                                },
                                child: ListTile(
                                  leading: Container(
                                      width: 100,
                                      height: 80,
                                      child: Image.network(
                                          "${e1.data![index].productPhotos![0]}",fit: BoxFit.cover,)),
                                  title: Text("${e1.data![index].productTitle}",style: GoogleFonts.play()),
                                ),
                              ),
                            );
                          },
                          itemCount: e1!.data!.length),
                    ),
                  ],
                ),
              );
            }
            return Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          },
          future: providerF!.getData(),
        ),
      ),
    );
  }
}











