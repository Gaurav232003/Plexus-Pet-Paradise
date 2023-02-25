import 'chatroomid.dart';
import 'ChatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.userMap});
  Map<String, dynamic> userMap;
  @override
  _HomeScreenState createState() => _HomeScreenState(userMap: userMap);
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  _HomeScreenState({required this.userMap});
  Map<String, dynamic>? userMap;

  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic> getUserMap() {
    String? email = FirebaseAuth.instance.currentUser!.email;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    final uid = user.uid;
    Map<String, dynamic> userMap = {
      "name": data[0],
      "email": email,
      "uid": uid
    };

    return userMap;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // setStatus("Online");
  }

  // void setStatus(String status) async {
  //   await _firestore.collection('users').update({
  //     "status": status,
  //   });
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     // online
  //     setStatus("Online");
  //   } else {
  //     // offline
  //     setStatus("Offline");
  //   }
  // }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  onSearch() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    setState(() {});
    final User user = auth.currentUser!;
    final uid = user.uid;
    final List<Map<String, dynamic>> data2 =
        await fetchData(_search.toString());
    // print(data2[0]['name']);
    if (data2.isNotEmpty) {
      data[0] = data2[0]['name'];
      data[1] = data2[0]['dob'];
      data[2] = data2[0]['gender'];
      data[3] = data2[0]['type'];
      data[4] = data2[0]['breed'];
      userMap = {'name': data2[0]['name'], 'email': _search.text, 'uid': uid};
    }
    // print(data2[0]['name']);
    // print(data2[0]['dob']);
    // print(data2[0]['gender']);
    // print(data2[0]['type']);
    // print(data2[0]['breed']);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                // Container(
                //   height: size.height / 14,
                //   width: size.width,
                //   alignment: Alignment.center,
                //   child: Container(
                //     height: size.height / 14,
                //     width: size.width / 1.15,
                //     child: TextField(
                //       controller: _search,
                //       decoration: InputDecoration(
                //         hintText: "Search",
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: size.height / 50,
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text("Search"),
                // ),
                SizedBox(
                  height: size.height / 30,
                ),
                userMap != null
                    ? ListTile(
                        onTap: () {
                          String roomId = chatRoomId(data[0], userMap!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );
                        },
                        leading: Icon(Icons.account_box, color: Colors.black),
                        title: Text(
                          userMap!['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(userMap!['email']),
                        trailing: Icon(Icons.chat, color: Colors.black),
                      )
                    : Container(),
              ],
            ),
    );
  }
}
