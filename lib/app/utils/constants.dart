import 'package:flutter/cupertino.dart';

import 'package:flutter/painting.dart';

/// * This [sizes] are the standard
/// 0 [None]
/// 5 [XSm]
/// 10 [Sm]
/// 15 [Md]
/// 20 [Lg]
/// 25 [XLg]
/// [kRadiusCircular] is a special case for curves totally circular
///
/// * This [transactionTypes] are the standard
/// [kRadius] [preferred] [separator] [kSpaceDevice]
///
/// ** [preferredSize] affect all the headers the standard sizes are
/// [preferredSize] header without tabs
///
///
/// ** [kSpaceDevice] can be combined with this Suffixes
/// Top [T]
/// Right [R]
/// Bottom [B]
/// Left [L]
/// Horizontal [H]
/// Vertical [V]
///
/// *** Special combinations
/// [HV] horizontal and vertical with different proportions
/// this has two variations [normal] and [special]
/// try to use always the first one
///
/// [HT] [HB] horizontally but only included Top or Bottom with same sized
/// only for Medium size [15]
///
/// *** Skeleton colors
///
/// *** Identifier's type;
/// [01100001] id or [allAsIdentifier] for sections that need a section wrapping all data;
/// [01000110] id or [featuredIdentifier] for sections that need a featured block wrapped as one;
///
///  *** BottomSheet shape - Rounded rectangle border
///  A medium border rounded  [roundedRectangleTMd]
///
/// *** URL links;
/// has prefix -> url
/// if there are multiple similar urls with different purpose,
/// use as suffix the section where is detonated;

const int allAsIdentifier = 01100001;
const int featuredIdentifier = 01000110;

const int smallMobile = 320;
const int mediumMobile = 375;
const int largeMobile = 425;
const int tablet = 768;
const int laptop = 1024;

const double kRadiusXSm = 8;
const double kRadiusSm = 12;
const double kRadiusMd = 15;
const double kRadiusLg = 20;
const double kRadiusXLg = 25;
const double kRadiusCircular = 30;
const Size preferredSize = Size.fromHeight(68);
const EdgeInsets kSpaceDevice0 = EdgeInsets.all(spacing0);
const EdgeInsets kSpaceDevice1 = EdgeInsets.all(spacing1);
const EdgeInsets kSpaceDevice2 = EdgeInsets.all(spacing2);
const EdgeInsets kSpaceDevice3 = EdgeInsets.all(spacing3);
const EdgeInsets kSpaceDevice4 = EdgeInsets.all(spacing4);
const EdgeInsets kSpaceDevice5 = EdgeInsets.all(spacing5);
const EdgeInsets kSpaceDevice5Medium =
    EdgeInsets.symmetric(horizontal: spacing12, vertical: spacing5);
const EdgeInsets kSpaceDevice5Large =
    EdgeInsets.symmetric(horizontal: spacing40, vertical: spacing5);

const EdgeInsets kSpaceDevice6 = EdgeInsets.all(spacing6);
const EdgeInsets kSpaceDevice6Medium = EdgeInsets.all(spacing12);
const EdgeInsets kSpaceDevice6Large = EdgeInsets.all(spacing40);

const EdgeInsets kSpaceDevice1T = EdgeInsets.only(top: spacing1);
const EdgeInsets kSpaceDevice2T = EdgeInsets.only(top: spacing2);
const EdgeInsets kSpaceDevice3T = EdgeInsets.only(top: spacing3);
const EdgeInsets kSpaceDevice4T = EdgeInsets.only(top: spacing4);
const EdgeInsets kSpaceDevice5T = EdgeInsets.only(top: spacing5);
const EdgeInsets kSpaceDevice6T = EdgeInsets.only(top: spacing6);
const EdgeInsets kSpaceDevice1R = EdgeInsets.only(right: spacing1);
const EdgeInsets kSpaceDevice2R = EdgeInsets.only(right: spacing2);
const EdgeInsets kSpaceDevice4R = EdgeInsets.only(right: spacing4);
const EdgeInsets kSpaceDevice5R = EdgeInsets.only(right: spacing5);
const EdgeInsets kSpaceDevice6R = EdgeInsets.only(right: spacing6);
const EdgeInsets kSpaceDevice8R = EdgeInsets.only(right: spacing8);
const EdgeInsets kSpaceDevice1B = EdgeInsets.only(bottom: spacing1);
const EdgeInsets kSpaceDevice2B = EdgeInsets.only(bottom: spacing2);
const EdgeInsets kSpaceDevice3B = EdgeInsets.only(bottom: spacing3);
const EdgeInsets kSpaceDevice4B = EdgeInsets.only(bottom: spacing4);
const EdgeInsets kSpaceDevice5B = EdgeInsets.only(bottom: spacing5);
const EdgeInsets kSpaceDevice6B = EdgeInsets.only(bottom: spacing6);
const EdgeInsets kSpaceDevice8B = EdgeInsets.only(bottom: spacing8);
const EdgeInsets kSpaceDevice1L = EdgeInsets.only(left: spacing1);
const EdgeInsets kSpaceDevice2L = EdgeInsets.only(left: spacing2);
const EdgeInsets kSpaceDevice4L = EdgeInsets.only(left: spacing4);
const EdgeInsets kSpaceDevice5L = EdgeInsets.only(left: spacing5);
const EdgeInsets kSpaceDevice1V = EdgeInsets.symmetric(vertical: spacing1);
const EdgeInsets kSpaceDevice2V = EdgeInsets.symmetric(vertical: spacing2);
const EdgeInsets kSpaceDevice3V = EdgeInsets.symmetric(vertical: spacing3);
const EdgeInsets kSpaceDevice4V = EdgeInsets.symmetric(vertical: spacing4);
const EdgeInsets kSpaceDevice5V = EdgeInsets.symmetric(vertical: spacing5);
const EdgeInsets kSpaceDevice6V = EdgeInsets.symmetric(vertical: spacing6);
const EdgeInsets kSpaceDevice1H = EdgeInsets.symmetric(horizontal: spacing1);
const EdgeInsets kSpaceDevice2H = EdgeInsets.symmetric(horizontal: spacing2);
const EdgeInsets kSpaceDevice3H = EdgeInsets.symmetric(horizontal: spacing3);
const EdgeInsets kSpaceDevice4H = EdgeInsets.symmetric(horizontal: spacing4);
const EdgeInsets kSpaceDevice5H = EdgeInsets.symmetric(horizontal: spacing5);
const EdgeInsets kSpaceDevice6H = EdgeInsets.symmetric(horizontal: spacing6);
const EdgeInsets kSpaceDevice8H = EdgeInsets.symmetric(horizontal: spacing8);
const EdgeInsets kSpaceDeviceHVNormal =
    EdgeInsets.symmetric(horizontal: spacing2, vertical: 5);
const EdgeInsets kSpaceDeviceHVBadgeSm =
    EdgeInsets.symmetric(horizontal: 5, vertical: 3);
const EdgeInsets kSpaceDeviceHVBadge =
    EdgeInsets.symmetric(horizontal: 9, vertical: 4);
const EdgeInsets kSpaceDeviceHVNSmall =
    EdgeInsets.symmetric(horizontal: 10, vertical: 2.5);
const EdgeInsets kSpaceDeviceHVSpecial =
    EdgeInsets.symmetric(horizontal: spacing4, vertical: 10);
const EdgeInsets kSpaceDeviceHTAsymmetric =
    EdgeInsets.only(top: 8, right: 15, left: 15);
const EdgeInsets kSpaceDeviceHTXSm = EdgeInsets.only(top: 5, right: 5, left: 5);
const EdgeInsets kSpaceDeviceHTSm =
    EdgeInsets.only(top: 10, right: 10, left: 10);
const EdgeInsets kSpaceDeviceHT = EdgeInsets.only(top: 15, right: 15, left: 15);
const EdgeInsets kSpaceDeviceHBSm =
    EdgeInsets.only(bottom: 10, right: 10, left: 10);
const EdgeInsets kSpaceDeviceHB =
    EdgeInsets.only(bottom: 15, right: 15, left: 15);
const EdgeInsets kSpaceDeviceHBLg =
    EdgeInsets.only(bottom: 20, right: 20, left: 20);
const BorderRadius kRadiusTMd =
    BorderRadius.vertical(top: Radius.circular(kRadiusMd));
const BorderRadius kRadiusBMd =
    BorderRadius.vertical(bottom: Radius.circular(kRadiusMd));
const BorderRadius kRadiusTSm =
    BorderRadius.vertical(top: Radius.circular(kRadiusSm));
const BorderRadius kRadiusBSm =
    BorderRadius.vertical(bottom: Radius.circular(kRadiusSm));
const Radius bubbleBorder = Radius.circular(kRadiusSm);
const Duration retailDurationTimer = Duration(minutes: 15);
const Duration timeToAwaitSupplier = Duration(seconds: 10);
const Duration kRegularDuration = Duration(milliseconds: 750);
const RoundedRectangleBorder roundedRectangleTMd = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusMd)),
);
const RoundedRectangleBorder roundedRectangleMd = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(kRadiusMd)),
);

const String defaultLanguage = "EN";
const String termsOfUseES =
    'https://shappi.com/es/terminos-de-uso/?utm_source=inapp&utm_medium=login&utm_campaign=inapp_documentation_users';
const String termsOfUseEN =
    'https://shappi.com/terms-of-use/?utm_source=inapp&utm_medium=login&utm_campaign=inapp_documentation_users';
const String privacyPolicyES =
    'https://shappi.com/es/politicasdeprivacidad/?utm_source=inapp&utm_medium=login&utm_campaign=inapp_documentation_users';
const String privacyPolicyEN =
    'https://shappi.com/privacy-policy/?utm_source=inapp&utm_medium=login&utm_campaign=inapp_documentation_users';
@Deprecated('Use termsOfUseES instead')
const String purpleProtection = 'https://shappi.com/purple-protection-es/';

const String purpleProtectionHomeCustomer =
    "https://help.shappi.com/docs/informacion-general/seguridad/?utm_source=inapp&utm_medium=home_banner&utm_campaign=inapp_pp_customers";
const String purpleProtectionServiceDescription =
    "https://help.shappi.com/docs/informacion-general/seguridad/?utm_source=inapp&utm_medium=service_description&utm_campaign=inapp_pp_customers";
const String purpleProtectionCheckout =
    "https://help.shappi.com/docs/informacion-general/seguridad/?utm_source=inapp&utm_medium=checkout&utm_campaign=inapp_pp_customers";
const String purpleProtectionChatCustomer =
    "https://help.shappi.com/docs/informacion-general/seguridad/?utm_source=inapp&utm_medium=chat&utm_campaign=inapp_pp_customers";
const String purpleProtectionSupportCustomer =
    "https://help.shappi.com/docs/informacion-general/seguridad/?utm_source=inapp&utm_medium=support&utm_campaign=inapp_pp_customers";

const String customerSupport =
    'https://help.shappi.com/docs/informacion-general/compradores/?utm_source=inapp&utm_medium=support_customers&utm_campaign=inapp_support_customers';
const String supplierSupport =
    'https://help.shappi.com/docs/informacion-general/viajero/?utm_source=inapp&utm_medium=support_travelers&utm_campaign=inapp_support_travelers';
const String urlHelpCenter =
    "https://help.shappi.com/?utm_source=inapp&utm_medium=inapp_menu&utm_campaign=inapp_helpshappihome";
const String urlCustomsRegulationsCustomers =
    "https://shappi.com/es/regulacionesaduaneras-2/?utm_source=inapp&utm_medium=menu_customs_customers&utm_campaign=inapp_customs_customers";
const String urlCustomsRegulationsTravelers =
    "https://shappi.com/es/regulacionesaduaneras-2/?utm_source=inapp&utm_medium=menu_customs_travelers&utm_campaign=inapp_customs_travelers";
const String urlTravelerPaymentFee =
    "https://help.shappi.com/docs/informacion-general/viajero/tarifas-para-recibir-mi-pago/?utm_source=inapp&utm_medium=menu_profits_settings&utm_campaign=inapp_view_profits_fee";
const String supportEmail = 'soporte@shappi.com';
const String whatsAppSupport = "15074287222";
const String whatsAppSupportSuppliers = "573207093267";

/// spacing
const spacing0 = 0.0;
const spacing1 = 4.0;
const spacing2 = 8.0;
const spacing3 = 12.0;
const spacing4 = 16.0;
const spacing5 = 20.0;
const spacing6 = 24.0;
const spacing7 = 28.0;
const spacing8 = 32.0;
const spacing10 = 40.0;
const spacing11 = 44.0;
const spacing12 = 48.0;
const spacing16 = 64.0;
const spacing20 = 80.0;
const spacing24 = 96.0;
const spacing28 = 112.0;
const spacing32 = 128.0;
const spacing36 = 144.0;
const spacing40 = 160.0;

const EdgeInsets kCanvas6 = EdgeInsets.all(spacing6);
const EdgeInsets kCanvas6Medium =
    EdgeInsets.symmetric(horizontal: spacing12, vertical: spacing6);
const EdgeInsets kCanvas6Large =
    EdgeInsets.symmetric(horizontal: spacing40, vertical: spacing6);

const EdgeInsets kCanvas6H = EdgeInsets.symmetric(horizontal: spacing6);
const EdgeInsets kCanvas6HMedium = EdgeInsets.symmetric(horizontal: spacing12);
const EdgeInsets kCanvas6HLarge = EdgeInsets.symmetric(horizontal: spacing40);

const EdgeInsets kCanvas8 = EdgeInsets.all(spacing8);
const EdgeInsets kCanvas8Medium =
    EdgeInsets.symmetric(horizontal: spacing16, vertical: spacing8);
const EdgeInsets kCanvas8Large =
    EdgeInsets.symmetric(horizontal: spacing40, vertical: spacing8);

const EdgeInsets kCanvas8H = EdgeInsets.symmetric(horizontal: spacing8);
const EdgeInsets kCanvas8HMedium = EdgeInsets.symmetric(horizontal: spacing16);
const EdgeInsets kCanvas8HLarge = EdgeInsets.symmetric(horizontal: spacing40);

const EdgeInsets kCanvas6Header =
    EdgeInsets.symmetric(vertical: spacing4, horizontal: spacing6);
const EdgeInsets kCanvas6HeaderMedium =
    EdgeInsets.symmetric(vertical: spacing4, horizontal: spacing12);
const EdgeInsets kCanvas6HeaderLarge =
    EdgeInsets.symmetric(vertical: spacing4, horizontal: spacing40);

const EdgeInsets kBottomSheetHeader =
    EdgeInsets.symmetric(vertical: spacing2, horizontal: spacing6);

const toastDuration = Duration(seconds: 3);

const Color primaryColor = Color(0xFF68566D);
const Color accentColor = Color(0xFFE6B89C);
const Color scaffoldBackgroundColor = Color(0xFF000000);
const Color primaryButtonColor = Color(0xFF68566D);
const Color disabledButtonColor = Color(0xFFA092A6);
const Color buttonBorderColor = Color(0xFF68566D);
const Color alertColor = Color(0xFFFF0000);
const Color primaryButtonHoverColor = Color(0xFF877083);
const Color secondaryButtonHoverColor = Color(0xFFC5B8C8);
const Color alertButtonHoverColor = Color(0xFFFF1919);
