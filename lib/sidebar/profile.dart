import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ah_lms/sidebar.dart';
import 'package:ah_lms/constant.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PickedFile? _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const SideBar(),
        appBar: AppBar(
          title: const Text(profile),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: ListView(
            children: <Widget>[
              imageProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              radius: 80.0,
              backgroundImage: _imageFile == null
                  ? const AssetImage('assets/avatar.png')
                  : FileImage(File(_imageFile!.path)) as ImageProvider),
          Positioned(
            bottom: 5.0,
            right: 5.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomSheet()));
              },
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: const Text("Camera"),
              ),
              const SizedBox(
                width: 25.0,
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                label: const Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
