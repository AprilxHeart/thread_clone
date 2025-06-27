import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/mock_data_service.dart';

class AuthController extends GetxController {
  final Rx<User?> currentUser = Rx<User?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate auto-login
    Future.delayed(Duration(milliseconds: 300), () {
      currentUser.value = MockDataService.getCurrentUser();
    });
  }

  void login() {
    isLoading.value = true;
    // Simulate login process
    Future.delayed(Duration(seconds: 1), () {
      currentUser.value = MockDataService.getCurrentUser();
      isLoading.value = false;
    });
  }

  void logout() {
    currentUser.value = null;
    Get.offAllNamed('/login');
  }

  bool get isLoggedIn => currentUser.value != null;
}
