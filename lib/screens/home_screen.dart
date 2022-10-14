import 'package:flutter/material.dart';

import '../models/UserModel.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.amber.shade400.withOpacity(0.7),
                      Colors.amber.shade800.withOpacity(0.7)
                    ]),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img1.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ]),
            ),
            Container(
               height: 300,            
              child: _userModel == null || _userModel!.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemCount: _userModel!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            
                            child: Padding(
                              padding: EdgeInsets.all(9),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(_userModel![index].id.toString()),
                                      SizedBox(width: 50),
                                      Text(_userModel![index].username.toString()),
                                    ],
                                  ),
                                  
                                 
                                ],
                              ),
                            ),
                          );
                        }),
                  
            )
          ],
        ),
      );
    
  }
}
