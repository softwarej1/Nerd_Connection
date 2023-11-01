import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class WriteController extends GetxController {
  final Rxn<AssetEntity> _selectedImage = Rxn<AssetEntity>();

  AssetEntity? get selectedImage => _selectedImage.value;
}
