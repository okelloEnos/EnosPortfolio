// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../util/image_detection/vision_detector_visions/face_detector_view.dart';
// import 'circular_progress_spin_widget.dart';
//
// class EditSelfieWidget extends StatefulWidget {
//   final File? image;
//   final Function(File?) onImageChanged;
//   final String? remoteImage;
//   const EditSelfieWidget({super.key, required this.image, required this.onImageChanged, required this.remoteImage});
//
//   @override
//   State<EditSelfieWidget> createState() => _EditSelfieWidgetState();
// }
//
// class _EditSelfieWidgetState extends State<EditSelfieWidget> {
//   File? _image;
//   String? _remoteImage;
//
//   @override
//   void initState() {
//     super.initState();
//     _image = widget.image;
//     _remoteImage = widget.remoteImage;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     double borderRadius = 10.0;
//     double height = 150;
//     double width = 150;
//     double avatarRadius = 30;
//     var theme = Theme.of(context);
//
//     return Padding(
//       padding: const EdgeInsets.only(
//           bottom: 5, top: 20, left: 10),
//       child: Stack(
//         alignment: AlignmentDirectional.bottomEnd,
//         children: [
//           _image != null
//               ? Container(
//               height: height,
//               width: width,
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 shape: BoxShape.circle,
//               ),
//               child: ClipRRect(
//                   borderRadius:
//                   BorderRadius.circular(borderRadius),
//                   child: Image.file(_image!, fit: BoxFit.fill,
//                   )))
//               : ClipRRect(
//             borderRadius:
//             BorderRadius.circular(borderRadius),
//             child: _remoteImage == null
//                 ? CircleAvatar(
//               radius: avatarRadius,
//               backgroundImage: const AssetImage(
//                   'assets/images/image_placeholder.png'),
//             )
//                 : CachedNetworkImage(
//               imageUrl:
//               _remoteImage ?? '',
//               imageBuilder: (context,
//                   imageProvider) =>
//                   Container(
//                     decoration:
//                     BoxDecoration(
//                       borderRadius:
//                       BorderRadius
//                           .circular(
//                           borderRadius),
//                       image:
//                       DecorationImage(
//                         image:
//                         imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     height: height,
//                     width: width,
//                   ),
//               placeholder:
//                   (context, url) =>
//                   CircularSpinProgress(
//                     spinColor:
//                     theme.colorScheme.primary
//                   ),
//               errorWidget: (context,
//                   url, error) =>
//               CircleAvatar(
//                 radius: avatarRadius,
//                 backgroundImage:
//                 const AssetImage(
//                     'assets/images/image_placeholder.png'),
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () async {
//
//             File? userFace = await  Navigator.of(context).push(
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           const FaceDetectorView(
//                             title:
//                             'Profile',
//                           )));
//             setState(() {
//               _image = userFace;
//               widget.onImageChanged(_image);
//             });
//             },
//             child: Padding(
//               padding:
//               const EdgeInsets.only(left: 20),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                         color: theme.colorScheme.primary,
//                         width: 2)),
//                 child:  Padding(
//                   padding:
//                   const EdgeInsets.all(4.0),
//                   child: Icon(
//                     Icons.linked_camera,
//                     color: theme.colorScheme.primary,
//                     size: 25,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
