import 'dart:io';

import 'package:chat_flutter/utils/default_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File pickedImage) onImagePick;

  UserImagePicker(this.onImagePick);
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImageFile;

  Future _pickImage() async {
    final picker = ImagePicker();
    final PickedFile _pickedImage = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImageFile = File(_pickedImage.path);
    });
    widget.onImagePick(_pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: DefaultColors.PRIMARY,
          backgroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile) : null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          label: Text('Adicionar Imagem'),
          icon: Icon(Icons.photo_camera),
          onPressed: _pickImage,
        )
      ],
    );
  }
}
