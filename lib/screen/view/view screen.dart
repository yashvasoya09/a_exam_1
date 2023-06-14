import 'package:a_exam_1/screen/Model/search_model.dart';
import 'package:flutter/material.dart';
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
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
            else if(snapshot.hasData)
              {
                EModel? e1 = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Image.network("${e1!.data![index].productPhotos![0]}"),
                  ],),
                );

              }
            return Center(child: CircularProgressIndicator(color: Colors.black,));
          },
          future: providerT!.getData(),
        ),
      ),
    );
  }
}
