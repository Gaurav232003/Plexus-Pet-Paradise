import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    downloadImages();
  }

  Future<void> downloadImages() async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    String useEmail = email.toString() != null ? email.toString() : "notfound";
    final ListResult result = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('$useEmail')
        .listAll();
    final List<Reference> allFiles = result.items;
    final List<String> urls =
        await Future.wait(allFiles.map((file) => file.getDownloadURL()));
    setState(() {
      imageUrls = urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueGrey[800],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImagePickerWidget()),
              );
            },
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
            reverse: true,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              print(imageUrls);
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(30.0),
                      child: Image.network(imageUrls[index])));
            },
          ),
        ));
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _imageFile;

  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Column(
          children: [
            if (_imageFile != null) ...[
              Image.file(_imageFile!),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _uploadImage(_imageFile!);
                      Navigator.pop(context);
                    },
                    child: Text('Upload'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ],
              )
            ] else ...[
              SizedBox(height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: Text('Take Photo'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            )
          ],
        ));
  }

  Future<void> _uploadImage(File file) async {
    try {
      String? email = FirebaseAuth.instance.currentUser!.email;
      String useEmail =
          email.toString() != null ? email.toString() : "notfound";

      await firebase_storage.FirebaseStorage.instance
          .ref('$useEmail/${DateTime.now().toString()}')
          .putFile(file);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image uploaded.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image.')),
      );
    }
  }
}
