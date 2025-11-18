import 'dart:io';
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class ConnectivityService {
  /// Check if device has internet connection
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Show offline dialog for free users
  static void showOfflineDialog(BuildContext context, VoidCallback onUpgrade) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(l10n.internetRequired),
        content: Text(l10n.internetRequiredMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onUpgrade();
            },
            child: Text(l10n.getPremium),
          ),
        ],
      ),
    );
  }

  /// Check connectivity and enforce for free users
  static Future<bool> checkConnectivityForUser({
    required bool isPremium,
    required BuildContext context,
    VoidCallback? onUpgradePressed,
  }) async {
    // Premium users can play offline
    if (isPremium) {
      return true;
    }

    // Free users must be online
    final hasInternet = await hasInternetConnection();
    if (!hasInternet && context.mounted) {
      showOfflineDialog(
        context,
        onUpgradePressed ?? () {},
      );
    }

    return hasInternet;
  }
}