import 'package:car_rental/core/constants/colors.dart';
import 'package:flutter/material.dart';
class CommonLoading extends StatelessWidget {

  double? height;
  double? width;
  CommonLoading(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    return  Container(
      height: height,
      width: width,
      child: LinearProgressIndicator(
        color: Colors.grey.shade200,
        backgroundColor: ConstColors.whiteColor,
      ),
    );
  }
}