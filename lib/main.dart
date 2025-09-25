import 'package:flutter/material.dart';
import 'app_theme.dart';

// USER Screens
import 'user/screens/splash_screen.dart';
import 'user/screens/onboarding_screen.dart';
import 'user/screens/language_selection_screen.dart';
import 'user/screens/tutorial_screen.dart';
import 'user/screens/login_screen.dart';
import 'user/screens/otp_verification_screen.dart';
import 'user/screens/dashboard_screen.dart';
import 'user/screens/voucher_list_screen.dart';
import 'user/screens/voucher_detail_screen.dart';
import 'user/screens/medical_history_screen.dart';
import 'user/screens/visit_detail_screen.dart';
import 'user/screens/lab_result_detail_screen.dart';
import 'user/screens/notifications_screen.dart';
import 'user/screens/notification_detail_screen.dart';
import 'user/screens/consent_overview_screen.dart';
import 'user/screens/consent_detail_screen.dart';
import 'user/screens/consent_history_screen.dart';
import 'user/screens/profile_screen.dart';
import 'user/screens/edit_profile_screen.dart';
import 'user/screens/device_linking_screen.dart';
import 'user/screens/biometric_link_request_screen.dart';
import 'user/screens/download_pdf_screen.dart';
import 'user/screens/help_faq_screen.dart';
import 'user/screens/contact_support_screen.dart';
import 'user/screens/settings_screen.dart';

// Newly added screens
import 'user/screens/feedback_screen.dart';
import 'user/screens/health_id_screen.dart';
import 'user/screens/prescriptions_screen.dart';
import 'user/screens/privacy_policy_screen.dart';
import 'user/screens/qr_display_screen.dart';
import 'user/screens/qr_scan_screen.dart';
import 'user/screens/terms_conditions_screen.dart';
import 'user/screens/vaccination_record_screen.dart';
import 'user/screens/voucher_redemption_history_screen.dart';
import 'user/screens/wallet_screen.dart';

// Models
import 'user/models/worker.dart';
import 'user/models/voucher.dart';
import 'user/models/notification.dart';
import 'user/models/consent.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DHRMSUserApp());
}

class DHRMSUserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DHRMS - User',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,

      // Screens without parameters
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
        LanguageSelectionScreen.routeName: (_) => LanguageSelectionScreen(),
        TutorialScreen.routeName: (_) => TutorialScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        OtpVerificationScreen.routeName: (_) => OtpVerificationScreen(),
        DashboardScreen.routeName: (_) => DashboardScreen(),
        VoucherListScreen.routeName: (_) => VoucherListScreen(),
        MedicalHistoryScreen.routeName: (_) => MedicalHistoryScreen(),
        ConsentOverviewScreen.routeName: (_) => ConsentOverviewScreen(),
        ProfileScreen.routeName: (_) => ProfileScreen(),
        DeviceLinkingScreen.routeName: (_) => DeviceLinkingScreen(),
        BiometricLinkRequestScreen.routeName: (_) => BiometricLinkRequestScreen(),
        DownloadPdfScreen.routeName: (_) => DownloadPdfScreen(),
        HelpFaqScreen.routeName: (_) => HelpFaqScreen(),
        ContactSupportScreen.routeName: (_) => ContactSupportScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen(),
        ConsentHistoryScreen.routeName: (_) => ConsentHistoryScreen(),
        NotificationsScreen.routeName: (_) => NotificationsScreen(),

        // Newly added
        FeedbackScreen.routeName: (_) => FeedbackScreen(),
        HealthIdScreen.routeName: (_) => HealthIdScreen(),
        PrescriptionsScreen.routeName: (_) => PrescriptionsScreen(),
        PrivacyPolicyScreen.routeName: (_) => PrivacyPolicyScreen(),
        QrDisplayScreen.routeName: (_) => QrDisplayScreen(),
        QrScanScreen.routeName: (_) => QrScanScreen(),
        TermsConditionsScreen.routeName: (_) => TermsConditionsScreen(),
        VaccinationRecordScreen.routeName: (_) => VaccinationRecordScreen(),
        VoucherRedemptionHistoryScreen.routeName: (_) => VoucherRedemptionHistoryScreen(),
        WalletScreen.routeName: (_) => WalletScreen(),
      },

      // Screens with required parameters
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case VoucherDetailScreen.routeName:
            final args = settings.arguments as Voucher;
            return MaterialPageRoute(
              builder: (_) => VoucherDetailScreen(
                title: args.type,
                expiry: args.validTo.toIso8601String(),
                status: args.redeemed ? 'Redeemed' : 'Active',
              ),
            );

          case NotificationDetailScreen.routeName:
            final args = settings.arguments as AppNotification;
            return MaterialPageRoute(
              builder: (_) => NotificationDetailScreen(notification: args),
            );

          case ConsentDetailScreen.routeName:
            final args = settings.arguments as Consent;
            return MaterialPageRoute(
              builder: (_) => ConsentDetailScreen(consent: args),
            );

          case EditProfileScreen.routeName:
            final args = settings.arguments as Worker;
            return MaterialPageRoute(
              builder: (_) => EditProfileScreen(worker: args),
            );

          default:
            return MaterialPageRoute(
              builder: (_) => DashboardScreen(), // fallback
            );
        }
      },
    );
  }
}
