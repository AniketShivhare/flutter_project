// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'apis/sellerModel.dart';
//
// XFile? ownerPhoto;
// XFile? gstImage;
// XFile? fssaiImage;
// XFile? cancelledCheckImage;
//
// void main() {
//   runApp(BankDetailsApp1());
// }
//
// class BankDetailsApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bank Details Form',
//       debugShowCheckedModeBanner: false,
//       home: UploadImages(seller: UpdateSeller(),),
//     );
//   }
// }
//
// class UploadImages extends StatefulWidget {
//   late UpdateSeller seller ;
//   UploadImages({required this.seller});
//   @override
//   _BankDetailsFormState createState() => _BankDetailsFormState();
// }
//
// class _BankDetailsFormState extends State<UploadImages> {
//   final TextEditingController bankAccountController = TextEditingController();
//   final TextEditingController ifscController = TextEditingController();
//   final TextEditingController panController = TextEditingController();
//   final TextEditingController gstController = TextEditingController();
//   final TextEditingController fssaiController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         title: const Text('Upload Details'),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 30,
//                       width: 30,
//                       // color: Colors.cyanAccent,
//                       decoration: BoxDecoration(
//                           color: Colors.cyanAccent,
//                           border: Border.all(
//                             color: Colors.cyanAccent,
//                             width: 2.0, // Adjust border width as needed
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Center(
//                         child: Text('1',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 1.0,
//                       width: 90,
//                       decoration: const BoxDecoration(
//                           color: Colors.cyanAccent
//                       ),
//                     ),
//                     Container(
//                       height: 30,
//                       width: 30,
//                       // color: Colors.cyanAccent,
//                       decoration: BoxDecoration(
//                           color: Colors.cyanAccent,
//                           border: Border.all(
//                             color: Colors.cyanAccent,
//                             width: 2.0, // Adjust border width as needed
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Center(
//                         child: Text('2',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 1.0,
//                       width: 90,
//                       decoration: const BoxDecoration(
//                           color: Colors.cyanAccent
//                       ),
//                     ),
//                     Container(
//                       height: 30,
//                       width: 30,
//                       // color: Colors.cyanAccent,
//                       decoration: BoxDecoration(
//                           color: Colors.cyanAccent,
//                           border: Border.all(
//                             color: Colors.cyanAccent,
//                             width: 2.0, // Adjust border width as needed
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Center(
//                         child: Text('3',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//               const Text('Upload Images', style: TextStyle(fontSize: 18)),
//               const SizedBox(height: 30),
//               const ElevatedButton(
//                 onPressed: _getGSTImage,
//                 child: Text('Upload GST Image'),
//               ),
//               const SizedBox(height: 30),
//               const ElevatedButton(
//                 onPressed: _getfssaiImage,
//                 child: Text('Upload FSSAI Image'),
//               ),
//               const SizedBox(height: 30),
//               const ElevatedButton(
//                 onPressed:_getImage,
//                 child: Text('Upload Owner Photo'),
//               ),
//               const SizedBox(height: 30),
//               const ElevatedButton(
//                 onPressed:_getCancelledCheckImage,
//                 child: Text('Upload Cancelled Cheque Image'),
//               ),
//               const SizedBox(height: 30),
//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Process the form data and perform submission
//                       // You can access the entered data using the controllers
//                     },
//                     child: const Text('Submit'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// Future<void> _getImage() async {
//   final ImagePicker _picker = ImagePicker();
//   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//   if (pickedFile != null) {
//     // Handle the selected image (e.g., display it, upload it, etc.)
//     // You can use the pickedFile.path to access the image file path.
//   } else {
//     // User canceled image selection
//   }
// }
//
// Future<void> _getfssaiImage() async {
//   final ImagePicker _picker = ImagePicker();
//   final XFile? fsaaipickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//   if (fsaaipickedFile != null) {
//     // Handle the selected image (e.g., display it, upload it, etc.)
//     // You can use the pickedFile.path to access the image file path.
//   } else {
//     // User canceled image selection
//   }
// }
//
// Future<void> _getGSTImage() async {
//   Future<void> _getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         ownerPhoto = pickedFile;
//       });
//
//     } else {
//       // User canceled image selection
//     }
//   }
//
// // Similarly, update other image selection functions.
//
// }
//
//
//
// Future<void> _getCancelledCheckImage() async {
//   final ImagePicker _picker = ImagePicker();
//   final XFile? fsaaipickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//   if (fsaaipickedFile != null) {
//     // Handle the selected image (e.g., display it, upload it, etc.)
//     // You can use the pickedFile.path to access the image file path.
//   } else {
//     // User canceled image selection
//   }
// }




import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(BankDetailsApp1());
}

class BankDetailsApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Details Form',
      debugShowCheckedModeBanner: false,
      home: UploadImages(),
    );
  }
}

class UploadImages extends StatefulWidget {
  UploadImages({Key? key}) : super(key: key); // Constructor

  @override
  _UploadImagesState createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  XFile? ownerPhoto;
  XFile? gstImage;
  XFile? fssaiImage;
  XFile? cancelledCheckImage;

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        ownerPhoto = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }


  Future<void> _getGSTImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        gstImage = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }


  Future<void> _getFSSAIImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        fssaiImage = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }



  Future<void> _getCancelledCheque() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        cancelledCheckImage = pickedFile;
      });
    } else {
      // User canceled image selection
    }
  }

  // Similarly, create functions for other image types and update their respective variables.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Upload Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Your progress indicators here

              const SizedBox(height: 30),
              const Text('Upload Images', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (ownerPhoto != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload Owner Photo'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getGSTImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (gstImage != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload GST Image'),

                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getFSSAIImage,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if ( fssaiImage != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload FSSAI Image'),

                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _getCancelledCheque,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (cancelledCheckImage != null)
                      Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 10,),
                    Text('Upload Cancelled Cheque Image'),

                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Process the form data and perform submission
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
