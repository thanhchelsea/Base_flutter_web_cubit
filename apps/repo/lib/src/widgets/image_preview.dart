import 'package:flutter/material.dart';
import 'package:repo/src/utils/utils.dart';

class ImagePreviewWidget extends StatelessWidget {
  final String imageUrl;
  double? width;
  double? height;
  ImagePreviewWidget(
      {Key? key, required this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _showImagePreviewDialog(context),
          child: Image.network(
            imageUrl.trim(),
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
        ),
      ],
    );
  }

  void _showImagePreviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: Utils.getWidth(context) * 0.8,
                        maxHeight: Utils.getHeight(context) * 0.8),
                    child: Image.network(
                      imageUrl.trim(),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Đóng dialog
                    },
                    child: const Text(
                      'Đóng',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
