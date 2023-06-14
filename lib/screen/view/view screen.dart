import 'package:a_exam_1/screen/Model/home%20model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/EProvider.dart';

class viewScreen extends StatefulWidget {
  const viewScreen({super.key});

  @override
  State<viewScreen> createState() => _viewScreenState();
}

class _viewScreenState extends State<viewScreen> {
  EProvider? providerF;
  EProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<EProvider>(context, listen: true);
    providerF = Provider.of<EProvider>(context, listen: false);
    homeModel hm = ModalRoute.of(context)!.settings.arguments as homeModel;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                color: Colors.orange,
                child: Image.asset(
                  "${hm.image}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Text("${hm.productname}",
                      style: GoogleFonts.ptSerif(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Text("${hm.des}",
                      style: GoogleFonts.ptSerif(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      )),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("₹${hm.price}",
                        style: GoogleFonts.ptSerif(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.fixed,
                        content: Text(
                          "${hm.productname} IS ADDED GO TO CART AND VIEW",
                          style: TextStyle(fontSize: 15, color: Colors.orange),
                        )),
                  );
                },
                child: Text(
                  "🛒 Add To Cart",
                  style: GoogleFonts.ptSerif(fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
