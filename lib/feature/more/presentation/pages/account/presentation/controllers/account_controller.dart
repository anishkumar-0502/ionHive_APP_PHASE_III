import 'package:get/get.dart';
// import 'package:ionhive/feature/more/presentation/pages/account/domain/repositories/account_repository.dart';

class AccountController extends GetxController {
  // final AccountRepository _accountRepository = AccountRepository();

  final List<String> reasons = [
    "App doesn't fulfill my purpose",
    "I downloaded this out of curiosity, I do not own an EV",
    "Payment related issues",
    "Charger not available in my location",
    "I do not feel safe while using this app",
    "The app is buggy and really slow",
    "Switching to another competitor",
    "Bad charging experience",
    "Something Else"
  ];
  // Observable for selected reason
  var selectedReason = ''.obs;

  // Method to delete the account
  void deleteAccount() {
    if (selectedReason.value.isEmpty) {
      Get.snackbar("Error", "Please select a reason to proceed.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Handle delete account logic here
    // Example: _accountRepository.deleteAccount() (this is just a placeholder)
    Get.snackbar(
        "Account Deleted", "Your account has been deleted successfully.",
        snackPosition: SnackPosition.BOTTOM);
  }
}
