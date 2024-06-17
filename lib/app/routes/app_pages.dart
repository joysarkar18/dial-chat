import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/app_theme/bindings/app_theme_binding.dart';
import '../modules/app_theme/views/app_theme_view.dart';
import '../modules/calls/bindings/calls_binding.dart';
import '../modules/calls/views/calls_view.dart';
import '../modules/calls_and_message/bindings/calls_and_message_binding.dart';
import '../modules/calls_and_message/views/calls_and_message_view.dart';
import '../modules/change_number/bindings/change_number_binding.dart';
import '../modules/change_number/views/change_number_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chatCall/bindings/chat_call_binding.dart';
import '../modules/chatCall/views/chat_call_view.dart';
import '../modules/delete_account/bindings/delete_account_binding.dart';
import '../modules/delete_account/views/delete_account_view.dart';
import '../modules/dial_pad/bindings/dial_pad_binding.dart';
import '../modules/dial_pad/views/dial_pad_view.dart';
import '../modules/dialing/bindings/dialing_binding.dart';
import '../modules/dialing/views/dialing_view.dart';
import '../modules/groupChat/bindings/group_chat_binding.dart';
import '../modules/groupChat/views/group_chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/internationalplans/bindings/internationalplans_binding.dart';
import '../modules/internationalplans/views/internationalplans_view.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/localplans/bindings/localplans_binding.dart';
import '../modules/localplans/views/localplans_view.dart';
import '../modules/name_email/bindings/name_email_binding.dart';
import '../modules/name_email/views/name_email_view.dart';
import '../modules/navBar/bindings/nav_bar_binding.dart';
import '../modules/navBar/views/nav_bar_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/phonenumber/bindings/phonenumber_binding.dart';
import '../modules/phonenumber/views/phonenumber_view.dart';
import '../modules/posts/bindings/posts_binding.dart';
import '../modules/posts/views/posts_view.dart';
import '../modules/privacy/bindings/privacy_binding.dart';
import '../modules/privacy/views/privacy_view.dart';
import '../modules/selectContact/bindings/select_contact_binding.dart';
import '../modules/selectContact/views/select_contact_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/storage/bindings/storage_binding.dart';
import '../modules/storage/views/storage_view.dart';
import '../modules/subscription/bindings/subscription_binding.dart';
import '../modules/subscription/views/subscription_view.dart';
import '../modules/two_step_verification/bindings/two_step_verification_binding.dart';
import '../modules/two_step_verification/views/two_step_verification_view.dart';
import '../modules/videoCall/bindings/video_call_binding.dart';
import '../modules/videoCall/views/video_call_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.PHONENUMBER,
      page: () => const PhonenumberView(),
      binding: PhonenumberBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.NAME_EMAIL,
      page: () => const NameEmailView(),
      binding: NameEmailBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.CALLS_AND_MESSAGE,
      page: () => const CallsAndMessageView(),
      binding: CallsAndMessageBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY,
      page: () => const PrivacyView(),
      binding: PrivacyBinding(),
    ),
    GetPage(
      name: _Paths.TWO_STEP_VERIFICATION,
      page: () => const TwoStepVerificationView(),
      binding: TwoStepVerificationBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_NUMBER,
      page: () => const ChangeNumberView(),
      binding: ChangeNumberBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_ACCOUNT,
      page: () => const DeleteAccountView(),
      binding: DeleteAccountBinding(),
    ),
    GetPage(
      name: _Paths.APP_THEME,
      page: () => const AppThemeView(),
      binding: AppThemeBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.STORAGE,
      page: () => const StorageView(),
      binding: StorageBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => const SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.LOCALPLANS,
      page: () => const LocalplansView(),
      binding: LocalplansBinding(),
    ),
    GetPage(
      name: _Paths.INTERNATIONALPLANS,
      page: () => const InternationalplansView(),
      binding: InternationalplansBinding(),
    ),
    GetPage(
      name: _Paths.CALLS,
      page: () => const CallsView(),
      binding: CallsBinding(),
    ),
    GetPage(
      name: _Paths.POSTS,
      page: () => const PostsView(),
      binding: PostsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.DIAL_PAD,
      page: () => const DialPadView(),
      binding: DialPadBinding(),
    ),
    GetPage(
      name: _Paths.DIALING,
      page: () => const DialingView(),
      binding: DialingBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_CALL,
      page: () => const ChatCallView(),
      binding: ChatCallBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_CALL,
      page: () => const VideoCallView(),
      binding: VideoCallBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_CONTACT,
      page: () => const SelectContactView(),
      binding: SelectContactBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_CHAT,
      page: () => const GroupChatView(),
      binding: GroupChatBinding(),
    ),
  ];
}
