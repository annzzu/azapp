import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/theme/app_colors.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    Key? key,
    this.imgUrl,
  }) : super(key: key);
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: AppColors.primaryColor,
          ),
        ),
        child: (imgUrl == null)
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: AppColors.mainRed,
                    ),
                    onPressed: () async {
                      ImagePicker _picker = ImagePicker();
                      final XFile? _image =
                          await _picker.pickImage(source: ImageSource.gallery);

                      if (_image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('No image was selected.')));
                      }
                      if (_image != null) {
                        print('Uploading ...');
                        BlocProvider.of<OnBoardingBloc>(context).add(
                          UpdateUserImages(image: _image),
                        );
                      }
                    }),
              )
            : Image.network(
                imgUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
