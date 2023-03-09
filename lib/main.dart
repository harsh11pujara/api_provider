import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/photo_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<PhotoProvider>(
      create: (context) => PhotoProvider(),
      child: const MaterialApp(
        home: HomePage(),
      )));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<PhotoProvider>(context,listen: false).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Provider")),
      body: Consumer<PhotoProvider>(
        builder: (context, value, child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemCount: value.data.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(top: 10,left: 20,right: 20, bottom: 10),
                color: Colors.black12,
                child: Column(
                  children: [
                    Expanded( child: Image.network(value.data[index].url.toString(),fit: BoxFit.fill,)),
                    SizedBox(
                      height: 20,
                      child: Text("Title ${index+1}",style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
