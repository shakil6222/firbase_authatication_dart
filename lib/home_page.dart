import 'package:firbase_authatication/providers/auth_providder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProviders>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Crude Firbase FireStor DataBase',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {
             provider.signOutFromGoogle();
          }, icon: Icon(Icons.logout))

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add Data"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          label: Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("${provider.user}",style: TextStyle(color: Colors.green, fontSize: 20,),),
        ),
      ),
    );
  }
}
