import 'package:hrms/src/services/permission_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  static final ImagePicker _imagePicker = ImagePicker();
  static final ImageCropper _imageCropper = ImageCropper();

  static Future<String?> pickImage() async {
    bool isGranted = await PermissionService.galleryPermission();
    if (!isGranted) return null;
    XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return null;
    CroppedFile? cropImage = await _imageCropper.cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (cropImage == null) return null;
    return cropImage.path;
  }
}
