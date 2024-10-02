import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SignUP
  {
    'sg7du7o6': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'da4pys50': {
      'en': 'Use the form below to get started.',
      'ar': 'استخدم النموذج أدناه للبدء.',
    },
    '9idkm521': {
      'en': '',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '80fo57h6': {
      'en': 'Email Address',
      'ar': 'أدخل عنوان بريدك الإلكتروني هنا...',
    },
    'es9y003q': {
      'en': '',
      'ar': 'كلمة المرور',
    },
    '6cey7mhw': {
      'en': 'Password',
      'ar': 'أدخل عنوان بريدك الإلكتروني هنا...',
    },
    'mkh6t1kd': {
      'en': '',
      'ar': 'تأكيد كلمة المرور',
    },
    'e9g37bi8': {
      'en': 'Confirm Password',
      'ar': 'أدخل عنوان بريدك الإلكتروني هنا...',
    },
    'h7d4zds2': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'dtyvx7af': {
      'en': 'Use a social platform to continue',
      'ar': 'استخدم منصة اجتماعية للمتابعة',
    },
    'tp0zm9ch': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
    },
    '6brl2359': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
    },
    'ngqo4wt2': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SignIN
  {
    'ctc9bsyd': {
      'en': 'Welcome Back!',
      'ar': 'مرحبًا بعودتك!',
    },
    'nnvj8chv': {
      'en': 'Use the form below to access your account.',
      'ar': 'استخدم النموذج أدناه للوصول إلى حسابك.',
    },
    'eb4ma6kb': {
      'en': 'Login with Google',
      'ar': 'تسجيل الدخول عبر جوجل',
    },
    'c2y8mjdi': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'xda42dka': {
      'en': '',
      'ar': 'أدخل عنوان بريدك الإلكتروني هنا...',
    },
    'zxaj4y60': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '4nbdovsn': {
      'en': '',
      'ar': 'أدخل كلمة المرور الخاصة بك هنا ...',
    },
    '3i914x1t': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    '35hmufo8': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    'qxbo7qqi': {
      'en': 'Field is required',
      'ar': '',
    },
    't3sawx6b': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ytlu7he3': {
      'en': 'Field is required',
      'ar': '',
    },
    'gjijx5hf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fiahvkoe': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Onboard-ForgotPassword
  {
    'xhoovnxo': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'ar':
          'لا تتذكر كلمة المرور الخاصة بك؟ أدخل البريد الإلكتروني المرتبط بحسابك أدناه وسنرسل لك ارتباطًا جديدًا.',
    },
    'o5m3nuop': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '8txqwusi': {
      'en': '',
      'ar': 'يرجى إدخال البريد الإلكتروني الصحيح...',
    },
    'z8kpa274': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
    },
    '8flbfem9': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Home
  {
    '24n0xlh0': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    '34xmn16n': {
      'en': 'Registered User',
      'ar': 'مستخدم مسجل',
    },
    'zeko88rp': {
      'en': 'Enrolled',
      'ar': 'المقيدين',
    },
    '14kwfqi8': {
      'en': 'Active User',
      'ar': 'مستخدم نشط',
    },
    '07ncurnc': {
      'en': 'Instructor',
      'ar': 'مدرب',
    },
    '7cvhz0aq': {
      'en': 'KD',
      'ar': 'دينار كويتي',
    },
    'hbbjcwev': {
      'en': 'Today - Sales',
      'ar': 'اليوم - المبيعات',
    },
    's79glhup': {
      'en': 'KD',
      'ar': 'دينار كويتي',
    },
    'qrt86srv': {
      'en': 'Weekly - Sales',
      'ar': 'أسبوعي - المبيعات',
    },
    '3n5czd7s': {
      'en': 'KD',
      'ar': 'دينار كويتي',
    },
    'muynpdk7': {
      'en': 'Monthly - Sales',
      'ar': 'شهريا - المبيعات',
    },
    'sn72f4gz': {
      'en': 'Orders in Last 7 Days',
      'ar': 'الطلبات في آخر 30 يومًا',
    },
    '8hlhazum': {
      'en': 'No. of Orders',
      'ar': '',
    },
    'b16u9bti': {
      'en': 'Order CharBAR',
      'ar': '',
    },
    'qfwuhq6c': {
      'en': 'Price',
      'ar': '',
    },
    '3w84orh8': {
      'en': 'Price ChartBAR',
      'ar': '',
    },
    'awuq1g2o': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'jpzj9usx': {
      'en': 'Order & Price',
      'ar': 'طلب',
    },
    'kh0jo8tb': {
      'en': 'Recent Order',
      'ar': 'النظام الجديد',
    },
    'bdtvm2bf': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'uw3e86yt': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'v0sbozfb': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'n1xt5o98': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '3gf3eiq8': {
      'en': 'Upcoming Appointment',
      'ar': 'الموعد القادم',
    },
    '3sa962m9': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'mlh1yxzw': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'h6vz4h8j': {
      'en': 'Session Time',
      'ar': 'وقت الجلسة',
    },
    'znhhwvdp': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'zb2y38wb': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
  },
  // Course
  {
    'tse7gu5e': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'xqn06mdr': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    '1goqyict': {
      'en': 'Published',
      'ar': 'نشرت',
    },
    'enwlj0ds': {
      'en': 'Draft',
      'ar': 'مسودة',
    },
    '9uyihlk3': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    's937kf2c': {
      'en': 'status',
      'ar': 'حالة',
    },
    'wzwby2v4': {
      'en': 'Chapters',
      'ar': '',
    },
    'l93qlyno': {
      'en': 'Reviews',
      'ar': '',
    },
    '307xhyqh': {
      'en': 'Students',
      'ar': '',
    },
    'd017dap6': {
      'en': 'Delete',
      'ar': '',
    },
    'rnguhzgp': {
      'en': 'status',
      'ar': 'حالة',
    },
    'qpki9vvt': {
      'en': 'Chapters',
      'ar': '',
    },
    '79j4yb3n': {
      'en': 'Reviews',
      'ar': '',
    },
    '7gyf0rqa': {
      'en': 'Students',
      'ar': '',
    },
    'ond8ybuf': {
      'en': 'Delete',
      'ar': '',
    },
    'ct6irs69': {
      'en': 'Chapters',
      'ar': '',
    },
    '6s81mvz6': {
      'en': 'Reviews',
      'ar': '',
    },
    'y3knswbe': {
      'en': 'Students',
      'ar': '',
    },
    'ku9ghzsq': {
      'en': 'Delete',
      'ar': '',
    },
    'r05nr182': {
      'en': 'Chapters',
      'ar': '',
    },
    '3gdl582w': {
      'en': 'Reviews',
      'ar': '',
    },
    'zaagf26j': {
      'en': 'Students',
      'ar': '',
    },
    '6x22h5i6': {
      'en': 'Delete',
      'ar': '',
    },
    'jmgrp0no': {
      'en': 'Chapters',
      'ar': '',
    },
    '9xdfprqp': {
      'en': 'Reviews',
      'ar': '',
    },
    '3uodwf4a': {
      'en': 'Students',
      'ar': '',
    },
    'cd4t52pz': {
      'en': 'Move to draft',
      'ar': '',
    },
    'e82yz2o5': {
      'en': 'Chapters',
      'ar': '',
    },
    'vf3n54pl': {
      'en': 'Reviews',
      'ar': '',
    },
    '2ne47vm2': {
      'en': 'Students',
      'ar': '',
    },
    'zjae9nvq': {
      'en': 'Move to draft',
      'ar': '',
    },
    '114q3b80': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '3cmlnpj2': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // ProfilePage
  {
    '8us93wf9': {
      'en': 'My Profile',
      'ar': 'ملفي',
    },
    'o09do3m3': {
      'en': 'Account Settings',
      'ar': 'إعدادت الحساب',
    },
    'uhq9ynyy': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'gmq7xlmg': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'd9985mjs': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    '40l5xkl9': {
      'en': '__',
      'ar': '__',
    },
  },
  // Chapters
  {
    'avs048f9': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    '8ttumqxb': {
      'en': '> ',
      'ar': '>',
    },
    '10ev5hpx': {
      'en': '> ',
      'ar': '>',
    },
    '7xwfcbqs': {
      'en': 'Chapter',
      'ar': 'الفصل',
    },
    'f99nr45k': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    '71mzl4jt': {
      'en': 'View Lesson',
      'ar': 'عرض الدرس',
    },
    'ius35mbo': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'su2bd0b0': {
      'en': '__',
      'ar': '__',
    },
  },
  // EditProfile
  {
    'd90mrtlm': {
      'en': 'Edit Profile',
      'ar': 'تقرير الشوائب',
    },
    'd9tgmzf3': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
    },
    'jxt9xuzv': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    'afxyzjqt': {
      'en': 'Your Phone Number',
      'ar': 'رقم تليفونك',
    },
    'pc9j0phg': {
      'en': '',
      'ar': 'أدخل رقم هاتفك',
    },
    'vyy0xtq2': {
      'en': 'The email associated with this account is:',
      'ar': 'البريد الإلكتروني المرتبط بهذا الحساب هو:',
    },
    'vubiz54d': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // searchPage
  {
    '08i22fgw': {
      'en': 'Add Members',
      'ar': 'إضافة أعضاء',
    },
    'if35rsaw': {
      'en': 'Search members...',
      'ar': 'البحث عن أعضاء ...',
    },
    'ezdko75x': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'mm1jji7u': {
      'en': 'Add Members',
      'ar': 'إضافة أعضاء',
    },
    'xvzz4zc5': {
      'en': 'View',
      'ar': 'منظر',
    },
    'lqg3pwgr': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Onboard-Phone
  {
    'asytx850': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'wcnte3ju': {
      'en': 'Type in your phone number below to register.',
      'ar': 'اكتب رقم هاتفك أدناه للتسجيل.',
    },
    'z3twmk7b': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'uu5fmiap': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
    },
    'mj869gp0': {
      'en': 'Phone Number......',
      'ar': 'رقم التليفون......',
    },
    'j993u25u': {
      'en': 'Continue',
      'ar': 'يكمل',
    },
    'xqu83zh1': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Onboard-PhoneVerification
  {
    'zp6lpe0y': {
      'en': 'Please enter the 6-digit code sent to you at',
      'ar': 'الرجاء إدخال الرمز المكون من 6 أرقام المرسل إليك على',
    },
    'ngxargzi': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    '4npgvlzv': {
      'en': 'Resend will be available in  ',
      'ar': 'إعادة الإرسال ستكون متاحة في',
    },
    'q6o75ow8': {
      'en': 'sec',
      'ar': 'ثانية',
    },
    '65tfqvi2': {
      'en': 'Didn\'t get the code?',
      'ar': 'ألم تحصل على الرمز؟',
    },
    '26jkhhul': {
      'en': 'Resend',
      'ar': 'إعادة إرسال',
    },
    'q88zndcm': {
      'en': 'Confirm & Continue',
      'ar': 'تأكيد ومتابعة',
    },
    '786u8qsn': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Onboard-ChangePassword
  {
    'v4j9keb1': {
      'en': 'Change Password',
      'ar': 'مقابلة',
    },
    'a793htof': {
      'en':
          'Enter your email and we will send a reset password link to your email for you to update it.',
      'ar':
          'أدخل بريدك الإلكتروني وسنرسل لك رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني لتحديثه.',
    },
    'jv2onope': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    'ykyptjnj': {
      'en': '',
      'ar': 'سنرسل رابط إلى بريدك الإلكتروني ...',
    },
    'cb5lzio4': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
    },
    '0fstax91': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // CourseCategory
  {
    '2oip33og': {
      'en': 'Course Category',
      'ar': 'فئة الدورة',
    },
    '9vpmttkm': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    '6obt03jx': {
      'en': 'Delete',
      'ar': '',
    },
    'ij60b1g2': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'e3kn8pyz': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // CourseFORM
  {
    'ixg06oy0': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'nn7apnfz': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'xtua7brb': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    '1ebbec6u': {
      'en': '',
      'ar': 'أدخل العنوان الفرعي للدورة هنا ...',
    },
    'h74omdib': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'g2c2ikjm': {
      'en': 'Select country...',
      'ar': 'حدد الدولة...',
    },
    'xzmsfmos': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'juub32s2': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '2kz1ke6g': {
      'en': 'Select university...',
      'ar': 'اختر الجامعة...',
    },
    'l32wp1ll': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9jxtnw0p': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'kkk7ctx4': {
      'en': 'Select category...',
      'ar': 'اختر الفئة...',
    },
    'twn9vl8l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ywmru18j': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '9nxrfakl': {
      'en': 'Select branch...',
      'ar': 'اختر الفرع...',
    },
    'dg6j6fi9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ra9dus5c': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '9sbhycci': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'o4qs4otc': {
      'en': 'What you will learn',
      'ar': 'ماذا سوف تتعلم',
    },
    'zm2l4uul': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '1yvt18sm': {
      'en': 'Course Requirement(one per line)',
      'ar': 'متطلبات الدورة (واحد لكل سطر)',
    },
    'emkjjq9r': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '3or8ztnn': {
      'en': 'Total Course Duration(hours)',
      'ar': 'إجمالي مدة الدورة (ساعات)',
    },
    '8j8dmjoh': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '74i0oeum': {
      'en': 'Total Number of Lessons',
      'ar': 'إجمالي عدد الدروس',
    },
    'skwbo8k6': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'z2mg1kyx': {
      'en': 'Student Limit',
      'ar': '',
    },
    'rmqwdr02': {
      'en': '',
      'ar': '',
    },
    'mjico8hh': {
      'en': 'Course Type',
      'ar': 'دورة كتابية',
    },
    'm107k31w': {
      'en': 'Free',
      'ar': 'حر',
    },
    'qkpekxb2': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'lxene8b5': {
      'en': 'Full Payment',
      'ar': '',
    },
    'nra22p9u': {
      'en': 'EMI Payment',
      'ar': '',
    },
    'xdvjnvxy': {
      'en': 'Full Price*',
      'ar': 'السعر الكامل',
    },
    'f2srjpr6': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    '57zq4bpf': {
      'en': 'First EMI Price*',
      'ar': 'سعر القسط الشهري الأول',
    },
    'ebn4xqy6': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    '3bgx0psp': {
      'en': 'Second EMI Price*',
      'ar': 'سعر القسط الشهري الثاني',
    },
    '6p67icgx': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    'ea4tm1c2': {
      'en': 'Third EMI Price*',
      'ar': 'سعر القسط الشهري الثالث',
    },
    'jq7lzwp4': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    'kn35rvn0': {
      'en': 'EMI\'s Notification Date',
      'ar': '',
    },
    'wuzsqtfs': {
      'en': 'Whatsapp Group Link',
      'ar': 'رابط مجموعة الواتساب',
    },
    'repas5zx': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    'y0j3xwy7': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '49vrfwm4': {
      'en': 'Select instructor*',
      'ar': 'اختر المدرب',
    },
    '8fxn52ch': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '4tee9iud': {
      'en': 'Add to LIst',
      'ar': 'أضف إلى القائمة',
    },
    'v23odnvs': {
      'en': 'None',
      'ar': '',
    },
    'c4afb5vp': {
      'en': 'Recommended',
      'ar': 'مُستَحسَن',
    },
    'rcbiqnbm': {
      'en': 'Featured',
      'ar': 'متميز',
    },
    '8wjnh2ot': {
      'en': '',
      'ar': '',
    },
    'apkwlheg': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'e7kuigm7': {
      'en': 'Batches',
      'ar': 'دفعات',
    },
    'ojivpmx5': {
      'en': 'Draft',
      'ar': 'مسودة',
    },
    'otned1yq': {
      'en': 'Publish',
      'ar': 'ينشر',
    },
    'g3w1s61i': {
      'en': 'Select batches...',
      'ar': 'حدد الدفعات...',
    },
    '7zupn6cz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '60mawn0z': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'fhg5jowq': {
      'en': 'Draft',
      'ar': 'مسودة',
    },
    'rn58bh2d': {
      'en': 'Publish',
      'ar': 'ينشر',
    },
    '64ove32m': {
      'en': 'Select branch...',
      'ar': 'اختر الفرع...',
    },
    '877pcie3': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'z84oludi': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    '10g00qfm': {
      'en': 'Remove Photo',
      'ar': 'يزيل',
    },
    'iletrxd7': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    'bzxzdqtx': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    '2pjjfjdq': {
      'en': 'Add Video',
      'ar': 'أضف فيديو',
    },
    'm2ezylky': {
      'en': 'Remove Video',
      'ar': 'يزيل',
    },
    'b6gvx4au': {
      'en': 'Remove Video',
      'ar': '',
    },
    'r4rl4s8y': {
      'en': 'Field is required',
      'ar': '',
    },
    'ht5ai3or': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jzt9olob': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'rulqjtcp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tfwlvyb6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    't2ykqzqv': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'txxd56d8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '36nygk00': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'u4n4leko': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '9aanmlyc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xbz7jhyr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'el8fqz9k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '764jzjwa': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'go2sr8i7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'nyh3l43s': {
      'en': 'Field is required',
      'ar': '',
    },
    '4hsgz5ib': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'q5n7ms31': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '87dy6cy1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'oyxdtlr9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7w5tr2n4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ypje2020': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gintm0br': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'x8e4deoe': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7v24atz4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '5binipua': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vs5o5yxh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'w28226cg': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '305n67mu': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '3m8ni089': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // UniversityFORM
  {
    '9jsrk52h': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    'voxan4r4': {
      'en': '',
      'ar': 'أدخل اسم الجامعة هنا ...',
    },
    'ircwihaz': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '7bjvm6he': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'vfgkj7yj': {
      'en': 'Remove',
      'ar': 'إضافة صورة',
    },
    '7lnpmgwf': {
      'en': 'Field is required',
      'ar': '',
    },
    'a7ak39u0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'x0t2yzio': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'mn9fpymk': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // CourseCategoryFORM
  {
    'accnoz91': {
      'en': 'Option 1',
      'ar': '',
    },
    'm1yd4pyh': {
      'en': 'Select country...',
      'ar': '',
    },
    '5jc3peyq': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'l775r61l': {
      'en': 'Option 1',
      'ar': '',
    },
    'b4b6w06i': {
      'en': 'Select university...',
      'ar': '',
    },
    't9rn1p6u': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'rlwpkbe2': {
      'en': 'Option 1',
      'ar': '',
    },
    'eo4zlbdq': {
      'en': 'Select category...',
      'ar': '',
    },
    '4bfd77uq': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'mva2iabe': {
      'en': 'Option 1',
      'ar': '',
    },
    'x80qkl7g': {
      'en': 'Select branch...',
      'ar': '',
    },
    '0xtmo8dh': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '1gspub0l': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'g0rtvz6l': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'pmrlukha': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'fypizz9v': {
      'en': 'Remove',
      'ar': 'إضافة صورة',
    },
    'kjtqggay': {
      'en': 'Field is required',
      'ar': '',
    },
    'eta9jmt9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ykij98ei': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'r335smeg': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'yiw4bcxu': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // University
  {
    'w9zj9j37': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'cl3gbvd7': {
      'en': 'List Category',
      'ar': 'فئة القائمة',
    },
    'jfuxi54d': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'cymhjzid': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '647dj3ry': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // CountryFORM
  {
    'cszleueh': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    '0kku7woc': {
      'en': '',
      'ar': 'أدخل اسم الدولة هنا ...',
    },
    'bxbae3tu': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '3hegb4el': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'tjq6f8so': {
      'en': 'Remove',
      'ar': 'إضافة صورة',
    },
    'jxw7gvwf': {
      'en': 'Field is required',
      'ar': '',
    },
    's6ndwje3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'eq1oon8f': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'lmzdq28t': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // BranchFORM
  {
    'fh2khz76': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    'r4jn0922': {
      'en': '',
      'ar': 'أدخل اسم الفرع هنا ...',
    },
    'byt9d8p9': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'x1f5t5hn': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'hzwdmvcv': {
      'en': 'Remove',
      'ar': 'إضافة صورة',
    },
    'oztn0fex': {
      'en': 'Field is required',
      'ar': '',
    },
    'xasv2bn9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'q5nyr1s5': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'k5tha8uo': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Branch
  {
    'c00lhw0n': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'c1c312sk': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    '4apf8hzs': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'hz7fjh88': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Country
  {
    'ogma68j2': {
      'en': 'Country List',
      'ar': 'قائمة الدول',
    },
    '3x4njtzj': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'auc7y3hr': {
      'en': 'List University',
      'ar': 'قائمة الجامعة',
    },
    '039zpo1l': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    '0l0e08ba': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'qqd2y2ei': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // ChapterFORM
  {
    '6kdqi0vq': {
      'en': 'Serial No.*',
      'ar': 'الرقم التسلسلي.',
    },
    '3aa3y02x': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'stlrua2g': {
      'en': 'First',
      'ar': 'أولاً',
    },
    'vpfrjdl9': {
      'en': 'Second',
      'ar': 'ثانية',
    },
    'lojr12ep': {
      'en': 'Third',
      'ar': 'ثالث',
    },
    '5r883i7w': {
      'en': 'Please select emi type...*',
      'ar': 'الرجاء التحديد...',
    },
    'b32vrdlp': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'npx61lxz': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'injtt61a': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'x4o0vqx6': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'eviygicf': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'xnqx7ddw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ze1vc4ku': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'di57h88d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'v6tkhvws': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bysfoxeh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '379bn20t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'o6mxvavw': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '0eagomq5': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '6qvf4r2b': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Lesson
  {
    'tk237msf': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'ubk1a33t': {
      'en': 'Course ',
      'ar': 'دورة',
    },
    'crsn9vt5': {
      'en': '> ',
      'ar': '>',
    },
    'o86zp902': {
      'en': '> ',
      'ar': '>',
    },
    'xzversux': {
      'en': 'Chapter ',
      'ar': 'الفصل',
    },
    '0ara6otz': {
      'en': '>',
      'ar': '>',
    },
    'i3uvxkgz': {
      'en': '> ',
      'ar': '>',
    },
    't6xd0e32': {
      'en': 'Lesson',
      'ar': 'درس',
    },
    'ofibjzai': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'hhbc51e8': {
      'en': 'Zoom Classes ',
      'ar': 'دروس التكبير',
    },
    'hos571b7': {
      'en': '__',
      'ar': '__',
    },
  },
  // LessonFORM
  {
    'lh2pkuo3': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'ubevjb52': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'mr44yd33': {
      'en': 'Description*',
      'ar': 'وصف',
    },
    'js39qccm': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'e1p88mwh': {
      'en': 'Free Preview',
      'ar': 'معاينة مجانية',
    },
    'edatx1mt': {
      'en': 'File Upload',
      'ar': '',
    },
    'fbysmzf3': {
      'en': 'Add',
      'ar': '',
    },
    'csiw5q07': {
      'en': 'Open',
      'ar': '',
    },
    '7h7polkk': {
      'en': 'Delete',
      'ar': '',
    },
    'l73orx4d': {
      'en': 'Enable download',
      'ar': '',
    },
    't8rvc56p': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'ue3abkt6': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'w9jk4ier': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    '247orjhi': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    '0z2roibr': {
      'en': 'Add ',
      'ar': 'يضيف',
    },
    '3knj36rd': {
      'en': 'Remove ',
      'ar': 'يزيل',
    },
    'iwu4hj3i': {
      'en': 'Remove Video',
      'ar': '',
    },
    'y6qe3zqq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'r97ylpsj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'llx61crh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'n8u4qmsa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'gnumeiou': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'y9ns38s0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ys7xbgdv': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '5ixeykrd': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'q3kuybss': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Meeting-BookingList
  {
    'dc8zohy6': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'mi12bado': {
      'en': 'Booking',
      'ar': 'الحجز',
    },
    'mo8pyjhu': {
      'en': 'Upcoming',
      'ar': 'القادمة',
    },
    'ev80r4l3': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    '7fupomrm': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'er4gdk3n': {
      'en': 'Session',
      'ar': 'حصة',
    },
    'y1nto6mx': {
      'en': 'User Details',
      'ar': 'بيانات المستخدم',
    },
    'gbi1m441': {
      'en': 'Remarks',
      'ar': 'ملاحظات',
    },
    'uyewf2ac': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'rjmmikv9': {
      'en': 'Session',
      'ar': 'حصة',
    },
    'g6m7sw6x': {
      'en': 'User Details',
      'ar': 'بيانات المستخدم',
    },
    'ie2r63dv': {
      'en': 'Remarks',
      'ar': 'ملاحظات',
    },
    'z403f33l': {
      'en': '__',
      'ar': '__',
    },
  },
  // Meeting-List
  {
    '9mnuq76h': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    '8xuh08qq': {
      'en': 'Meeting',
      'ar': 'مقابلة',
    },
    'wnv7eqpb': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    '266kdkp2': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'qeu2fk5y': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'ziuvfmvz': {
      'en': 'List of Days',
      'ar': 'قائمة الأيام',
    },
    '3cwz15cr': {
      'en': 'Limit',
      'ar': 'حد',
    },
    '4k8jhghl': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'eqk4gm5x': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '7zucoawx': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'm9lv1ziu': {
      'en': 'List of Days',
      'ar': 'قائمة الأيام',
    },
    '5cff0rwu': {
      'en': 'Limit',
      'ar': 'حد',
    },
    '8v389lc4': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'dh6p8g9o': {
      'en': 'Booking',
      'ar': 'الحجز',
    },
    'x2xzf141': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'ssid8twi': {
      'en': '__',
      'ar': '__',
    },
  },
  // Meeting-Editor
  {
    'jistndq0': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'khr0mo5u': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'rb0zg2ap': {
      'en': 'Limit',
      'ar': 'حد',
    },
    'jldi41lj': {
      'en': '',
      'ar': 'أدخل الحد هنا ...',
    },
    'zxvi269s': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'xdqvoury': {
      'en': 'Day List',
      'ar': 'قائمة اليوم',
    },
    'we13kalv': {
      'en': 'Sunday',
      'ar': 'الأحد',
    },
    'i10rmrsa': {
      'en': 'Monday',
      'ar': 'الاثنين',
    },
    '2yi6ennw': {
      'en': 'Tuesday',
      'ar': 'يوم الثلاثاء',
    },
    '9az6jdpb': {
      'en': 'Wednesday',
      'ar': 'الأربعاء',
    },
    'iaw70egs': {
      'en': 'Thursday',
      'ar': 'يوم الخميس',
    },
    'czcwg1th': {
      'en': 'Friday',
      'ar': 'جمعة',
    },
    '4w07pmw6': {
      'en': 'Saturday',
      'ar': 'السبت',
    },
    '6fdq03vi': {
      'en': 'Session List',
      'ar': 'قائمة الجلسة',
    },
    'km1kark2': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'tviqmjj9': {
      'en': 'Afternoon',
      'ar': 'بعد الظهر',
    },
    'imu1d9pn': {
      'en': 'Evening',
      'ar': 'مساء',
    },
    'h77r6owy': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'zx89tnxh': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'ibz9jlcw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8etprw3p': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '47nlyx7x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ql14msfg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ove4qet3': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'd1ybt9so': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '7lz9pts6': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Settings
  {
    'co5gahkx': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'ilmqu3yi': {
      'en': 'General',
      'ar': 'عام',
    },
    'rbgdcna3': {
      'en': 'General',
      'ar': 'عام',
    },
    'bqlahog1': {
      'en': 'Course',
      'ar': 'دورة',
    },
    '45p7axcb': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'bd0fid11': {
      'en': 'Onboard',
      'ar': 'صعد على متنها',
    },
    '8xuhisgh': {
      'en': 'Onboard',
      'ar': 'صعد على متنها',
    },
    'o7dy7u2t': {
      'en': 'Home',
      'ar': 'بيت',
    },
    '3tvsv4tc': {
      'en': 'Home',
      'ar': 'بيت',
    },
    'r7m3orws': {
      'en': 'Zoom',
      'ar': 'تكبير',
    },
    'ov8smg77': {
      'en': 'Zoom',
      'ar': 'تكبير',
    },
    'a6i8k9h2': {
      'en': 'Terms & Conditions',
      'ar': 'البنود و الظروف',
    },
    'sl2dx4se': {
      'en': 'Terms & Conditions',
      'ar': 'البنود و الظروف',
    },
    'iy79gytb': {
      'en': 'Bug Report',
      'ar': 'تقرير الشوائب',
    },
    'zh4xyr7l': {
      'en': 'Bug Report',
      'ar': 'تقرير الشوائب',
    },
    'xvyi0zpl': {
      'en': 'General Settings',
      'ar': 'الاعدادات العامة',
    },
    'ze7lsmma': {
      'en': 'Upload / Change Logo',
      'ar': 'تحميل / تغيير الشعار',
    },
    '8j38p5i6': {
      'en': '',
      'ar': '',
    },
    'z7esn8ef': {
      'en': '',
      'ar': '',
    },
    'hwwngtkk': {
      'en': 'Upload / Change Favicon',
      'ar': 'تحميل / تغيير الرمز المفضل',
    },
    'epwc50b8': {
      'en': '',
      'ar': '',
    },
    'yn0lz5nv': {
      'en': '',
      'ar': '',
    },
    'xktj7wbr': {
      'en': 'Enable Social Login',
      'ar': 'تمكين تسجيل الدخول الاجتماعي',
    },
    'x2ar58u0': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '0bb98bsm': {
      'en': 'No',
      'ar': 'لا',
    },
    '0q2oug6j': {
      'en': 'Enable Phone Login',
      'ar': 'تمكين تسجيل الدخول عبر الهاتف',
    },
    'rqeazoy2': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'wx2tbpvw': {
      'en': 'No',
      'ar': 'لا',
    },
    'mr910co7': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'xqwym2xb': {
      'en': 'GMap Link',
      'ar': 'رابط جي ماب',
    },
    'ohzriw9r': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '17oo7jz1': {
      'en': 'Phone No',
      'ar': 'رقم الهاتف',
    },
    '8arjdwuq': {
      'en': 'WhatsApp No',
      'ar': 'رقم الواتس اب',
    },
    'm8ho5xkl': {
      'en': 'Facebook',
      'ar': 'فيسبوك',
    },
    'bmidwz75': {
      'en': 'Instagram',
      'ar': 'انستغرام',
    },
    'fx83orqu': {
      'en': 'LinkedIn',
      'ar': 'ينكدين',
    },
    'loj81k2t': {
      'en': 'SMS Character Limit',
      'ar': '',
    },
    '3eyidwvj': {
      'en': 'Enter maximum character limit',
      'ar': 'أدخل الحد الأقصى لعدد الأحرف',
    },
    'y3sazcdx': {
      'en': 'Email Recipient',
      'ar': '',
    },
    '8wjga068': {
      'en': 'Enter email address',
      'ar': '',
    },
    'ebtwkmif': {
      'en': 'Enable in-App Purchases',
      'ar': '',
    },
    'p31z061q': {
      'en': 'Course Settings',
      'ar': 'إعدادات الدورة',
    },
    'i0zc19gt': {
      'en': 'Enable Wishlist',
      'ar': 'تمكين قائمة الرغبات',
    },
    'fr2syyam': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'rue6jswy': {
      'en': 'No',
      'ar': 'لا',
    },
    'c9a7njli': {
      'en': 'Enable Recommended List',
      'ar': 'تمكين القائمة الموصى بها',
    },
    'cpj3b7eo': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '8gxir9ci': {
      'en': 'No',
      'ar': 'لا',
    },
    'uqyticci': {
      'en': 'OnBoard Settings',
      'ar': 'إعدادات على متن الطائرة',
    },
    'l1imekio': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'i1qxchrj': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    '61n1ujpj': {
      'en': 'Upload / Change Logo',
      'ar': 'تحميل / تغيير الشعار',
    },
    '4vr2s704': {
      'en': '',
      'ar': '',
    },
    '7y4apzps': {
      'en': '',
      'ar': '',
    },
    'uvgt0x77': {
      'en': 'Do you want to replace Title with Logo?',
      'ar': 'هل تريد استبدال العنوان بالشعار؟',
    },
    'pgrty9wr': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'c085quif': {
      'en': 'No',
      'ar': 'لا',
    },
    'kajxc9t3': {
      'en': 'Do you want to hide Background Image ',
      'ar': 'هل تريد إخفاء صورة الخلفية',
    },
    'cidi640u': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'eynwk69z': {
      'en': 'No',
      'ar': 'لا',
    },
    '1z2cdj6t': {
      'en': 'Select background colour here',
      'ar': 'حدد لون الخلفية هنا',
    },
    'dkgjc8ab': {
      'en': 'Set Colour',
      'ar': 'ضبط اللون',
    },
    'hn9n496d': {
      'en': '',
      'ar': '',
    },
    'u1n5c2yd': {
      'en': 'Upload / Change Background Image',
      'ar': 'تحميل / تغيير صورة الخلفية',
    },
    '46yqhfn1': {
      'en': 'Home',
      'ar': 'بيت',
    },
    '2o45b0o6': {
      'en': 'Enable Category',
      'ar': 'تمكين استكشاف الفئة',
    },
    'jg54ov9j': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'suvmpm38': {
      'en': 'No',
      'ar': 'لا',
    },
    'ks9b270x': {
      'en': 'Enable Featured Courses',
      'ar': 'تمكين أفضل الدورات',
    },
    'zxuhavcm': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'd0x9sa6u': {
      'en': 'No',
      'ar': 'لا',
    },
    'vvltsgqp': {
      'en': 'Slider',
      'ar': 'المنزلق',
    },
    '505hguwx': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '8pisxdp8': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'rdwq1uuq': {
      'en': 'Button Text',
      'ar': 'زر كتابة',
    },
    'ohj6gjho': {
      'en': 'Upload / Change Video',
      'ar': 'تحميل / تغيير الفيديو',
    },
    '5q0feg7e': {
      'en': '',
      'ar': '',
    },
    'fd0ufilt': {
      'en': 'App URLs',
      'ar': 'عناوين URL للتطبيقات',
    },
    'n2snkuo0': {
      'en': 'Android',
      'ar': 'ذكري المظهر',
    },
    'cf6cg1dm': {
      'en': 'IOS',
      'ar': 'دائرة الرقابة الداخلية',
    },
    'sw3pkbed': {
      'en': 'About Section 1',
      'ar': 'حول القسم 1',
    },
    'fmlc76q4': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'x8rb74t7': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    '130b1jgl': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'di506r2k': {
      'en': 'Upload / Change Image',
      'ar': 'تحميل / تغيير الصورة',
    },
    'mnb7ohnb': {
      'en': '',
      'ar': '',
    },
    'kkqjxknm': {
      'en': 'Setup your Zoom Integration',
      'ar': 'قم بإعداد تكامل Zoom الخاص بك',
    },
    '8vxruvuo': {
      'en': 'Email ID',
      'ar': 'عنوان الايميل',
    },
    '441pg7wa': {
      'en': '',
      'ar': 'أدخل معرف البريد الإلكتروني المسجل الخاص بك تكبير ...',
    },
    't3bcdo92': {
      'en': 'API Key',
      'ar': 'مفتاح API',
    },
    'w5xhtyia': {
      'en': '',
      'ar': 'أدخل معرف البريد الإلكتروني المسجل الخاص بك تكبير ...',
    },
    '1o3o23mv': {
      'en': 'Secret Key',
      'ar': 'المفتاح السري',
    },
    'a6qx9ky4': {
      'en': '',
      'ar': 'أدخل رمز jwt الخاص بك هنا ...',
    },
    '7g18ndw1': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'c4cr41gg': {
      'en': 'Terms & Conditions',
      'ar': 'البنود و الظروف',
    },
    'z9oui7k2': {
      'en': 'Terms & Conditions',
      'ar': 'البنود و الظروف',
    },
    'u35axsfr': {
      'en': '',
      'ar': '',
    },
    'smr31nbi': {
      'en': 'Bug Report',
      'ar': 'تقرير الشوائب',
    },
    'ivomfwaj': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    '5215te5p': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'e57fgj1g': {
      'en': 'Issue',
      'ar': 'مشكلة',
    },
    'jwc1y5dx': {
      'en': 'Screenshot',
      'ar': 'لقطة شاشة',
    },
    'm81ewn1c': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'f9c1zplg': {
      'en': '__',
      'ar': '__',
    },
  },
  // BugReport
  {
    '4948z3r3': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    '7ci7zv2w': {
      'en': 'Bug Report',
      'ar': 'تقرير الشوائب',
    },
    '5v3zruzs': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    'wj7onycl': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '9nwu830t': {
      'en': 'Issue',
      'ar': 'مشكلة',
    },
    'r6nrm6vz': {
      'en': 'Screenshot',
      'ar': 'لقطة شاشة',
    },
    '3pz33nw6': {
      'en': 'Action',
      'ar': 'فعل',
    },
    't56gwnpy': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    '0pyw8ek1': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'uqana5ta': {
      'en': 'Issue',
      'ar': 'مشكلة',
    },
    'bq71ir64': {
      'en': 'Screenshot',
      'ar': 'لقطة شاشة',
    },
    'bj10hvup': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'mrwi9l4y': {
      'en': '__',
      'ar': '__',
    },
  },
  // Edit_user
  {
    '3gialzex': {
      'en': 'Edit User',
      'ar': 'تحرير العضو',
    },
    'bgud9ou9': {
      'en': 'Reinstate User',
      'ar': '',
    },
    'ud51s1bx': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
    },
    'v31jcait': {
      'en': 'Block',
      'ar': 'حاجز',
    },
    '6vla2joi': {
      'en': 'Reason',
      'ar': 'سبب',
    },
    '9jf2fi3b': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
    },
    'f0owo2ul': {
      'en': 'Middle Name',
      'ar': 'الاسم الأوسط',
    },
    '22069jqy': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
    },
    '53npn1hm': {
      'en': 'Your Email',
      'ar': 'بريدك الالكتروني',
    },
    'jynnku9w': {
      'en': '',
      'ar': '',
    },
    '8zetoh27': {
      'en': 'Admin',
      'ar': 'مسؤل',
    },
    'uhqe6nj8': {
      'en': 'Instructor',
      'ar': 'مدرب',
    },
    'yoptuao1': {
      'en': 'Student',
      'ar': 'طالب',
    },
    'fx362iqu': {
      'en': 'Role...',
      'ar': 'دور...',
    },
    '4mepyuf6': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'sx4c6czo': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'em6b1wg6': {
      'en': '',
      'ar': 'أدخل رقم الهاتف',
    },
    'asj2xc1x': {
      'en': 'Verification',
      'ar': 'تَحَقّق',
    },
    't8zexw5s': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    '0b6z24oj': {
      'en': 'Email verified',
      'ar': '',
    },
    '4cvdadia': {
      'en': 'Email not verified',
      'ar': '',
    },
    'm8mgobdr': {
      'en': 'Admin profile',
      'ar': '',
    },
    'mmrqvxvi': {
      'en': 'Instructor profile',
      'ar': '',
    },
    'zw0uy6pd': {
      'en': 'Skip Phone Verification',
      'ar': '',
    },
    'ry3jjnqz': {
      'en': 'Order History',
      'ar': 'تاريخ الطلب',
    },
    'su6vmlgp': {
      'en': 'Order ID',
      'ar': 'رقم التعريف الخاص بالطلب',
    },
    'kvsp7hsd': {
      'en': 'Order Date',
      'ar': 'تاريخ الطلب',
    },
    '9aupblsa': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'ecaddd55': {
      'en': 'Payment',
      'ar': 'قسط',
    },
    'cayowpxm': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'w54h155v': {
      'en': 'Enrollment History',
      'ar': 'تاريخ الالتحاق',
    },
    '60lh9mfq': {
      'en': 'Course Name',
      'ar': 'اسم الدورة التدريبية',
    },
    'xm6b6hue': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'w9e5ahpy': {
      'en': 'Order ID',
      'ar': 'رقم التعريف الخاص بالطلب',
    },
    'm7vb8jx0': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '9qdlpusv': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'zbhsdj1s': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Students
  {
    '0zzvo30p': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'ccjxgzvx': {
      'en': 'Enrolled Students',
      'ar': 'طلاب',
    },
    'z63zmhn7': {
      'en': 'SMS',
      'ar': 'رسالة قصيرة',
    },
    'e0hcpnpy': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'odxmfwtm': {
      'en': 'Email ID',
      'ar': 'عنوان الايميل',
    },
    'mg4odq2c': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'sxe5k04c': {
      'en': 'Verification',
      'ar': '',
    },
    'ttffjbgi': {
      'en': 'Order',
      'ar': 'رقم التليفون',
    },
    'affuj2tw': {
      'en': 'Payment Status',
      'ar': 'رقم التليفون',
    },
    '69dg5hh1': {
      'en': 'Action',
      'ar': '',
    },
    '47toa5zp': {
      'en': 'user@domainname.com',
      'ar': '',
    },
    'ry4jrdhp': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    'lrxehx1z': {
      'en': 'Email verified',
      'ar': '',
    },
    'ws5zsm2x': {
      'en': 'Email not verified',
      'ar': '',
    },
    'zkax3j6m': {
      'en': 'Admin profile',
      'ar': '',
    },
    'yikkw2k7': {
      'en': 'Instructor profile',
      'ar': '',
    },
    'b5ba7cxk': {
      'en': 'Delete',
      'ar': '',
    },
    't1tjppja': {
      'en': '__',
      'ar': '__',
    },
  },
  // Announcement
  {
    'wevha4l8': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'm5pvjumh': {
      'en': 'Announcement',
      'ar': 'إعلان',
    },
    'jhbiuwoe': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'dc2u5lzi': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'w8zxv5sb': {
      'en': 'Course ',
      'ar': 'دورة',
    },
    'tcfhr1ng': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'lxeboa5g': {
      'en': 'Summary',
      'ar': 'ملخص',
    },
    'do81spon': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'x53ar3di': {
      'en': 'user@domainname.com',
      'ar': 'user@domainname.com',
    },
    'oaxw5c55': {
      'en': '',
      'ar': '',
    },
    'rafzrvn0': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'zn4kekf6': {
      'en': 'Course ',
      'ar': 'دورة',
    },
    'oo72d0gj': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '4bnekra3': {
      'en': 'Summary',
      'ar': 'ملخص',
    },
    'zx4vk9sb': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'v5cm5e98': {
      'en': 'user@domainname.com',
      'ar': 'user@domainname.com',
    },
    'zecp5qjo': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'wa21qzjx': {
      'en': '',
      'ar': '',
    },
    'rx08nzh1': {
      'en': '__',
      'ar': '__',
    },
  },
  // AccouncementFORM
  {
    'wry2tcz0': {
      'en': 'Edit Announcement',
      'ar': 'تحرير إعلان',
    },
    'jbabq4yb': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    'mro2xklx': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    'bx8hca5i': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    '055dos8v': {
      'en': 'Select Course...',
      'ar': 'اختر الدورة...',
    },
    'jupmarcq': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'xdw5agom': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    'j05s34pt': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    '742i2k57': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    '5awb79bb': {
      'en': 'Select Course...',
      'ar': 'اختر الدورة...',
    },
    'n41cfp3o': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'xwni540g': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'gh350mbu': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    'zzg5o6fa': {
      'en': 'Summary*',
      'ar': 'ملخص',
    },
    '5qw16ks8': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '9lgo03ec': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2x7gtvbr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'rh9f1zkp': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'wh5o4jes': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'gmei33gb': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // InstructorSettings
  {
    'uyak4xxu': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    '5j1wte56': {
      'en': 'Profile',
      'ar': '',
    },
    '63tj7hdv': {
      'en': 'Profile',
      'ar': '',
    },
    '3kslgpc0': {
      'en': 'Zoom',
      'ar': '',
    },
    '7kehoc1c': {
      'en': 'Zoom',
      'ar': '',
    },
    'fsdh6wy9': {
      'en': 'Profile Settings',
      'ar': 'إعدادات الملف الشخصي',
    },
    '9z48oyxj': {
      'en': 'Upload / Change Photo',
      'ar': 'تحميل / تغيير الصورة',
    },
    'jjj4oh5o': {
      'en': '',
      'ar': '',
    },
    '39a4kg3b': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '8xbswdr3': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'olqkijml': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'n6719d10': {
      'en': 'Setup your Zoom Integration',
      'ar': 'قم بإعداد تكامل التكبير الخاص بك',
    },
    'um2l1giu': {
      'en': 'Email ID',
      'ar': 'عنوان الايميل',
    },
    'neal15c5': {
      'en': '',
      'ar': 'أدخل معرف البريد الإلكتروني المسجل الخاص بك تكبير ...',
    },
    '86lfjjs9': {
      'en': 'API Key',
      'ar': 'عنوان الايميل',
    },
    'ybsa9qcj': {
      'en': '',
      'ar': 'أدخل معرف البريد الإلكتروني المسجل الخاص بك تكبير ...',
    },
    'oc96inhd': {
      'en': 'Secret Key',
      'ar': 'JWT Token',
    },
    't2cqtk89': {
      'en': '',
      'ar': 'أدخل رمز jwt الخاص بك هنا ...',
    },
    'imsnyajq': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'akixf5i4': {
      'en': '__',
      'ar': '__',
    },
  },
  // Review
  {
    'gpjye4yr': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    '6es60uex': {
      'en': 'Reviews',
      'ar': 'المراجعات',
    },
    'xkcm56qd': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'xzb0y61l': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '4b64xwdq': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
    'cst6vm2t': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '1s3awnal': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'cd3ih1p5': {
      'en': '',
      'ar': 'يمسح',
    },
    'z5wkqi6x': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '0rju24vq': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'wgo14sai': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
    'vir786f6': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '84hw03rl': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'wa7lsyct': {
      'en': 'View',
      'ar': 'منظر',
    },
    '896zaweo': {
      'en': '',
      'ar': 'يمسح',
    },
    'znyi7svv': {
      'en': '__',
      'ar': '__',
    },
  },
  // InstructorRequest
  {
    'bmr7hoji': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'd62pnlwl': {
      'en': 'Instructor Request',
      'ar': 'طلب مدرس',
    },
    'xijwmeiz': {
      'en': 'Name',
      'ar': '',
    },
    '9drwsp59': {
      'en': 'Email ID',
      'ar': '',
    },
    'ejp6465v': {
      'en': 'Phone Number',
      'ar': '',
    },
    'bxa0y6ve': {
      'en': 'Account status',
      'ar': '',
    },
    'ss14b1nl': {
      'en': 'Approval',
      'ar': '',
    },
    '4sfwqrln': {
      'en': 'Approved By',
      'ar': '',
    },
    'ixpeqrt5': {
      'en': '-',
      'ar': '',
    },
    'fs9ju1x3': {
      'en': 'View',
      'ar': '',
    },
    '9n5hfgmi': {
      'en': 'View',
      'ar': '',
    },
    'ot0hh67a': {
      'en': '__',
      'ar': '__',
    },
  },
  // Zoom_classes
  {
    '75bxxl0f': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'c8pn1gl3': {
      'en': 'Course ',
      'ar': 'دورة',
    },
    'umspzqrf': {
      'en': '> ',
      'ar': '>',
    },
    '2t3rqtz1': {
      'en': '> ',
      'ar': '>',
    },
    '7grpnwer': {
      'en': 'Chapter ',
      'ar': 'الفصل',
    },
    '3ncokcf8': {
      'en': '> ',
      'ar': '>',
    },
    'db552kun': {
      'en': '> ',
      'ar': '>',
    },
    'd2tf4hkx': {
      'en': 'Lesson ',
      'ar': 'درس',
    },
    'y020a5kf': {
      'en': '> ',
      'ar': '>',
    },
    'gbaq2lb4': {
      'en': '> ',
      'ar': '>',
    },
    '3tjwmlq9': {
      'en': 'Zoom Class',
      'ar': 'فئة التكبير',
    },
    'vtiyf3pl': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'wmt3ef7i': {
      'en': 'Copy Link',
      'ar': 'نسخ الوصلة',
    },
    '46iz7whc': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'xn5groxl': {
      'en': 'Start Meeting',
      'ar': 'ابدأ الاجتماع',
    },
    'eox3zmjl': {
      'en': 'Send Email',
      'ar': '',
    },
    'g5pg06v7': {
      'en': '__',
      'ar': '__',
    },
  },
  // ZoomclassesFORM
  {
    'ojkn5slo': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'vxdx8qjs': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'ghqp2lyb': {
      'en': 'Duration(mins)*',
      'ar': 'المدة (دقيقة)',
    },
    '4y4090my': {
      'en': '',
      'ar': 'أدخل Duration time هنا (بالدقائق) ...',
    },
    'hhe4djsc': {
      'en': 'Summary',
      'ar': 'ملخص',
    },
    'u72qgwj7': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '7ay9bzqn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '9ew71esl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'iiyxrvap': {
      'en': 'Field is required',
      'ar': '',
    },
    'o1nbdqeh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'yhx01gjs': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6q60igex': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vkhij0kw': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '8a5ev4z3': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'p30g9gsg': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Poll
  {
    'at6axnmh': {
      'en': 'Poll',
      'ar': 'تصويت',
    },
    '45g6nwwz': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'dremcia5': {
      'en': 'Answer',
      'ar': 'إجابة',
    },
    'z64fyyg3': {
      'en': 'Delete',
      'ar': '',
    },
    '9zyaxavs': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'rvippjmg': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Poll_answer
  {
    'pc8lgxa6': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'tt4mtn0d': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'gaa0n7hn': {
      'en': '__',
      'ar': '__',
    },
  },
  // PollFORM
  {
    '49cjpnek': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    'd8013eh5': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    'w5uodm4c': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    'njxryl67': {
      'en': 'Select Course...*',
      'ar': 'اختر الدورة...',
    },
    'yy5gl74u': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9tzwk5gb': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    'qlf8mwq8': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    'e17k4fws': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    'hik91prj': {
      'en': 'Select Course...*',
      'ar': 'اختر الدورة...',
    },
    '8slp706s': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'q2w3ag9d': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'dv2l4b69': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'xjlty079': {
      'en': 'Description*',
      'ar': 'وصف',
    },
    'eqp72ea0': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'jwk0te4b': {
      'en': 'Question*',
      'ar': 'عنوان',
    },
    '9cj3pxcd': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'h706r1o2': {
      'en': 'End Date',
      'ar': 'تاريخ البدء',
    },
    '6292hl7j': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'kwscrp5m': {
      'en': 'Remove',
      'ar': 'إضافة صورة',
    },
    'rsv2kt7i': {
      'en': 'Field is required',
      'ar': '',
    },
    '5uisldfz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0h37tec4': {
      'en': 'Field is required',
      'ar': '',
    },
    'u0j3zttn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9mdnk4lf': {
      'en': 'Field is required',
      'ar': '',
    },
    '2awtqrrq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6f68d2az': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'dmfdgqmx': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'f7goanjb': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // PollAnswerFORM
  {
    'sqx6l8ys': {
      'en': 'Answer*',
      'ar': 'عنوان',
    },
    'oqfhz83i': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '2obegdby': {
      'en': 'Field is required',
      'ar': '',
    },
    'rgts1526': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9uh2qzvp': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'iyj2d1pj': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'olgpm5j2': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // AllReview
  {
    'gdtvxm4h': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'edce1d8v': {
      'en': 'All Reviews',
      'ar': 'جميع التقييمات',
    },
    'wf9iy6ir': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '1zj9s6w9': {
      'en': 'Course',
      'ar': 'دورة',
    },
    '8wsao2tk': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '6ttkpzbc': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
    'u62ylv9u': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'm2zyhwj4': {
      'en': 'Action',
      'ar': 'فعل',
    },
    '7ya823k0': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    '8618n08g': {
      'en': '',
      'ar': '',
    },
    'wozv1yt5': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    '055izhvk': {
      'en': '',
      'ar': '',
    },
    'nk302yom': {
      'en': '__',
      'ar': '__',
    },
  },
  // Batch-List
  {
    'j6hl0624': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'oqailj5z': {
      'en': 'Batch',
      'ar': 'حزمة',
    },
    'w8bral1f': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'gl8n2oz6': {
      'en': 'View Batch',
      'ar': 'عرض الدفعة',
    },
    'doyju55o': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'pd96dkgq': {
      'en': '__',
      'ar': '__',
    },
  },
  // Batch-CourseList
  {
    'majip3d0': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    '7e47kahl': {
      'en': '>',
      'ar': '>',
    },
    '11iszxaa': {
      'en': 'Ongoing Course List',
      'ar': 'قائمة الدورات المستمرة',
    },
    'dqcjuu1f': {
      'en': 'Archive',
      'ar': 'أرشيف',
    },
    'lpptdcbp': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'bjxeig5y': {
      'en': 'Archived Course List',
      'ar': 'قائمة الدورات المؤرشفة',
    },
    '6qfx8u7a': {
      'en': 'Ongoing',
      'ar': 'جاري التنفيذ',
    },
    'h9fd6ikl': {
      'en': 'Batch Details',
      'ar': 'تفاصيل الدفعة',
    },
    '4tl0jxir': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    '7wvo4fc4': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'olbvbgvf': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'rhscsg07': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'uj69i3b2': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '3rbvddrz': {
      'en': '__',
      'ar': '__',
    },
  },
  // Batch-Editor
  {
    '1xmqzbb8': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    '062o2rlx': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'jr9j9jin': {
      'en': 'Student Limit',
      'ar': 'اسم',
    },
    '89thyzqf': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'anqvdz2i': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'divduxua': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'unfy39y1': {
      'en': 'Start Date*',
      'ar': 'تاريخ البدء',
    },
    'g6sz9de4': {
      'en': 'End Date*',
      'ar': 'تاريخ الانتهاء',
    },
    'drmcfae6': {
      'en': 'Ongoing',
      'ar': 'جاري التنفيذ',
    },
    'a2mads7h': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    'aaq9ambq': {
      'en': 'Select status...',
      'ar': 'اختر الحالة...',
    },
    '5w1fr1ar': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'dlz3ygt9': {
      'en': 'Field is required',
      'ar': '',
    },
    '9quwqhrb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4e4iine1': {
      'en': 'Field is required',
      'ar': '',
    },
    'rmo3oc4f': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zra6yc6o': {
      'en': 'Field is required',
      'ar': '',
    },
    'oih4hyzl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7oexvywt': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    '37bonndz': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'qamf07bn': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'diw1aa6v': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '1nd8fgr9': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Batch-ChangeBatchStatus-Course
  {
    'hod88090': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Batch-ChangeBatch-SingleCourse
  {
    '17xsj4m7': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Batch-ChangeBatch-Course
  {
    'zo697zfq': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Coupon-Editor
  {
    'uuyn1pcp': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    '8tytzjsi': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'v6txiv9s': {
      'en': 'Discount',
      'ar': 'تخفيض',
    },
    'y3ll0tgt': {
      'en': 'Amount',
      'ar': 'كمية',
    },
    '67ap22b3': {
      'en': 'Select coupon type',
      'ar': 'اختر نوع القسيمة',
    },
    'q874jz05': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'tc2ka255': {
      'en': 'Coupon amount*',
      'ar': 'مبلغ القسيمة',
    },
    'h2gy9u4b': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'dfn3s731': {
      'en': 'Total usage limit*',
      'ar': 'حد الاستخدام الإجمالي',
    },
    'wzr8jid1': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'y8w68f9x': {
      'en': 'Minimum amount*',
      'ar': 'الحد الأدنى للمبلغ',
    },
    'q2f1i54m': {
      'en': '',
      'ar': '',
    },
    'kiug4lrb': {
      'en': 'Maximum amount*',
      'ar': 'الحد الأقصى للمبلغ',
    },
    'lfjrxwtm': {
      'en': '',
      'ar': '',
    },
    '2trfz0ot': {
      'en': 'Start Date*',
      'ar': 'تاريخ البدء',
    },
    '75y3v1tt': {
      'en': 'End Date*',
      'ar': 'تاريخ الانتهاء',
    },
    'k54k4p57': {
      'en': 'Enable Coupon',
      'ar': 'تمكين القسيمة',
    },
    'gar3o3lr': {
      'en': 'Select the courses',
      'ar': 'حدد الدورات',
    },
    'oxkbw363': {
      'en': 'Search here...',
      'ar': '',
    },
    'kkhek3wq': {
      'en': 'Field is required',
      'ar': '',
    },
    'z5qko9zy': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ndpux2vb': {
      'en': 'Field is required',
      'ar': '',
    },
    'wuvs2clx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hqei1ahl': {
      'en': 'Field is required',
      'ar': '',
    },
    'xuu5w895': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bjsh51e1': {
      'en': 'Field is required',
      'ar': '',
    },
    '934onnm2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kiij55ze': {
      'en': 'Field is required',
      'ar': '',
    },
    'sgy0lkxf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jphx67rv': {
      'en': 'Field is required',
      'ar': '',
    },
    'ti98blsm': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e4dq0xvf': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'sna1nss7': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '3pvsg0jp': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Coupon-List
  {
    'x6ge3s4q': {
      'en': 'Contracts',
      'ar': 'انكماش',
    },
    'ksumjnk1': {
      'en': 'Coupons',
      'ar': 'المراجعات',
    },
    'n4kx7x0o': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    't703subm': {
      'en': 'Name',
      'ar': '',
    },
    'gw1fqz9h': {
      'en': 'Coupon Type',
      'ar': '',
    },
    '2abzraw6': {
      'en': 'Coupon Amount',
      'ar': '',
    },
    'faizcdel': {
      'en': 'Usage / Limit',
      'ar': '',
    },
    '87ntom4f': {
      'en': 'Start Date',
      'ar': '',
    },
    'ye57e467': {
      'en': 'Expiry Date',
      'ar': '',
    },
    'y6fjclty': {
      'en': '__',
      'ar': '__',
    },
  },
  // Video-20_09Management
  {
    'h2fpm2ml': {
      'en': 'Media Management',
      'ar': '',
    },
    'bbhj9htl': {
      'en': ' > ',
      'ar': '',
    },
    'jcvglvfp': {
      'en': '> ',
      'ar': '',
    },
    '9jtzlff9': {
      'en': 'Folder name',
      'ar': '',
    },
    '71wlhjj1': {
      'en': 'Reload',
      'ar': '',
    },
    'jghettfj': {
      'en': 'Add',
      'ar': '',
    },
    'k72i4bvi': {
      'en': '__',
      'ar': '__',
    },
  },
  // Video-Editor
  {
    '3qdk18ka': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'qoa9fyfn': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'kz0hr1r3': {
      'en': 'Download',
      'ar': '',
    },
    'bq2wmm8k': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'ib7thi9f': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    '5luj0h7n': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'l9zd2a3t': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'rqfsuca8': {
      'en': 'Video Details',
      'ar': 'تفاصيل الفيديو',
    },
    'vrw82e2h': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    'd6yc2q6g': {
      'en': 'Date & Time',
      'ar': 'التاريخ والوقت',
    },
    'g7t1gbfu': {
      'en': 'Duration',
      'ar': 'مدة',
    },
    't1vnn70z': {
      'en': 'Remove',
      'ar': '',
    },
    'syb53dar': {
      'en': 'Update',
      'ar': '',
    },
    '9e1q7kfg': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ooh4dm21': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'txl3zj0i': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ry3xppij': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'yk7525pa': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'uhebsddi': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // BulkSMSMarketing
  {
    'y1r9wa7b': {
      'en': 'Bulk SMS Marketing',
      'ar': 'دورة',
    },
    '9rwltyyd': {
      'en': 'New',
      'ar': 'جديد',
    },
    '5ek6kpxm': {
      'en': 'Date',
      'ar': 'اسم',
    },
    'iwui3c6w': {
      'en': 'Message',
      'ar': 'تاريخ',
    },
    'bjk0z8nv': {
      'en': 'Status',
      'ar': 'مراجعة',
    },
    'vpmb6tmd': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'u761l125': {
      'en': 'View',
      'ar': 'منظر',
    },
    '3zo5e1be': {
      'en': '',
      'ar': 'يمسح',
    },
    'imouxp9h': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '6b3s1ua5': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // BulkSMSMarketingFORM
  {
    'rslw7q3g': {
      'en': 'Message',
      'ar': 'رسالة',
    },
    'sec3mue4': {
      'en': '',
      'ar': '',
    },
    '6qgbmal9': {
      'en': 'Send Now',
      'ar': 'ارسل الان',
    },
    '8kc1oox0': {
      'en': '\"The maximum characters for SMS are 160.\"',
      'ar': '\"الحد الأقصى لعدد أحرف الرسائل القصيرة هو 160.\"',
    },
    'e5j084bc': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    'enwc34o9': {
      'en': 'Mobile',
      'ar': 'متحرك',
    },
    'mapfmaoo': {
      'en': 'Type',
      'ar': 'يكتب',
    },
    'vhnx3pv8': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'duulbiwj': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'rzzzpklg': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationCourse
  {
    '15kuloi8': {
      'en': 'Course',
      'ar': 'دورة',
    },
    '3md9ttxa': {
      'en': 'status',
      'ar': 'حالة',
    },
    'uuvi621b': {
      'en': 'Chapters',
      'ar': '',
    },
    '4cnei962': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'bhszzs2y': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationCourseFORM
  {
    'g6l974o3': {
      'en': 'English',
      'ar': 'English',
    },
    'wpzlroq9': {
      'en': 'English',
      'ar': 'English',
    },
    'naj9pymh': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    '6dro57zf': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'lh4disg9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '2tfzf4cs': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'ixpy2g2j': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'sfotqswy': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'oy0h5awt': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'qukp6uqb': {
      'en': '',
      'ar': 'أدخل العنوان الفرعي للدورة هنا ...',
    },
    'nsnv89ph': {
      'en': 'Description',
      'ar': 'وصف',
    },
    's9rmno6i': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '7yprmd07': {
      'en': 'What you will learn',
      'ar': 'ماذا سوف تتعلم',
    },
    'jt7mun45': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'tuv9vwv0': {
      'en': 'Course Requirement(one per line)',
      'ar': 'متطلبات الدورة (واحد لكل سطر)',
    },
    'i2qs0tcv': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '9s7w4m4k': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'r6egfu7n': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    's79vmr1l': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '7xdwxdf0': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'cjbgfjpv': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'i4ba8gtv': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'vxtitlzf': {
      'en': '',
      'ar': 'أدخل العنوان الفرعي للدورة هنا ...',
    },
    'unwpj0ao': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'xa5of124': {
      'en': '',
      'ar': 'أدخل العنوان الفرعي للدورة هنا ...',
    },
    'eksvd7pb': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'd9wfkefz': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'exmvvkl4': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '5mjaz4if': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'k60627ap': {
      'en': 'What you will learn',
      'ar': 'ماذا سوف تتعلم',
    },
    'xcblxc94': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'ly6e9xv0': {
      'en': 'What you will learn',
      'ar': 'ماذا سوف تتعلم',
    },
    'z6kwjn6e': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'ebd02n5c': {
      'en': 'Course Requirement(one per line)',
      'ar': 'متطلبات الدورة (واحد لكل سطر)',
    },
    'ksydpd7e': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'ygnjp8z5': {
      'en': 'Course Requirement(one per line)',
      'ar': 'متطلبات الدورة (واحد لكل سطر)',
    },
    '5io0che2': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '0noxvnm3': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    '9ttxh56p': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'hdk83jjc': {
      'en': '',
      'ar': '',
    },
    'ujxgoa7x': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'mu6dgoln': {
      'en': '',
      'ar': '',
    },
    'zsxzh607': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'xjjvgu2v': {
      'en': '',
      'ar': '',
    },
    '80mu86s3': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'sxu0bis5': {
      'en': '',
      'ar': '',
    },
    'lnzq3rf7': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'e4y3nz9g': {
      'en': '',
      'ar': '',
    },
    'w3fmltwq': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '146n5d1n': {
      'en': '',
      'ar': '',
    },
    'vo9ebm8n': {
      'en': 'What you will learn',
      'ar': 'ماذا سوف تتعلم',
    },
    '642yqnb4': {
      'en': '',
      'ar': '',
    },
    'cip4pfjq': {
      'en': 'What you will learn',
      'ar': 'ماذا سوف تتعلم',
    },
    'iy832eo9': {
      'en': '',
      'ar': '',
    },
    'giwmrbf7': {
      'en': 'Course Requirement(one per line)',
      'ar': 'متطلبات الدورة (واحد لكل سطر)',
    },
    'ixozl9qf': {
      'en': '',
      'ar': '',
    },
    '69q9effs': {
      'en': 'Course Requirement(one per line)',
      'ar': 'متطلبات الدورة (واحد لكل سطر)',
    },
    'a7w5bko7': {
      'en': '',
      'ar': '',
    },
    'axd6k9xn': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'oq01770x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0h04368c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'q3ho598n': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'htiokd0g': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ulq1143u': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gm2sj9ik': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hbisseup': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'f8mo6lbs': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8x090ic8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '86zfc71i': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8ex2rxr8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'tm65zpxu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'j6umjokj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'zvx2em2y': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xphj3dna': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'w8yi6b0t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'd3le64xu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2jjhakw6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1wcm3mir': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'mmk4f29v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ffli4hln': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ydfktlew': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xwrdv6ne': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'zjrlxwim': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1nqs4q0w': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '3qht3rnl': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationChapterFORM
  {
    'n7el8kuo': {
      'en': 'Chapter',
      'ar': 'الفصل',
    },
    'dalwbh87': {
      'en': 'English',
      'ar': 'English',
    },
    'lgekbk2r': {
      'en': 'English',
      'ar': 'English',
    },
    'jb847y1a': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'ti1w883m': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'bbzdd3mj': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'i65nvo2a': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'qp632zm5': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'sjwcv1tm': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'n89kjnhv': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '6sy2ckzl': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '63ouzsxw': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'hod9fm6y': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'gf2jrumk': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'rxkwisk7': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ay773iia': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '07yj3sdz': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'efoixlcv': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '4550e64a': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'cel8zg7c': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'mmmxw9gr': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    '0dpohcqi': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'cjyduq2t': {
      'en': '',
      'ar': '',
    },
    'or91z0j5': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'nieyfgud': {
      'en': '',
      'ar': '',
    },
    'x6xv6beq': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'ev3nv9ad': {
      'en': '',
      'ar': '',
    },
    'ltm871mi': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'x660nddr': {
      'en': '',
      'ar': '',
    },
    'q3c57u7i': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'udzi33j0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'dwi5eohn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't9ggu5g5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'hgqfk5gf': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xqzcwh3z': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'nhhwonbo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1kt02wve': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'h5ytt1g7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'mind8m0a': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'eclg1fm8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '7s4uncjo': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '73asx101': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '76ys2x5h': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2kkxwdln': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'p63lza8x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vdzyq4qh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'kj07vtfx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'czwgfgu7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '2yh16dic': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '9hvry5t7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '7017vwwv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'z21405tq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'kuysqmu2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fw08uljz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hdu7sak1': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '38havm4i': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationLessonFORM
  {
    '1d78gl9l': {
      'en': 'Lesson',
      'ar': 'درس',
    },
    '6hgd2twf': {
      'en': 'English',
      'ar': 'English',
    },
    '8ec0i258': {
      'en': 'English',
      'ar': 'English',
    },
    'cdeq57lg': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'vsq8yuc1': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'hrdtwmnr': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'apzcx66g': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'w05uclo6': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'za9bfzvm': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'k8ex0fdx': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'zv9w6ofm': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'iyloijqo': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'lujb62dd': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'jyn88uam': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '5h31cg42': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'q66q6pp3': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'la39fwmo': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '17wtd2oz': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'k3dwj1c8': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'wih8a766': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'd129wv89': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'qvklftno': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '4tqcivbb': {
      'en': '',
      'ar': '',
    },
    '5el3sxl1': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'frm0d084': {
      'en': '',
      'ar': '',
    },
    'kfnhvw5n': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'dm8z1cmb': {
      'en': '',
      'ar': '',
    },
    '5w41sqzf': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '6tkkmzlo': {
      'en': '',
      'ar': '',
    },
    '9tmnf4mj': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'etapzw34': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'q3oo7r1z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ukgujbhf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'h8k2ioxx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'x42h8k7w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'lnnvfalc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '9jmjtkxe': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '1dz2s5x2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'km8ylzbl': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '9bac86km': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'go4dacxr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0ekcz25v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wou0d054': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ssywqzem': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '6v7intir': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'z7o8c7fn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'w2abcz4d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'xqhrkmuo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '9c3kt4nk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'zbmovxm3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'zh6ercjt': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '4meujn38': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'yod422c2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5j9ufbcr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8fpl8zca': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'hwhdcecr': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationZoomLessonFORM
  {
    'zdfkn3t7': {
      'en': 'Zoom Lesson',
      'ar': 'درس التكبير',
    },
    'f245ypu7': {
      'en': 'English',
      'ar': 'English',
    },
    '3n7t33ek': {
      'en': 'English',
      'ar': 'English',
    },
    '2p2wnzlf': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'g6iixxcj': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'm8ykc3xs': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'tmhed7u8': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'frw6cgsu': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '3r2ul0iw': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '3me7qr0c': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '6bn9hnug': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'vvl3zf1o': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'hkq7i0re': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ksq8mjzr': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '9en99u6w': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'j6e9y0hu': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '6xzx151j': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'xl1tq88b': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'tnd5wgn9': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'xyqh7uaw': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'qo3t5wn7': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'sixq9z7k': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'mviglxpu': {
      'en': '',
      'ar': '',
    },
    'uubrsfim': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'vztfknvv': {
      'en': '',
      'ar': '',
    },
    'bir3za6k': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'pzqmlr9x': {
      'en': '',
      'ar': '',
    },
    'mlykwwlm': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'grcfysqv': {
      'en': '',
      'ar': '',
    },
    '6zijzdwo': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'r8o07e3t': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'aymopcyb': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'v2mck6i8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '1h5tzqls': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'cllwvlkf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ojie2uyz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'n1n7yj90': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'dq0v0h6k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vohaef73': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'w349wj02': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'mybmi29l': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vsfx3fqs': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3md95riv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yit09f8v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'km8fdd64': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'n6id2kh8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hspo5miv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'hrfv9kci': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'k57oh7ij': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7ig03grx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'n1dau4nu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'wxgusagg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '320khnpj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    't6o38pd2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'l3fi1fae': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '659fisz4': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationAnnouncementFORM
  {
    '78ketoqp': {
      'en': 'Announcement',
      'ar': 'إعلان',
    },
    'ymt6upxe': {
      'en': 'English',
      'ar': 'English',
    },
    '1hisyupp': {
      'en': 'English',
      'ar': 'English',
    },
    'nc64gaq2': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'xr8eqjqk': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'tur748nz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'g8cug9u2': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'th6r70st': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'wja6jjlw': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'ympxg888': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'oyiyxmsj': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'yxxi8225': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'yd3gw2we': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'qox9bpxo': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'e65maxhn': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'pa3hpi1v': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'f1r1io7r': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'pxxsmblc': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'ma8zann4': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'o3zrgsd4': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'es6dx50r': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'cpabgmjw': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '6xprxccf': {
      'en': '',
      'ar': '',
    },
    'ble92jtr': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '0j9bh60e': {
      'en': '',
      'ar': '',
    },
    'jt7w1jdl': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'jii1rby4': {
      'en': '',
      'ar': '',
    },
    '021bf5qd': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '79uwj8ve': {
      'en': '',
      'ar': '',
    },
    'n5ugc6bn': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'nk3saq0n': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gmvhmttg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'r3iwg3sw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'mc1mlcb6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8stxt0rc': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qago5bqc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ojda7eem': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '837nfwsj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4qfwwo8v': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'tq57rnrw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'm8zfb1b9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6niebx3o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wbc7r52x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vaguvnv6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'x150rnma': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    't9ieslfq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'iy8t28lu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '05lpd7tt': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '02qjdbqk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'rxitapmx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '5rctn1p0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yo2tgwj7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '99iges51': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'lhrshmd8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '378f00ka': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'ynrrvx8v': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationCourseCategoryFORM
  {
    'jsj90vuu': {
      'en': 'Course Category',
      'ar': 'فئة الدورة',
    },
    't7zlzab0': {
      'en': 'English',
      'ar': 'English',
    },
    '9v4zyx61': {
      'en': 'English',
      'ar': 'English',
    },
    '7zmtgote': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    '0f806wch': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'a1wneks3': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ltp4ks5g': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'lafkekx6': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '29rqo23a': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'xvo5m07w': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'x2ct26e8': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'zrhaur53': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'bifmrarp': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '1541edik': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'r9oaaoum': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'dfm34z63': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ygmfynh6': {
      'en': '',
      'ar': '',
    },
    'bbdzxh2o': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '38w8iqfg': {
      'en': '',
      'ar': '',
    },
    '0mjpq45z': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '0y1j3sqs': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5vqx4bgm': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qxjgsi5z': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ye5vi76y': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'sv5e1puu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'hnerg8v3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'i70do0hj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2lh3wqwz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4p6ile4g': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '1m9jqry3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'x2ry3pq8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6qh955i7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tmqcuy5k': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'xx9xsnq2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '720t80io': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'f27q4us8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3e4b1ylp': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'cl6gbkre': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3l185ho0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'e48h3lvp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'w42y13ww': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'aw909eyf': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'byno28eu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8o75z6dl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ivewf2rh': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '0dkcya6a': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationCategory
  {
    'u3bzat69': {
      'en': 'Course Category',
      'ar': 'فئة الدورة',
    },
    '9awwv7ib': {
      'en': 'status',
      'ar': 'حالة',
    },
    'n9kvfo2j': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'u153b5d1': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationMeetingFORM
  {
    '56z2ko2j': {
      'en': 'Meeting',
      'ar': 'مقابلة',
    },
    'z1ftyaqi': {
      'en': 'English',
      'ar': 'English',
    },
    'rjv3ql2k': {
      'en': 'English',
      'ar': 'English',
    },
    '5yydfyrn': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'wwiv8s6c': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'r4p9c53n': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'c3mltizy': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'xwvgr2f5': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'uknid3jx': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'erzeewb2': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'ts9qg3fk': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'zpoxcsmd': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'liu7r868': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'mj6fy02i': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'jrcbym4m': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'yma5ik84': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'zeq675um': {
      'en': '',
      'ar': '',
    },
    '2yinldqm': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'y2mpwzy5': {
      'en': '',
      'ar': '',
    },
    '0dmo26pg': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'tk5le4a1': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'e6ykzxrn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'giky7dze': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'dkrn1qfg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'jm91u31x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'zft7f6yi': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '52qslcq8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'dx0uk7k1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'kyp1l1np': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6f6hmk4r': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '39x0cevg': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7zf0ztca': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qh1pyo55': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5tid9jdr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'djq2aegf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vp59phlc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'rie30rbn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6eodd2wu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '9baqmyju': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'cnrdplcd': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'c94onuyf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8uhdqjen': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'a0nps9jk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'xse9l86x': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ao0hmd51': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'd8wvid9o': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationPollFORM
  {
    'l9eisq9v': {
      'en': 'Poll',
      'ar': 'تصويت',
    },
    'd2zbyjhy': {
      'en': 'English',
      'ar': 'English',
    },
    'vh93w3h1': {
      'en': 'English',
      'ar': 'English',
    },
    'x19z0z5q': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'e3jdaot8': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'rqx7ki9j': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '48stlmo4': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    '4tvsafph': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'nspgdu7a': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'kswd2l65': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'v2vt9d5v': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'g13guajg': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'yae8z1id': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '1enf4oxl': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'tvfkadwp': {
      'en': 'Bio',
      'ar': 'السيرة الذاتية',
    },
    'uyb1kkri': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'br65e19i': {
      'en': 'Question',
      'ar': 'سؤال',
    },
    'cpwo1g3q': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'xw2q0miv': {
      'en': 'Question',
      'ar': 'سؤال',
    },
    'fvttuzqk': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'yj40lev4': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'xpppobgp': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ia0komg5': {
      'en': '',
      'ar': '',
    },
    'hnzboavc': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ibtj40oj': {
      'en': '',
      'ar': '',
    },
    'tbqgx4d4': {
      'en': 'Bio',
      'ar': 'السيرة الذاتية',
    },
    '63z5pwix': {
      'en': '',
      'ar': '',
    },
    'mc562ojp': {
      'en': 'Bio',
      'ar': 'السيرة الذاتية',
    },
    'j41nc79g': {
      'en': '',
      'ar': '',
    },
    'e11faf1u': {
      'en': 'Question',
      'ar': 'سؤال',
    },
    '122sdevc': {
      'en': '',
      'ar': '',
    },
    'xqdlnezr': {
      'en': 'Question',
      'ar': 'سؤال',
    },
    'cubpi4ol': {
      'en': '',
      'ar': '',
    },
    'txj3f2jx': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'wqs2ngny': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'k8101nf3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'nynskfkf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'osawpta4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wlqgwtw6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qzv0q5f5': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '0fvisb62': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'm9k3az0d': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hwi79oom': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'k15go8sb': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't6l37jyg': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    't83akblf': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'yafajiiy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'rg0v8go4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3emfcr64': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'n9etjmnb': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'd3b2fkdl': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'mgfvh44e': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qsu6us2x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'q4kw9qez': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'g2rjpjmr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'nntrcmky': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'pkzrezjz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'xxdbbs4k': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'e3mi0eex': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    't4dff7tf': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationPollAnswerFORM
  {
    '4xbtb3l3': {
      'en': 'Poll Answer',
      'ar': 'إجابة الاستطلاع',
    },
    'k3yzlhre': {
      'en': 'English',
      'ar': 'English',
    },
    '3v3ucmey': {
      'en': 'English',
      'ar': 'English',
    },
    'mz54937x': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'h8xnj5d0': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'xi5tydex': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9eejfpnw': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'gayc76zs': {
      'en': 'Answer',
      'ar': 'إجابة',
    },
    '6s2uzjk9': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'yo5gleiy': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'h1fadsdr': {
      'en': 'Answer',
      'ar': 'إجابة',
    },
    'dom8svgj': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '13py5ahw': {
      'en': 'Answer',
      'ar': 'إجابة',
    },
    'qrhuowpj': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    't6c2n2jf': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    '548c7xpx': {
      'en': 'Answer',
      'ar': 'إجابة',
    },
    'v3lp0m0d': {
      'en': '',
      'ar': '',
    },
    '0sjb8itl': {
      'en': 'Answer',
      'ar': 'إجابة',
    },
    'uup6251o': {
      'en': '',
      'ar': '',
    },
    '47l1gaam': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '84deapm1': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'q4foil80': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wedjx7l1': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '4dy6eyij': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'd591n69e': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ci5rfj1h': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'gl1ov5q2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'i0b93cj5': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'p6uet6yj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'bipn1eg4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '31yuthoh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6gpgbnpp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'noqey9v6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '9k1tckzp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hx4252bo': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '52tfz5zp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'rp0qxb2a': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'kmwml28w': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ed5bwsgn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '935qqode': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4wz8cqo6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5xfefhq1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'c5ot6xkw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '68j4d45m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'f45qdujp': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'knr7gfof': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationBatchFORM
  {
    '6jrh5kaf': {
      'en': 'Batch',
      'ar': 'حزمة',
    },
    '4b4j3m7y': {
      'en': 'English',
      'ar': 'English',
    },
    'uj59sctm': {
      'en': 'English',
      'ar': 'English',
    },
    'v6hibqw3': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'ernecrom': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    '6m0d3t0n': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'xm5zbahp': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    '31mk7ugz': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'go61bv2p': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'yduz1d7n': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '6bzxxrt3': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '89wzjj8r': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'qc16mmtl': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'grd3d891': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '0theoo5z': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ltp0a4ed': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'duaanwep': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'jp8r09pq': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'fudfmvic': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'crhy54tr': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'zmmf5fv0': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'm5h2g2yu': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    't4n4tk6s': {
      'en': '',
      'ar': '',
    },
    'uhdvsph6': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'gintv3r5': {
      'en': '',
      'ar': '',
    },
    'u23mwoim': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'x1t9w5xk': {
      'en': '',
      'ar': '',
    },
    '8hx1kv8s': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'q3qxol7p': {
      'en': '',
      'ar': '',
    },
    'nddo7w3e': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '3zr8k8z9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'l7isve7c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'rrea5lmo': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fa4tpm8z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'l8ak2gl5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6uvi1s58': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hm9g00cz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0y6rrkee': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8a5c0l3k': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yxlmymc1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'pte9xppi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'cmgnkzqp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'b4jf1n19': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '1t09u92m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'sro1kr2j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'bkbau6su': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'r5jwkogn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8j9fk62o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1izlk0o7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'mfknbs6q': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'txxeun8t': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vkgvaajy': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'efz162w3': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'c60hth4r': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4qo9e16f': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '8oe46xd4': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationCountryFORM
  {
    '301emdxe': {
      'en': 'Country',
      'ar': 'دولة',
    },
    '0d3g1g6f': {
      'en': 'English',
      'ar': 'English',
    },
    'o41dyjkr': {
      'en': 'English',
      'ar': 'English',
    },
    'ddvpz4ay': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    '1777535z': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    '84dyrlu9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'n8rc2giv': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'zfet14se': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'iz400gfa': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'vt8nl51h': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'me5aetjn': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '9scl0s8c': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'jtocuqaj': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '52m3fkqd': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'y384wtn8': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'gq2dbwf8': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '8vnce7kp': {
      'en': '',
      'ar': '',
    },
    'riqomxs3': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'q0r9lrdf': {
      'en': '',
      'ar': '',
    },
    'rv3czr04': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'mv96zw7c': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'spu4i32m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '7nd7gaw4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'dct9kbdl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bfpgauhm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'nn82hzq2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'nnsrvhhc': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0as5pq43': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'yz4vu3ic': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    's4ebqo8l': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'm7so5os6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'k16mmgio': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'fsvf4mps': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'rm5u0g8c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8o1ztr6w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yrbf042p': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'kgn1ia74': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '96hg7zum': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wbm8wren': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yel73xg7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hj37667v': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'x1ianuuu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '6qiayhkz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vzhidtdm': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    's6hymwgg': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '2g9tspd6': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationUniversityFORM
  {
    '6zj5yd2b': {
      'en': 'University',
      'ar': 'جامعة',
    },
    '3u47kos5': {
      'en': 'English',
      'ar': 'English',
    },
    'sljt8uib': {
      'en': 'English',
      'ar': 'English',
    },
    'clik4a1j': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'vppcrpma': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    '6dqk98rb': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'f51rjsjn': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'g0zmhhu0': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'jdzunu4t': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '25j5um4x': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'jpd5et7f': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '53q3v5be': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'l5n9ih0x': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '6igl34cv': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'gnrnqqgp': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'fsf10oel': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '9vaafjsn': {
      'en': '',
      'ar': '',
    },
    'cau795wj': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'dv9f0fr5': {
      'en': '',
      'ar': '',
    },
    '0wm8mwbi': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'hnsw5hit': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qavhdcju': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'l745tlo6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'hu64ql9c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ijf9h7j5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '10jnak7s': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'x79nhj26': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'xo0cwn72': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ur4i4q3c': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ojkakzqj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qahvkrg7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'c2x8go69': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'kmlt24wn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '76qfbmlk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '2t77117j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '473m8bjh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'dyo49ckf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'hpqo5dlx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'rvoub9ex': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qrkytziq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'f6hoh5pw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '71vywsmy': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'g5wm0elu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'lrclec66': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '6g2czpxn': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'twboon1z': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationBranchFORM
  {
    'irj307li': {
      'en': 'Branch',
      'ar': 'فرع',
    },
    'tn2163x6': {
      'en': 'English',
      'ar': 'English',
    },
    'xap1nt8e': {
      'en': 'English',
      'ar': 'English',
    },
    'afhu08zn': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    '7tz2ni03': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'fcfhpz2e': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'v8izgf7l': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'tayzgxqf': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '7vi9zugf': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '4j7ynnu2': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'fcy7yt34': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'bpjt162i': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '915sdeax': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'zndg9hjy': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'usw283ho': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'g82nmgho': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'i8m6016n': {
      'en': '',
      'ar': '',
    },
    'ht58l8p7': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'vn6r5boi': {
      'en': '',
      'ar': '',
    },
    '5qzyc6qu': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '35un39ig': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'x4q54l1w': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'zltfjo2o': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yivjlfml': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '7ozjlr2a': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '3xem6yo9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qw1n4jv0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gidm7z7j': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'surypkro': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vkyurfdc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't1jybnst': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'abld92k1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vovy0w8c': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fqw90rda': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vztjbboh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6fia5a89': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'am7aeytf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '50t6ol0c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'kp0jfr8r': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ih7i2ao5': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '6axjt5an': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'kzxarrit': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qcgc9it6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'butok2ij': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'c8xntdk1': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'oyldjlg5': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationSettingFORM
  {
    'jv2s5fs6': {
      'en': 'Setting',
      'ar': 'جلسة',
    },
    '2a3v1eba': {
      'en': 'English',
      'ar': 'English',
    },
    '7ej3fgv7': {
      'en': 'English',
      'ar': 'English',
    },
    '6d3w3gkh': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    '5hklzl6x': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    's1n8h5t3': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'fxtvym57': {
      'en': 'About Section',
      'ar': 'حول القسم',
    },
    'mpaxhite': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'sdnolu80': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'dwzzucgm': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'g1jbzn4t': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'sb9k9eyz': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'f0gj9nfp': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '86wbr3oe': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    's9qflfdq': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'lqo6mgdz': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'v3jeuwy4': {
      'en': '',
      'ar': '',
    },
    'bw4w5y44': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ftud2ecn': {
      'en': '',
      'ar': '',
    },
    'a2yptmma': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'ji86740n': {
      'en': '',
      'ar': '',
    },
    'iviodau7': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    '8f8jgmfc': {
      'en': '',
      'ar': '',
    },
    'dgo4z7oj': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'y00kayy5': {
      'en': '',
      'ar': '',
    },
    'sszc2twm': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '0ud3eq4e': {
      'en': '',
      'ar': '',
    },
    '0oio7sot': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'yg6nso0r': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '78k6hvrq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'r5u0rszn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ou03tylm': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'oqbs6bd1': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'piyykhmh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'z2ofrpx5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'khz6bzjs': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ysd4o0pk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'p0gx90ff': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bzida5a9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'phk23w7v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4rfplg2k': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '4mv7adfp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't4n95sqm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'tzlz2igc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'dd6ghsdy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'i7z4bl19': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3hcaht9b': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qcifvcpz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'exw2ddar': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0teeylco': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'dbs4zrym': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5q9khf4e': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'l2ox5mjj': {
      'en': 'General Section',
      'ar': 'القسم العام',
    },
    'euivh651': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'uoh285f6': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    '4fe946vu': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '81qkzmlq': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'h8pw3s74': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'r272zxn9': {
      'en': '',
      'ar': '',
    },
    'rjwyp31b': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'knyf91ls': {
      'en': '',
      'ar': '',
    },
    'poch32km': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '5npvt7s2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'tl22rmv2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'axxj18jn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8oaagsh1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1tybtvla': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5rt2aqbn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '14r5451u': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'z7wg8szn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'er4eqfvm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ej1n15cp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'borj4rhk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5bkncfv4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8dovi6tf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '05jxd41g': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hge40hrv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'j2rcmu4r': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'yrbj13nq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'zrkpwqau': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'glurlkve': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0m8xycon': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'a3jke21a': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '3sfpy66g': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hy5w89dq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ja0mpxhg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'uzk6199t': {
      'en': 'Home Slider Section',
      'ar': 'قسم المنزلق المنزلق',
    },
    'gv9k2hcn': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'eurc4kbp': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'pe07pmyq': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'hpt1omhk': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'gb1hw3gx': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'hg4mc11r': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    '7qvfkit5': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'l8v5wjsy': {
      'en': '',
      'ar': '',
    },
    'mw8ldnix': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'ype72jpm': {
      'en': '',
      'ar': '',
    },
    '3ipfgxr3': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'th97lgx9': {
      'en': '',
      'ar': '',
    },
    'a79pmvqz': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    '68w5cwud': {
      'en': '',
      'ar': '',
    },
    'dsm5cjxu': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '5ru3odvi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'r5yisfee': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'pory871l': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ncwpjv8t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hjhycwal': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '3opxon4g': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '7buostn6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qmyrb4v6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ltq4l4ef': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'iir9qcss': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '9whmecuv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'xc6c0xkl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'x9bwqnsd': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vdpfh947': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ab10s08w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'adnlsv09': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bhqfdbdl': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8a9ic47n': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hsiph7xb': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'n5o5zldq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'sp19t790': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5huiqsna': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'btip9d3x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2mp969is': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vjdgeu9s': {
      'en': 'Onboard Section',
      'ar': 'قسم على متن الطائرة',
    },
    'j50v3huz': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'l9ojwc6p': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '43yh5p5d': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'sr2mcub3': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'fxjceb8e': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'vq83a851': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    '84b78x0p': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'y05l0qyx': {
      'en': '',
      'ar': '',
    },
    'zvk6xhwx': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'tk3thnzh': {
      'en': '',
      'ar': '',
    },
    'roe4h8fc': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    '3dm03mlk': {
      'en': '',
      'ar': '',
    },
    'daidfspg': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    'usg9ifj4': {
      'en': '',
      'ar': '',
    },
    'moyvqrfv': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'wbzjcg3v': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '70ivm2o6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '6lfy45yx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'dvda6x43': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '04tb7iw4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'kfzngaj1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3ohaa66s': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '58mue3ee': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '93nxx7u5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'x9r4k7jz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'capceb70': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '05hj7oha': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vbgewyc4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'z5cawomu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'pvlwguab': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '93o76hrg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '38chke21': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'smhquyga': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'pd0op1xr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2txxoiok': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hi4chap0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'iunh6upn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vk7ge6fq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7fnkamkj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'am9gdbu7': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'v0il4lgs': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationChapter
  {
    'qjx2mntu': {
      'en': 'Chapter',
      'ar': 'دورة',
    },
    'oedzjc7r': {
      'en': 'View Lesson',
      'ar': 'عرض الدرس',
    },
    'o48qqxts': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'psm0zgqo': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationMeeting
  {
    '02sp69r5': {
      'en': 'Meeting',
      'ar': 'مقابلة',
    },
    'jppzidbn': {
      'en': 'status',
      'ar': 'حالة',
    },
    'rvv2r1zg': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'nl7kyiex': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationCountry
  {
    '60ucsvbu': {
      'en': 'Country',
      'ar': 'دولة',
    },
    '2udz79j2': {
      'en': 'status',
      'ar': 'حالة',
    },
    'mtapx3xd': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '43e59uq6': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationUniversity
  {
    'vjvk21op': {
      'en': 'University',
      'ar': 'جامعة',
    },
    '6yedltaj': {
      'en': 'status',
      'ar': 'حالة',
    },
    'nev8cuts': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '5r42ott1': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationBranch
  {
    'xbjgi0hc': {
      'en': 'Branch',
      'ar': 'فرع',
    },
    'szuv5apx': {
      'en': 'status',
      'ar': 'حالة',
    },
    'le65rgty': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'y47fanuy': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationBatch
  {
    '27ehv1ne': {
      'en': 'Batch',
      'ar': 'حزمة',
    },
    'f47wp1eg': {
      'en': 'status',
      'ar': 'حالة',
    },
    'ct97hbjn': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'yb47ztmu': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Translation-PollList
  {
    'xu37qryf': {
      'en': 'Poll',
      'ar': 'تصويت',
    },
    '34i490b6': {
      'en': 'Answer',
      'ar': 'إجابة',
    },
    'lvd5ihxz': {
      'en': 'status',
      'ar': 'حالة',
    },
    'vgdpivx8': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'a5sni6cl': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationLesson
  {
    '8m1pianp': {
      'en': 'Lesson',
      'ar': 'دورة',
    },
    'e6muuee7': {
      'en': 'View Zoom Lesson',
      'ar': 'شاهد درس التكبير',
    },
    '1vsb7fsn': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'u2z6vwt9': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationZoomLesson
  {
    'y75as3wh': {
      'en': 'Zoom Lesson',
      'ar': 'دورة',
    },
    'icpy6gq3': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'symaf23b': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationAnnouncement
  {
    '2lp70ikn': {
      'en': 'Announcement',
      'ar': 'دورة',
    },
    '5xy1othl': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'goriv1kj': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationPollAnswer
  {
    'jbcqvt41': {
      'en': 'Poll Answer',
      'ar': 'دورة',
    },
    '5agzc9pf': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'drx68ir5': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Category
  {
    'f7onuxhh': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    '86fxzewz': {
      'en': 'List Branch',
      'ar': 'فرع القائمة',
    },
    'rc2vg1c5': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    '28xchmhn': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'd3gunfvs': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // CategoryFORM
  {
    'y66qygd9': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    'ngakqd32': {
      'en': '',
      'ar': 'أدخل اسم الفرع هنا ...',
    },
    'hryh4h5i': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'u9ns0ucw': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    '6gls6jyd': {
      'en': 'Remove',
      'ar': 'إضافة صورة',
    },
    'b4yqgvgt': {
      'en': 'Field is required',
      'ar': '',
    },
    'izdwkf8v': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'brgdcrjv': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'y9zc2fwa': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // translationMainCategory
  {
    'f9qqsa27': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'to60riyj': {
      'en': 'status',
      'ar': 'حالة',
    },
    'q36cg5my': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'ykib3vic': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // TranslationMainCategoryFORM
  {
    '9fz2m9g2': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'i7k7pb5t': {
      'en': 'English',
      'ar': 'English',
    },
    'mldaa91g': {
      'en': 'English',
      'ar': 'English',
    },
    'nitxm6zq': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'o6yx9ktx': {
      'en': 'Select Language...',
      'ar': 'اختار اللغة...',
    },
    'kln8pepj': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '0a6tirn5': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'fa09wkhl': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'nyu3bav2': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'neyza56y': {
      'en': 'Automated',
      'ar': 'الآلي',
    },
    'zq4w6y52': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'v9slsaav': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'mtznlgnp': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'fb3ipiig': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '5z287ksg': {
      'en': 'Manual',
      'ar': 'يدوي',
    },
    'gjazbasa': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'lz74k35l': {
      'en': '',
      'ar': '',
    },
    'ljpvn230': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'rx3bptwk': {
      'en': '',
      'ar': '',
    },
    'knc9s2s6': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'flelgew9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'mlr4y7z0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bti3cigb': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'osjo8akc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vb3gms08': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'optvtf99': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bivgreru': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gxuug3jw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bobxllq0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '1u5hz35o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    's2j8mhkl': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '20ccfy4n': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qkhgk1d6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fzd25dr9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4e1oynz9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2lgu8rb8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'jrokw5v9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vqvguyj9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'fjltmn4d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'notsld0r': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wsvizrrh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'w8sn1jg3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hfy9yrnk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '90azx66s': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'e994c997': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'dcf8vmks': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // BulkSMSForm
  {
    'yskmy7ej': {
      'en': 'Message',
      'ar': 'رسالة',
    },
    'n9zyp04a': {
      'en': '',
      'ar': '',
    },
    'i8pvlipn': {
      'en': 'Send Now',
      'ar': 'ارسل الان',
    },
    'r1tb9fr1': {
      'en': '\"The maximum characters for SMS are 160.\"',
      'ar': '\"الحد الأقصى لعدد أحرف الرسائل القصيرة هو 160.\"',
    },
    'egay1zhw': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    '2o2j7l73': {
      'en': 'Mobile',
      'ar': 'متحرك',
    },
    'vt1heq4r': {
      'en': 'Type',
      'ar': 'يكتب',
    },
    'lnnzkqtm': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'w71biyoz': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'idsurpz2': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // CourseFORMCopy
  {
    'ei5sv9jq': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '4hbwdene': {
      'en': 'Course',
      'ar': 'دورة',
    },
  },
  // Report-Revenue
  {
    'aregxy30': {
      'en': 'Report',
      'ar': '',
    },
    '03bcpn4z': {
      'en': 'Reset',
      'ar': '',
    },
    'xrixqw0r': {
      'en': 'Revenue',
      'ar': '',
    },
    'u917y7ml': {
      'en': 'Date',
      'ar': '',
    },
    'pvp0tizm': {
      'en': 'Orders',
      'ar': '',
    },
    'mhamg8ul': {
      'en': 'Gross Sales',
      'ar': '',
    },
    'wae8ld52': {
      'en': 'Returns',
      'ar': '',
    },
    'c7igd80p': {
      'en': 'Coupons',
      'ar': '',
    },
    'mt960fvw': {
      'en': 'Net Sales',
      'ar': '',
    },
    'mgpxsd21': {
      'en': 'Total Sales',
      'ar': '',
    },
    'd31jkguc': {
      'en': '0 KWD',
      'ar': '',
    },
    '4uaty3ic': {
      'en': '5 ',
      'ar': '',
    },
    'qqpbfhy8': {
      'en': 'Days',
      'ar': '',
    },
    'a4e6vq1f': {
      'en': '5 ',
      'ar': '',
    },
    'nex390jz': {
      'en': 'Orders',
      'ar': '',
    },
    'kaihd31l': {
      'en': '800 KWD ',
      'ar': '',
    },
    'bhl4fwqy': {
      'en': 'Gross Sales',
      'ar': '',
    },
    'dq6c6cnx': {
      'en': 'Dashboard',
      'ar': '',
    },
    'urr4z7p1': {
      'en': 'Purchase',
      'ar': '',
    },
  },
  // Report-Sales
  {
    '3pxqt3ni': {
      'en': 'Report',
      'ar': '',
    },
    'x0nou88j': {
      'en': 'Reset',
      'ar': '',
    },
    'zqxh621k': {
      'en': 'Filter',
      'ar': '',
    },
    '1p8opqqn': {
      'en': 'Sales Report',
      'ar': '',
    },
    'xgoxn4rb': {
      'en': 'Date',
      'ar': '',
    },
    'vrzgo3yt': {
      'en': 'Order ID',
      'ar': '',
    },
    'tioixycl': {
      'en': 'Status',
      'ar': '',
    },
    '7ymldynm': {
      'en': 'Customer',
      'ar': '',
    },
    'px7vajed': {
      'en': 'Course(s)',
      'ar': '',
    },
    'gibsjuh1': {
      'en': 'Item Sold',
      'ar': '',
    },
    '87dygq7l': {
      'en': 'Net Sales',
      'ar': '',
    },
    '2jhwyurq': {
      'en': '5',
      'ar': '',
    },
    'tl6itgom': {
      'en': 'Customers',
      'ar': '',
    },
    '637x7qm7': {
      'en': '5',
      'ar': '',
    },
    'zbj7jnon': {
      'en': 'Orders',
      'ar': '',
    },
    'v48a4gbr': {
      'en': 'Dashboard',
      'ar': '',
    },
    '4p9vawgk': {
      'en': 'Purchase',
      'ar': '',
    },
  },
  // Order-Single
  {
    'hbp3jug5': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'rh0q44nv': {
      'en': 'Course',
      'ar': '',
    },
    'fj1ucf5o': {
      'en': 'Batch',
      'ar': '',
    },
    'sud529qo': {
      'en': 'Payment Type',
      'ar': '',
    },
    '3pga9asj': {
      'en': 'Price',
      'ar': '',
    },
    'tfqp2rct': {
      'en': 'Discount',
      'ar': '',
    },
    'u5797xhx': {
      'en': 'Total',
      'ar': '',
    },
    'utsn2gz5': {
      'en': 'Coupon Details',
      'ar': '',
    },
    'ehbmkx3k': {
      'en': 'Coupon Name',
      'ar': '',
    },
    'y6zpxjhi': {
      'en': 'Discount Type',
      'ar': '',
    },
    'lkq183bs': {
      'en': 'Coupon Amount',
      'ar': '',
    },
    'nl8p4uvd': {
      'en': 'Customer Details',
      'ar': '',
    },
    's2n7bszu': {
      'en': 'Customer Name',
      'ar': '',
    },
    'l1ieg8cs': {
      'en': 'Phone Number',
      'ar': '',
    },
    'uinqzuzc': {
      'en': 'Email ID',
      'ar': '',
    },
    'x2ioy1tc': {
      'en': 'Order Details',
      'ar': '',
    },
    'umunt2qr': {
      'en': 'AUTO PAY',
      'ar': '',
    },
    't2p96mbh': {
      'en': 'Manual',
      'ar': '',
    },
    '8kddnv29': {
      'en': 'Order ID',
      'ar': '',
    },
    'x18muukb': {
      'en': 'Transaction ID',
      'ar': '',
    },
    'bm429ef5': {
      'en': 'Status',
      'ar': '',
    },
    'dwsxygz1': {
      'en': 'Order Summary',
      'ar': '',
    },
    'p7r9jzqf': {
      'en': 'Order Created',
      'ar': '',
    },
    'jnwikgo7': {
      'en': 'Order Time',
      'ar': '',
    },
    '9s1ckwxi': {
      'en': 'Subtotal',
      'ar': '',
    },
    'z1h3b3ad': {
      'en': 'Coupon',
      'ar': '',
    },
    'jo3klkm3': {
      'en': 'Total',
      'ar': '',
    },
    '85btfhky': {
      'en': 'Order Status',
      'ar': '',
    },
    'y3uvot03': {
      'en': 'CAPTURED',
      'ar': '',
    },
    'paez4d2k': {
      'en': 'CANCELLED',
      'ar': '',
    },
    'jmfobiv6': {
      'en': 'Pending',
      'ar': '',
    },
    'dyfiwam3': {
      'en': 'Please select...',
      'ar': '',
    },
    'iplzkja5': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '5gri3w31': {
      'en': 'Save',
      'ar': '',
    },
    'uynsjr5k': {
      'en': 'Dashboard',
      'ar': '',
    },
    'b24131t1': {
      'en': 'Purchase',
      'ar': '',
    },
  },
  // Order-List
  {
    '9wcp1myw': {
      'en': 'Order',
      'ar': '',
    },
    'tgur3ez5': {
      'en': 'Paid',
      'ar': '',
    },
    'm1bxjfpt': {
      'en': 'Pending',
      'ar': '',
    },
    'bm2xzrfp': {
      'en': 'Failed',
      'ar': '',
    },
    '2tqo3y7c': {
      'en': 'ABANDONED',
      'ar': '',
    },
    'z52iwaif': {
      'en': 'CANCELLED',
      'ar': '',
    },
    '9nx5rqyd': {
      'en': 'CAPTURED',
      'ar': '',
    },
    '4udwh184': {
      'en': 'Select status...',
      'ar': '',
    },
    'en32g7hu': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'p1g5501v': {
      'en': 'Filter',
      'ar': '',
    },
    'e5mftkho': {
      'en': 'Reset',
      'ar': '',
    },
    'f5xnm7gh': {
      'en': 'Search...',
      'ar': '',
    },
    '0sy2eg6i': {
      'en': 'Order ID',
      'ar': '',
    },
    'yzncxtl2': {
      'en': 'Name',
      'ar': '',
    },
    '9pxhtgxq': {
      'en': 'Order Date',
      'ar': '',
    },
    'hn7q2h2m': {
      'en': 'Status',
      'ar': '',
    },
    'owa0hmj5': {
      'en': 'Total',
      'ar': '',
    },
    'lf7aamxj': {
      'en': 'Payment Method',
      'ar': '',
    },
    'f15k1ng7': {
      'en': 'Action',
      'ar': '',
    },
    '5nlgks2i': {
      'en': 'View',
      'ar': '',
    },
    'jpz02gbe': {
      'en': 'Order ID',
      'ar': '',
    },
    'yj9ofh65': {
      'en': 'Name',
      'ar': '',
    },
    '5fovuwg9': {
      'en': 'Order Date',
      'ar': '',
    },
    'sg3hgivf': {
      'en': 'Status',
      'ar': '',
    },
    's7ekl8ar': {
      'en': 'Total',
      'ar': '',
    },
    '2z70vkwp': {
      'en': 'Payment Method',
      'ar': '',
    },
    '98ctcc3i': {
      'en': 'Action',
      'ar': '',
    },
    '3gyi7y8c': {
      'en': 'View',
      'ar': '',
    },
    'yp023vs1': {
      'en': 'Order ID',
      'ar': '',
    },
    'mi99nw7c': {
      'en': 'Name',
      'ar': '',
    },
    '47hiuu5a': {
      'en': 'Order Date',
      'ar': '',
    },
    'g20oi2i9': {
      'en': 'Status',
      'ar': '',
    },
    'c58lz2vl': {
      'en': 'Total',
      'ar': '',
    },
    '3ln1tc0y': {
      'en': 'Payment Method',
      'ar': '',
    },
    'pvv0l2gy': {
      'en': 'Action',
      'ar': '',
    },
    '36yvb45o': {
      'en': 'View',
      'ar': '',
    },
    'l1foio4d': {
      'en': 'Order ID',
      'ar': '',
    },
    'ttvg76ny': {
      'en': 'Name',
      'ar': '',
    },
    'anq3jh0o': {
      'en': 'Order Date',
      'ar': '',
    },
    '8q22ytek': {
      'en': 'Status',
      'ar': '',
    },
    'xmfohmw4': {
      'en': 'Total',
      'ar': '',
    },
    'm7eov8dd': {
      'en': 'Payment Method',
      'ar': '',
    },
    'bphvavpr': {
      'en': 'Action',
      'ar': '',
    },
    '4kxw0x7i': {
      'en': 'View',
      'ar': '',
    },
    'q3ygeceb': {
      'en': 'Dashboard',
      'ar': '',
    },
    '3heoj3u8': {
      'en': 'Purchase',
      'ar': '',
    },
  },
  // ManualNotification-List
  {
    'hx4cdqy0': {
      'en': 'Manual Notification',
      'ar': '',
    },
    'xh3ejddz': {
      'en': 'Send',
      'ar': '',
    },
    'f0i0iqcz': {
      'en': 'Date',
      'ar': '',
    },
    'q67w72ei': {
      'en': 'Title',
      'ar': '',
    },
    'ulrsvn9v': {
      'en': 'Type',
      'ar': '',
    },
    'dypwfnc1': {
      'en': 'Action',
      'ar': '',
    },
    'u0lug80y': {
      'en': 'View',
      'ar': '',
    },
    '3r91jo22': {
      'en': '',
      'ar': '',
    },
    '6ypesui8': {
      'en': 'Customers',
      'ar': '',
    },
    'lyn1dil1': {
      'en': 'Course',
      'ar': '',
    },
  },
  // Users
  {
    'ahaow4b2': {
      'en': 'Contracts',
      'ar': '',
    },
    '56q0nwnf': {
      'en': 'Users',
      'ar': '',
    },
    '8dk3c3jt': {
      'en': 'Search...',
      'ar': '',
    },
    'nugsejal': {
      'en': 'Name',
      'ar': '',
    },
    's1phpgrh': {
      'en': 'Email ID',
      'ar': '',
    },
    'x0syj0ck': {
      'en': 'Phone Number',
      'ar': '',
    },
    '4ehjkqw5': {
      'en': 'Verification',
      'ar': '',
    },
    '2ul22odr': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    'zgs5t8z5': {
      'en': 'Email verified',
      'ar': '',
    },
    'psns4iyy': {
      'en': 'Email not verified',
      'ar': '',
    },
    '3dg3ej6h': {
      'en': 'Admin profile',
      'ar': '',
    },
    'snv6e7c0': {
      'en': 'Instructor profile',
      'ar': '',
    },
    'zz7xo0eq': {
      'en': 'Action',
      'ar': '',
    },
    'tv1ab44r': {
      'en': 'Edit',
      'ar': '',
    },
    '3vw56eox': {
      'en': 'Name',
      'ar': '',
    },
    '5vqr2hdw': {
      'en': 'Email ID',
      'ar': '',
    },
    '4wf3u873': {
      'en': 'Phone Number',
      'ar': '',
    },
    'napej8da': {
      'en': 'Verification',
      'ar': '',
    },
    '9kmhfv79': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    't74tue6a': {
      'en': 'Email verified',
      'ar': '',
    },
    'k22dpm7l': {
      'en': 'Email not verified',
      'ar': '',
    },
    'zmqq4cof': {
      'en': 'Admin profile',
      'ar': '',
    },
    'svmby9o9': {
      'en': 'Instructor profile',
      'ar': '',
    },
    '4u4th2kd': {
      'en': 'Action',
      'ar': '',
    },
    'r3m1z8x9': {
      'en': 'Edit',
      'ar': '',
    },
    'o2e5tqgg': {
      'en': 'Name',
      'ar': '',
    },
    'nbytljn2': {
      'en': 'Email ID',
      'ar': '',
    },
    'ol2spkm5': {
      'en': 'Phone Number',
      'ar': '',
    },
    '02wloy8u': {
      'en': 'Verification',
      'ar': '',
    },
    'g8n48lef': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    '16quoskk': {
      'en': 'Email verified',
      'ar': '',
    },
    'fglhx0rj': {
      'en': 'Email not verified',
      'ar': '',
    },
    'agkv8bhc': {
      'en': 'Admin profile',
      'ar': '',
    },
    'ry27zsfa': {
      'en': 'Instructor profile',
      'ar': '',
    },
    'midy1kr2': {
      'en': 'Action',
      'ar': '',
    },
    '3hoxnwyo': {
      'en': 'Edit',
      'ar': '',
    },
    'ru83kp5t': {
      'en': 'Name',
      'ar': '',
    },
    'hw6h7rxk': {
      'en': 'Email ID',
      'ar': '',
    },
    'zk6hvrfn': {
      'en': 'Phone Number',
      'ar': '',
    },
    'mnh6k4m7': {
      'en': 'Verification',
      'ar': '',
    },
    'iyficsr8': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    '7e0wkp7w': {
      'en': 'Email verified',
      'ar': '',
    },
    'tobwu8eh': {
      'en': 'Email not verified',
      'ar': '',
    },
    'lb7j4hto': {
      'en': 'Admin profile',
      'ar': '',
    },
    'b9nblwfu': {
      'en': 'Instructor profile',
      'ar': '',
    },
    'q2celp8b': {
      'en': 'Action',
      'ar': '',
    },
    'mlco7s6m': {
      'en': 'Edit',
      'ar': '',
    },
    'j7fq6g5u': {
      'en': 'Name',
      'ar': '',
    },
    't4cy593q': {
      'en': 'Email ID',
      'ar': '',
    },
    'mvyqbhdp': {
      'en': 'Phone Number',
      'ar': '',
    },
    'slrm2m6m': {
      'en': 'Verification',
      'ar': '',
    },
    'k6zxnhj2': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    'g2gy2ff3': {
      'en': 'Email verified',
      'ar': '',
    },
    'suv0ezcd': {
      'en': 'Email not verified',
      'ar': '',
    },
    'dhgcci0g': {
      'en': 'Admin profile',
      'ar': '',
    },
    'kzlup7d7': {
      'en': 'Instructor profile',
      'ar': '',
    },
    '6p5y40jr': {
      'en': 'Action',
      'ar': '',
    },
    'd4rmg5lv': {
      'en': 'Edit',
      'ar': '',
    },
    '6al54qpt': {
      'en': 'Name',
      'ar': '',
    },
    'rjouawm6': {
      'en': 'Email ID',
      'ar': '',
    },
    'kgyfyw70': {
      'en': 'Phone Number',
      'ar': '',
    },
    'jd6i440r': {
      'en': 'Verification',
      'ar': '',
    },
    '9vfgi3rz': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    'jv7zo0wj': {
      'en': 'Email verified',
      'ar': '',
    },
    '02tyvkbz': {
      'en': 'Email not verified',
      'ar': '',
    },
    '889kv4cn': {
      'en': 'Admin profile',
      'ar': '',
    },
    'ozpn72r5': {
      'en': 'Instructor profile',
      'ar': '',
    },
    '92wyb44y': {
      'en': 'Action',
      'ar': '',
    },
    'o8fqgnm4': {
      'en': 'Edit',
      'ar': '',
    },
    'vmiq87wm': {
      'en': 'Name',
      'ar': '',
    },
    '6unp8rr8': {
      'en': 'Email ID',
      'ar': '',
    },
    'a6xrgtn3': {
      'en': 'Phone Number',
      'ar': '',
    },
    'jh7wmtpf': {
      'en': 'Verification',
      'ar': '',
    },
    'n9zx0cca': {
      'en': 'Mobile number verified',
      'ar': '',
    },
    '4rynx8mc': {
      'en': 'Email verified',
      'ar': '',
    },
    'gnmcln1r': {
      'en': 'Email not verified',
      'ar': '',
    },
    '4kh7di3l': {
      'en': 'Admin profile',
      'ar': '',
    },
    'tvtvunhk': {
      'en': 'Instructor profile',
      'ar': '',
    },
    '01b6bubf': {
      'en': 'Action',
      'ar': '',
    },
    'k0m3ckrx': {
      'en': 'Edit',
      'ar': '',
    },
    'fn7c6ycd': {
      'en': '__',
      'ar': '',
    },
  },
  // Log-Session
  {
    'zkg157fp': {
      'en': 'Contracts',
      'ar': '',
    },
    'u4gllrel': {
      'en': 'User Session Log',
      'ar': '',
    },
    'gom3vwba': {
      'en': 'Filter',
      'ar': '',
    },
    'r6ayid1g': {
      'en': 'Reset',
      'ar': '',
    },
    'zw77y6c6': {
      'en': 'Name',
      'ar': '',
    },
    'zti6ln8x': {
      'en': 'Status',
      'ar': '',
    },
    'gqmo0ti5': {
      'en': 'Success',
      'ar': '',
    },
    'aldvom10': {
      'en': 'Login Time',
      'ar': '',
    },
    '37q0jje6': {
      'en': 'ID',
      'ar': '',
    },
    'kafscxxw': {
      'en': 'Device',
      'ar': '',
    },
    'zl6zejij': {
      'en': 'Action',
      'ar': '',
    },
    'v9izmwx6': {
      'en': 'View',
      'ar': '',
    },
    'aekeh198': {
      'en': 'Name',
      'ar': '',
    },
    'kbun7liz': {
      'en': 'Status',
      'ar': '',
    },
    'q373pcr1': {
      'en': 'Success',
      'ar': '',
    },
    'usd6pepo': {
      'en': 'Login Time',
      'ar': '',
    },
    '8sr37mdr': {
      'en': 'ID',
      'ar': '',
    },
    'f8yya11q': {
      'en': 'Device',
      'ar': '',
    },
    '0xm8obeh': {
      'en': 'Action',
      'ar': '',
    },
    'qgjwm3r8': {
      'en': 'View',
      'ar': '',
    },
    'sjku9j7x': {
      'en': '__',
      'ar': '',
    },
  },
  // Log-Email
  {
    '66ajsazx': {
      'en': 'Contracts',
      'ar': '',
    },
    'oha77w5m': {
      'en': 'Email Log',
      'ar': '',
    },
    '55t3n3dr': {
      'en': 'Subject',
      'ar': '',
    },
    'yh70czgz': {
      'en': 'To',
      'ar': '',
    },
    'xroxmrmq': {
      'en': 'Status',
      'ar': '',
    },
    'o7xe52h5': {
      'en': 'Date Sent',
      'ar': '',
    },
    '7qvn2h7z': {
      'en': 'Action',
      'ar': '',
    },
    'qs3js2yj': {
      'en': 'View',
      'ar': '',
    },
    'afbmrpq0': {
      'en': '__',
      'ar': '',
    },
  },
  // Log-EMINotification
  {
    'sh478m9m': {
      'en': 'Contracts',
      'ar': '',
    },
    'je3d1l8n': {
      'en': 'EMI Notification Log',
      'ar': '',
    },
    'wf6sv3iu': {
      'en': 'Username',
      'ar': '',
    },
    'y9lfty7x': {
      'en': 'Date',
      'ar': '',
    },
    'p8d02hj7': {
      'en': 'Course',
      'ar': '',
    },
    '93gliwt8': {
      'en': 'Second EMI',
      'ar': '',
    },
    'cfuuzajc': {
      'en': 'Third EMI',
      'ar': '',
    },
    'j8q0nehb': {
      'en': '__',
      'ar': '',
    },
  },
  // Log-Activity
  {
    'z4l78z4l': {
      'en': 'Contracts',
      'ar': '',
    },
    'hanm2beg': {
      'en': 'Activity Log',
      'ar': '',
    },
    'lsawfn2h': {
      'en': 'Archived',
      'ar': '',
    },
    '5aan44mv': {
      'en': 'Created',
      'ar': '',
    },
    '7vv7gys5': {
      'en': 'Deleted',
      'ar': '',
    },
    'ytevzofk': {
      'en': 'Modified',
      'ar': '',
    },
    'ceaf81u7': {
      'en': 'Select event type...',
      'ar': '',
    },
    'nlqtyzvr': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'nyms8otw': {
      'en': 'Branch',
      'ar': '',
    },
    'yaut5pkz': {
      'en': 'Category',
      'ar': '',
    },
    'o4fdiy33': {
      'en': 'Chapter',
      'ar': '',
    },
    'td2jd5lv': {
      'en': 'Country',
      'ar': '',
    },
    'smuuqbdh': {
      'en': 'Coupon',
      'ar': '',
    },
    'ukp6h6ht': {
      'en': 'Coures Category',
      'ar': '',
    },
    'xj22085v': {
      'en': 'Course',
      'ar': '',
    },
    'ga7z50ih': {
      'en': 'Course (Image)',
      'ar': '',
    },
    'tiwmydkn': {
      'en': 'Course (Video)',
      'ar': '',
    },
    '350jhxbk': {
      'en': 'Instructor Request',
      'ar': '',
    },
    'zxtcdi97': {
      'en': 'Lesson',
      'ar': '',
    },
    'tb9qv8pl': {
      'en': 'Meeting',
      'ar': '',
    },
    's7qa5w7m': {
      'en': 'Poll',
      'ar': '',
    },
    'eee7fkkt': {
      'en': 'Signin',
      'ar': '',
    },
    '9r3rthk5': {
      'en': 'University',
      'ar': '',
    },
    '5k0mtn7x': {
      'en': 'University (Image)',
      'ar': '',
    },
    'vmmw5a0p': {
      'en': 'User',
      'ar': '',
    },
    'nj6erx2i': {
      'en': 'Users',
      'ar': '',
    },
    'wnnik2ua': {
      'en': 'Zoom Lesson',
      'ar': '',
    },
    '0qtczhbz': {
      'en': 'Select object...',
      'ar': '',
    },
    '5fmpa5nd': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'v0mj0r8u': {
      'en': 'Filter',
      'ar': '',
    },
    'ny4u1hxa': {
      'en': 'Reset',
      'ar': '',
    },
    'qr696wlc': {
      'en': 'Severity',
      'ar': '',
    },
    'zz30goh4': {
      'en': 'Medium',
      'ar': '',
    },
    '2auec7vh': {
      'en': 'High',
      'ar': '',
    },
    'ofijiw52': {
      'en': 'Low',
      'ar': '',
    },
    'yhkicq4l': {
      'en': 'Name',
      'ar': '',
    },
    '3t3zs3rg': {
      'en': 'Date & Time',
      'ar': '',
    },
    'eos7kj0b': {
      'en': 'IP Address',
      'ar': '',
    },
    'hvuqsim4': {
      'en': 'Object',
      'ar': '',
    },
    'mx19wf5s': {
      'en': 'Action',
      'ar': '',
    },
    'qzh6z1yt': {
      'en': 'View',
      'ar': '',
    },
    '8botdw73': {
      'en': 'Severity',
      'ar': '',
    },
    '6th4hdnb': {
      'en': 'Medium',
      'ar': '',
    },
    'l2o2uqqk': {
      'en': 'High',
      'ar': '',
    },
    'kgvj0g7w': {
      'en': 'Low',
      'ar': '',
    },
    'gv8u16l2': {
      'en': 'Name',
      'ar': '',
    },
    'lwhl6zsw': {
      'en': 'Date & Time',
      'ar': '',
    },
    '444pa2a7': {
      'en': 'IP Address',
      'ar': '',
    },
    '3fn5vc0u': {
      'en': 'Object',
      'ar': '',
    },
    'gp7ls12j': {
      'en': 'Action',
      'ar': '',
    },
    'a99hqj3y': {
      'en': 'View',
      'ar': '',
    },
    'xs0f5azq': {
      'en': '__',
      'ar': '',
    },
  },
  // InstructorRequestBackup
  {
    'ac2hid0c': {
      'en': 'Contracts',
      'ar': '',
    },
    'nn7h7twf': {
      'en': 'Instructor Request',
      'ar': '',
    },
    'xyw7ibai': {
      'en': 'Name',
      'ar': '',
    },
    'fuqebjp7': {
      'en': 'Email ID',
      'ar': '',
    },
    'p30p3sas': {
      'en': 'Phone Number',
      'ar': '',
    },
    '8iaip723': {
      'en': 'Status',
      'ar': '',
    },
    'ejl2fgdz': {
      'en': 'Action',
      'ar': '',
    },
    'kawr8bw3': {
      'en': 'Name',
      'ar': '',
    },
    'pocpn2ms': {
      'en': 'Email ID',
      'ar': '',
    },
    'mnjvq9lg': {
      'en': 'Phone Number',
      'ar': '',
    },
    'uocjz4mm': {
      'en': 'Status',
      'ar': '',
    },
    'h3hchc4s': {
      'en': 'Action',
      'ar': '',
    },
    '8z11iyfu': {
      'en': '__',
      'ar': '',
    },
  },
  // Video-12_06_Management
  {
    'mvez58uj': {
      'en': 'Contracts',
      'ar': '',
    },
    'yp5im3mb': {
      'en': 'Media Management',
      'ar': '',
    },
    '8et5ilo2': {
      'en': 'Reload',
      'ar': '',
    },
    '2k2yvs18': {
      'en': 'Add',
      'ar': '',
    },
    'xeksq4zr': {
      'en': '__',
      'ar': '',
    },
  },
  // Video-02_09Management
  {
    '7kkcmuz9': {
      'en': 'Media Management',
      'ar': '',
    },
    'f19l3zl8': {
      'en': ' > ',
      'ar': '',
    },
    'azi4oego': {
      'en': '> ',
      'ar': '',
    },
    '9dweirce': {
      'en': 'Folder name',
      'ar': '',
    },
    'en137ant': {
      'en': 'Reload',
      'ar': '',
    },
    'paqz8w9c': {
      'en': 'Add',
      'ar': '',
    },
    'at0um5fj': {
      'en': '__',
      'ar': '',
    },
  },
  // Video-Management
  {
    '4gvp9hz0': {
      'en': 'Video',
      'ar': '',
    },
    'p01zpw5p': {
      'en': 'Folder',
      'ar': '',
    },
    'tjd78658': {
      'en': 'First',
      'ar': '',
    },
    '2hxfvji8': {
      'en': 'Back',
      'ar': '',
    },
    'igxfcbmg': {
      'en': 'Next',
      'ar': '',
    },
    '9en8pkvd': {
      'en': 'Last',
      'ar': '',
    },
    '8salvzsj': {
      'en': '__',
      'ar': '',
    },
  },
  // createCourse
  {
    'iiwwk7k8': {
      'en': 'Create Course',
      'ar': 'إنشاء دورة',
    },
    'mmhveadj': {
      'en': 'Add Image',
      'ar': 'أضف فيديو',
    },
    '6kxwi017': {
      'en': 'Remove',
      'ar': 'أضف فيديو',
    },
    'oft2bmz5': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    'zlkj5s8w': {
      'en': 'Add Video',
      'ar': 'أضف فيديو',
    },
    '0r0senyp': {
      'en': 'Remove Video',
      'ar': 'أضف فيديو',
    },
    'alnhfigo': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    '4idywxfb': {
      'en': '',
      'ar': 'أدخل اسمك هنا...',
    },
    '31vm9a3b': {
      'en': 'Subtitle',
      'ar': 'العنوان الفرعي',
    },
    'wozbwedu': {
      'en': '',
      'ar': 'أدخل العنوان الفرعي الخاص بك هنا ...',
    },
    '34683m5j': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '1wzu8zno': {
      'en': 'Select instructor*',
      'ar': 'مؤلف',
    },
    'qf1y0b5h': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    '56mrxhry': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '1gbmof6u': {
      'en': 'Select country...',
      'ar': 'حدد الدولة...',
    },
    'uldep11g': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    'ev2gv7dw': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '05iscnbt': {
      'en': 'Select university...',
      'ar': 'اختر جامعة ...',
    },
    'ev6tehhf': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    'trunhy3v': {
      'en': 'Option 1',
      'ar': '',
    },
    'xwp6lkpm': {
      'en': 'Select category...',
      'ar': '',
    },
    'a8tt7ien': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'z9fomzah': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'z8bywezt': {
      'en': 'Select branch...',
      'ar': 'حدد الفرع ...',
    },
    'qbsj9p4r': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    '6d24gmiu': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '1w1hlvu5': {
      'en': '',
      'ar': 'أدخل وصفك هنا ...',
    },
    'r2lpa6ea': {
      'en': 'What you will learn',
      'ar': 'وصف',
    },
    'lr9dd31n': {
      'en': '',
      'ar': 'أدخل وصفك هنا ...',
    },
    'unk4upiq': {
      'en': 'Course Requirement',
      'ar': 'وصف',
    },
    '6bwmbx3o': {
      'en': '',
      'ar': 'أدخل وصفك هنا ...',
    },
    'z0see5ry': {
      'en': 'Total Course Duration(hours)',
      'ar': 'عنوان',
    },
    '11ri8zo4': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'pxsqq7zh': {
      'en': '0',
      'ar': '',
    },
    'jqvynksp': {
      'en': 'Total Number of Lessons',
      'ar': 'سعر الدفع الكامل',
    },
    '4v69u4vi': {
      'en': '',
      'ar': 'أدخل سعر الدفع الكامل هنا ...',
    },
    'nnexapoz': {
      'en': '0',
      'ar': '',
    },
    'k27caqng': {
      'en': 'Student Limit',
      'ar': '',
    },
    'z7x886bq': {
      'en': '',
      'ar': '',
    },
    'ksazhc27': {
      'en': '10000',
      'ar': '',
    },
    '0r6i1vbc': {
      'en': 'Course Type',
      'ar': '',
    },
    'l9c92vx1': {
      'en': 'Free',
      'ar': '',
    },
    'oeg25xe4': {
      'en': 'Paid',
      'ar': '',
    },
    'bak3cg7z': {
      'en': 'Full Payment',
      'ar': '',
    },
    'm2srxq62': {
      'en': 'Full Payment',
      'ar': '',
    },
    '3wje98ee': {
      'en': 'EMI Payment',
      'ar': '',
    },
    '78f2en11': {
      'en': 'Full Price*',
      'ar': 'سعر الدفع الكامل',
    },
    '1budbs4t': {
      'en': '',
      'ar': 'أدخل سعر الدفع الكامل هنا ...',
    },
    'w0sx6mmm': {
      'en': '0',
      'ar': '',
    },
    'amxdbv4b': {
      'en': 'First EMI Price*',
      'ar': 'سعر أول دفعة EMI',
    },
    'fbpuo5z8': {
      'en': '',
      'ar': 'أدخل سعر الدفع الكامل هنا ...',
    },
    '5o3xn8io': {
      'en': '0',
      'ar': '',
    },
    'tq1qer7w': {
      'en': 'Second EMI Price*',
      'ar': 'سعر الدفعة الثانية من الأقساط الشهرية المتساوية (EMI)',
    },
    '3dks05ao': {
      'en': '',
      'ar': 'أدخل سعر الدفع الكامل هنا ...',
    },
    'd7xpr1nd': {
      'en': '0',
      'ar': '',
    },
    'wdfuzl1v': {
      'en': 'Third EMI Price*',
      'ar': 'سعر دفعة EMI الثالثة',
    },
    'f8ck7vmr': {
      'en': '',
      'ar': 'أدخل سعر الدفع الكامل هنا ...',
    },
    'cc1s0cm8': {
      'en': '0',
      'ar': '',
    },
    'v45bi5t2': {
      'en': 'EMI\'s Notification Date',
      'ar': '',
    },
    'hbzpj3kv': {
      'en': 'Whatsapp Group Link',
      'ar': 'رسوم بطاقة الائتمان',
    },
    'w9kgsl0z': {
      'en': '',
      'ar': 'أدخل رسوم CreditCard٪ الخاصة بك هنا ...',
    },
    'rjgyitnf': {
      'en': 'Recommended',
      'ar': '',
    },
    'yqiqvubk': {
      'en': 'None',
      'ar': '',
    },
    'k8j6a5s4': {
      'en': 'Recommended',
      'ar': '',
    },
    'n32hh7kf': {
      'en': 'Featured',
      'ar': '',
    },
    'rjc6x6eh': {
      'en': 'Add to list',
      'ar': '',
    },
    'kyermjq4': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'aoymta4u': {
      'en': 'Draft',
      'ar': '',
    },
    '7g0y99n1': {
      'en': 'Draft',
      'ar': 'الخيار 1',
    },
    't0hfhh8d': {
      'en': 'Select status',
      'ar': 'حدد الفرع ...',
    },
    'mfxsc67h': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    'wqjxvkap': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    '7if3i9k3': {
      'en': 'Field is required',
      'ar': '',
    },
    'wkkf9xoj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'inswqxki': {
      'en': 'Field is required',
      'ar': '',
    },
    '4nlwnc4c': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0rvz4tcv': {
      'en': 'Field is required',
      'ar': '',
    },
    '5w47wlyf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'c9j8oszv': {
      'en': 'Field is required',
      'ar': '',
    },
    'zxrm2wgo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'maxzohov': {
      'en': 'Field is required',
      'ar': '',
    },
    '4877kk08': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'cgwl01b5': {
      'en': 'Field is required',
      'ar': '',
    },
    'g4zhd86d': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xlqqckq7': {
      'en': 'Field is required',
      'ar': '',
    },
    '3hoieghf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xku6z6o0': {
      'en': 'Field is required',
      'ar': '',
    },
    'oejbummt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wx34jl0b': {
      'en': 'Field is required',
      'ar': '',
    },
    'q5kc5qjx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ymw1dws8': {
      'en': 'Field is required',
      'ar': '',
    },
    'kfpkupay': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't3flkv7r': {
      'en': 'Field is required',
      'ar': '',
    },
    '5w695fek': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'quk4l8zz': {
      'en': 'Field is required',
      'ar': '',
    },
    '3qfgfrrt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ljt4bce7': {
      'en': 'Field is required',
      'ar': '',
    },
    '6s6y0f7o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // mobileNav
  {
    'myiii5yc': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    '4cjtib1z': {
      'en': 'Courses',
      'ar': 'الدورات',
    },
    '4oo1umo1': {
      'en': 'List',
      'ar': 'قائمة',
    },
    'pt9drtfg': {
      'en': 'Orders',
      'ar': 'طلبات',
    },
    'r7oojr87': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'lysmja0b': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
  },
  // webNav
  {
    '68h0mbgw': {
      'en': 'Bonus',
      'ar': 'علاوة',
    },
    '93o11he5': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'g8emil3n': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    '8zhgarek': {
      'en': 'Course',
      'ar': 'دورة',
    },
    't9vxqsms': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'xot0weo7': {
      'en': 'Meeting',
      'ar': 'مقابلة',
    },
    'avmk4h88': {
      'en': 'Meeting',
      'ar': 'مقابلة',
    },
    'ervdnn04': {
      'en': 'Instructor Request',
      'ar': 'مقابلة',
    },
    'ztfxxti7': {
      'en': 'Instructor',
      'ar': 'مدرب',
    },
    'grkyezui': {
      'en': 'Orders',
      'ar': 'طلبات',
    },
    'n8m67l6l': {
      'en': 'Orders',
      'ar': 'طلبات',
    },
    'qvr3c05j': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
    'aj8xilqc': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
    'vhw9t3pr': {
      'en': 'Video Management',
      'ar': 'إدارة الفيديو',
    },
    'wfzq508f': {
      'en': 'Media',
      'ar': 'وسائط',
    },
    'tzut581o': {
      'en': 'Video Management',
      'ar': '',
    },
    'p91nr0f3': {
      'en': 'Media',
      'ar': '',
    },
    '00btf8sw': {
      'en': 'Coupon',
      'ar': 'قسيمة',
    },
    'tziwkg0a': {
      'en': 'Coupon',
      'ar': 'قسيمة',
    },
    '3irx8rvn': {
      'en': 'User',
      'ar': 'مستخدم',
    },
    'ssqcu6m5': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'i6y7muzc': {
      'en': 'SMS Marketing',
      'ar': 'تسويق الرسائل القصيرة',
    },
    'b7jowee5': {
      'en': 'Marketing',
      'ar': 'تسويق',
    },
    '3oe4p3xg': {
      'en': 'Translation',
      'ar': 'ترجمة',
    },
    'leeb0i37': {
      'en': 'Translation',
      'ar': 'ترجمة',
    },
    'e8461y9e': {
      'en': 'Log',
      'ar': 'ترجمة',
    },
    '2efsg36a': {
      'en': 'Log',
      'ar': 'ترجمة',
    },
    'uhestpre': {
      'en': 'Report',
      'ar': '',
    },
    'mtfbv8nr': {
      'en': 'Report',
      'ar': '',
    },
    '6ei29o0i': {
      'en': 'Setting',
      'ar': 'جلسة',
    },
    'igwwv248': {
      'en': 'Setting',
      'ar': 'جلسة',
    },
    'jc50810l': {
      'en': 'Setting',
      'ar': 'جلسة',
    },
    '7tsnggui': {
      'en': 'Setting',
      'ar': 'جلسة',
    },
    'xzc6uv55': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    '0oltw03q': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    'x7nb773v': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
  },
  // editProfilePhoto
  {
    'g9f2zkcd': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
    },
    'lu4rqoz0': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'ar':
          'قم بتحميل صورة جديدة أدناه لتغيير الصورة الرمزية التي يراها الآخرون.',
    },
    'wqojvflm': {
      'en': 'Upload Image',
      'ar': 'تحميل الصور',
    },
    'qh1dpu6d': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
  },
  // createList
  {
    '7avntsae': {
      'en': 'Add Image',
      'ar': 'أضف فيديو',
    },
    'n3bi5y7d': {
      'en': 'Remove',
      'ar': 'أضف فيديو',
    },
    'gb3qefds': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    'oev6qz0i': {
      'en': '',
      'ar': 'أدخل اسمك هنا...',
    },
    'xqtu2cer': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'ahe2jbvl': {
      'en': 'Field is required',
      'ar': '',
    },
    'pytulibd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // DeleteMessage
  {
    '5sateaw4': {
      'en': 'Delete!',
      'ar': 'يمسح!',
    },
    'z3gsl6yu': {
      'en': 'Do you want delete this..',
      'ar': 'هل تريد حذف هذا ..',
    },
    '8ntnf1av': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    's22gvnp1': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
  },
  // createLesson
  {
    '6f98pojn': {
      'en': 'Create Lesson',
      'ar': 'إنشاء الدرس',
    },
    '18riir9a': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'ah5dm01e': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'v7luxrif': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'cpacyvr1': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '2wfh56c7': {
      'en': 'Description*',
      'ar': 'وصف',
    },
    'z1hqz825': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'aailewji': {
      'en': 'Free Preview',
      'ar': 'معاينة مجانية',
    },
    'ky025yth': {
      'en': 'PDF Download',
      'ar': '',
    },
    'owaz4z2p': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'mcs69os1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '0qm3buwt': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'apnaa4pq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ghyx27g3': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ueer3x5p': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3yw4alzv': {
      'en': 'Preview',
      'ar': '',
    },
    'vqpzzblx': {
      'en': 'Add Video',
      'ar': 'يضيف',
    },
    't42ninog': {
      'en': 'Remove ',
      'ar': 'يزيل',
    },
    '7kgdnwg8': {
      'en': 'File Upload',
      'ar': '',
    },
    '4l71vgz4': {
      'en': 'Add',
      'ar': '',
    },
    'jml66b94': {
      'en': 'Open',
      'ar': '',
    },
    'dwdus5ae': {
      'en': 'Delete',
      'ar': '',
    },
    'o46x90hy': {
      'en': 'Enable download',
      'ar': '',
    },
    '3dk13ifa': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
  },
  // createChapter
  {
    'i43xhymg': {
      'en': 'Serial No.*',
      'ar': 'الرقم التسلسلي.',
    },
    'ere0hrpc': {
      'en': '',
      'ar': 'أدخل الرقم التسلسلي الخاص بك هنا ...',
    },
    'c1gyzdhi': {
      'en': 'First',
      'ar': 'أولاً',
    },
    'bo59arec': {
      'en': 'First',
      'ar': 'أولاً',
    },
    '8fz5l8nl': {
      'en': 'Second',
      'ar': 'ثانية',
    },
    'e47m7ejs': {
      'en': 'Third',
      'ar': 'ثالث',
    },
    'cbyjm5rn': {
      'en': 'Please select emi type...*',
      'ar': 'الرجاء التحديد...',
    },
    'sr770bt2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'tsac9qkp': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    '2tv7dva6': {
      'en': '',
      'ar': '',
    },
    'm9monts3': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'dquftewb': {
      'en': '',
      'ar': 'أدخل وصفك هنا ...',
    },
    'nkyea1uz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'rmhz0nyj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '2mcnmxe0': {
      'en': 'Field is required',
      'ar': '',
    },
    'diwdxqe6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    's2yeeiwy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'me2hb3x8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bjywrzmv': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
  },
  // Meeting-Add
  {
    '8xw1vsfj': {
      'en': 'Create Meeting',
      'ar': 'إنشاء اجتماع',
    },
    'y28dnp47': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'mw9e8hwn': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'ja2ztm68': {
      'en': 'Limit',
      'ar': 'حد',
    },
    '4essz2h7': {
      'en': '',
      'ar': 'أدخل الحد هنا ...',
    },
    'n1mw3tvr': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '6aszpg3n': {
      'en': 'Day List',
      'ar': 'قائمة اليوم',
    },
    'speldh03': {
      'en': 'Sunday',
      'ar': 'الأحد',
    },
    'nczm5ieu': {
      'en': 'Monday',
      'ar': 'الاثنين',
    },
    'pyefxnpv': {
      'en': 'Tuesday',
      'ar': 'يوم الثلاثاء',
    },
    'n810h1es': {
      'en': 'Wednesday',
      'ar': 'الأربعاء',
    },
    'lo6pvc3q': {
      'en': 'Thursday',
      'ar': 'يوم الخميس',
    },
    'r94ussqr': {
      'en': 'Friday',
      'ar': 'جمعة',
    },
    'r5nt6j8s': {
      'en': 'Saturday',
      'ar': 'السبت',
    },
    '852qdkh5': {
      'en': 'Session List',
      'ar': 'قائمة الجلسة',
    },
    'tkeutbcw': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'q6cm4lhv': {
      'en': 'Afternoon',
      'ar': 'بعد الظهر',
    },
    'mk6igdto': {
      'en': 'Evening',
      'ar': 'مساء',
    },
    'gnof8wuk': {
      'en': 'Add Meeting Featured Image',
      'ar': 'إضافة صورة مميزة للاجتماع',
    },
    'fsdg5sh2': {
      'en': 'Add Image',
      'ar': 'إضافة صورة',
    },
    'xkl00pfd': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'xa6l5kmu': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    '1l75t2ct': {
      'en': 'Field is required',
      'ar': '',
    },
    '2fs4u7n7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jwpl0rmn': {
      'en': 'Field is required',
      'ar': '',
    },
    'bgq53czy': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // AddUser
  {
    'lb8bmy07': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
    },
    'n8ht03hl': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'o1zbamo8': {
      'en': 'Your Email',
      'ar': 'بريدك الالكتروني',
    },
    '8yzljehi': {
      'en': '',
      'ar': 'عنوان الايميل',
    },
    'tk7nzc64': {
      'en': 'Admin',
      'ar': 'مسؤل',
    },
    'i71rctv6': {
      'en': 'Instructor',
      'ar': 'مدرب',
    },
    'to8nopd3': {
      'en': 'Student',
      'ar': 'طالب',
    },
    'qhedlaxg': {
      'en': 'Role...',
      'ar': 'دور...',
    },
    '4960mf66': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    'zzsmfqnu': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'ao4c3qbi': {
      'en': '',
      'ar': 'أدخل رقم الهاتف',
    },
    'n29i0lh7': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'p0gy62jc': {
      'en': 'Approve',
      'ar': 'يعتمد',
    },
    'lcw65vjh': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
    'h5nppc7j': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
  },
  // AddAnnouncement
  {
    'anj2y814': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    '377w7ao9': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    '0cshrakw': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    'n6lqtkmo': {
      'en': 'Select Course...*',
      'ar': 'اختر الدورة...',
    },
    'i2e39zq1': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '64nfkckk': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    'hc6vxjum': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    '705nli6v': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    'ueokb7i5': {
      'en': 'Select Course...*',
      'ar': 'اختر الدورة...',
    },
    'gesygtq9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'w5wx5mik': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'rbx9n54k': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    'q4nbxjsd': {
      'en': 'Summary*',
      'ar': 'ملخص',
    },
    '62ra0faq': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    's9i1vo66': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fnnua9ys': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '2xtymahj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '70ka56g0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // EditReview
  {
    'e3cxkyx1': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
    'voeo4359': {
      'en': 'Approved',
      'ar': 'موافقة',
    },
    '404bmukx': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    'lkfl2wce': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '4ys8dpik': {
      'en': 'Select Status...',
      'ar': 'حدد الحالة...',
    },
    'gj8g9wr9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'yuvx91ud': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '6y76gzgs': {
      'en': 'Course:',
      'ar': 'دورة:',
    },
    'm38twk54': {
      'en': 'User Details',
      'ar': 'بيانات المستخدم',
    },
    'bi4eho20': {
      'en': 'Admin Reply',
      'ar': 'رد المشرف',
    },
    'sadkarqe': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
    'jti0ul37': {
      'en': 'Reply',
      'ar': 'رد',
    },
    '5gm3mkmh': {
      'en': 'Enter your response',
      'ar': 'أدخل ردك',
    },
    'l2152nlw': {
      'en': '',
      'ar': '',
    },
    'bp8xcqts': {
      'en': 'Reply',
      'ar': 'رد',
    },
  },
  // DeleteMessage_1
  {
    'hujiy9x9': {
      'en': 'Delete!',
      'ar': 'يمسح!',
    },
    '37xnadqz': {
      'en': 'Do you want delete this..',
      'ar': 'هل تريد حذف هذا ..',
    },
    'y7qhe7gp': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '6g0o86j6': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
  },
  // AddZoomclasses
  {
    'k6lv4yo5': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    '2fb3a5mg': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '7bw77sha': {
      'en': 'Summary',
      'ar': 'ملخص',
    },
    '8i47h0h3': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'bu1g80cy': {
      'en': 'Duration(mins)*',
      'ar': 'المدة (دقيقة)',
    },
    's1mbjr9p': {
      'en': '',
      'ar': '',
    },
    '673ok57b': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    '6gktfowm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qj19b6l3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'zmnlnzu6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    's7f3rsy4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qqpgmc7x': {
      'en': 'Field is required',
      'ar': '',
    },
    '72s5xfrw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // student_userRoleAprrovedRejectDropDown
  {
    '0b70qcn5': {
      'en': 'Unblock',
      'ar': 'موافقة',
    },
    'mg7yayuc': {
      'en': 'Block',
      'ar': 'يرفض',
    },
    '7hx2tnaw': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
    },
    'rihjz8y0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
  },
  // createPoll
  {
    'z9jnq589': {
      'en': 'Create Poll',
      'ar': 'إنشاء دورة',
    },
    'ay5k0k6r': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    '5j8uthfe': {
      'en': 'Remove',
      'ar': 'إضافة صورة',
    },
    'rdf6vp1g': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    '653li0mx': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    'ny94z7a8': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    'puilzsnx': {
      'en': 'Select Course...*',
      'ar': 'اختر الدورة...',
    },
    'cy0f0sr3': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'v4279lq7': {
      'en': 'CSS',
      'ar': 'CSS',
    },
    '8usn6fj2': {
      'en': 'JS',
      'ar': 'شبيبة',
    },
    'dtsb24yo': {
      'en': 'ReactJs',
      'ar': 'ReactJs',
    },
    '5n3crh7a': {
      'en': 'Select Course...*',
      'ar': 'اختر الدورة...',
    },
    'megeh6ke': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'q5p9kluf': {
      'en': 'Title*',
      'ar': 'اسم',
    },
    'fo59w858': {
      'en': '',
      'ar': 'أدخل اسمك هنا...',
    },
    'xj9v75uq': {
      'en': 'Description*',
      'ar': 'وصف',
    },
    '5thp2qxu': {
      'en': '',
      'ar': 'أدخل وصفك هنا ...',
    },
    '5y4khrfw': {
      'en': 'Question*',
      'ar': 'سعر الدفع الكامل',
    },
    'jp6b1lyh': {
      'en': '',
      'ar': 'أدخل سعر الدفع الكامل هنا ...',
    },
    'ik56funp': {
      'en': 'End Date',
      'ar': 'تاريخ البدء',
    },
    '3cqi7039': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'bw2fxoo8': {
      'en': 'Field is required',
      'ar': '',
    },
    '7vz8rvgb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0tyomcy2': {
      'en': 'Field is required',
      'ar': '',
    },
    '3r1br7ch': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4zinapyv': {
      'en': 'Field is required',
      'ar': '',
    },
    'v3z8s407': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // createPollAnswer
  {
    '30lfuqes': {
      'en': 'Create Poll Answer',
      'ar': 'إنشاء دورة',
    },
    '0tc3huy4': {
      'en': 'Answer*',
      'ar': 'اسم',
    },
    'd0svu4cq': {
      'en': '',
      'ar': 'أدخل اسمك هنا...',
    },
    'maleye80': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'j7lw0n3r': {
      'en': 'Field is required',
      'ar': '',
    },
    'ynd3ofrp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // instructor_userRoleAprrovedRjectDropDownCopy
  {
    '1f4p9q1o': {
      'en': 'Approve / Reject',
      'ar': '',
    },
    'nwtuc54h': {
      'en': 'Approved',
      'ar': 'موافقة',
    },
    '89p2dcby': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
    'yn7f2f1e': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'vzsuv82v': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
    },
    'lpvhnjxu': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
  },
  // Mobile
  {
    'rk8yqcyi': {
      'en': 'Window is too small!',
      'ar': 'النافذة صغيرة جدًا!',
    },
  },
  // ProfilePopup
  {
    'ufisciyd': {
      'en': 'View Profile',
      'ar': 'عرض الصفحة الشخصية',
    },
    '0frs1hof': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
    },
  },
  // changeCountry
  {
    '14wdqq77': {
      'en': '*',
      'ar': '*محدث',
    },
  },
  // changeUniversity
  {
    'c88npaj3': {
      'en': '*',
      'ar': '*محدث',
    },
  },
  // changeBranch
  {
    '0szhsa3f': {
      'en': '*',
      'ar': '*محدث',
    },
  },
  // AllEditReview
  {
    'indigah9': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
    'etcs36jd': {
      'en': 'Approved',
      'ar': 'موافقة',
    },
    'vfci1jkb': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    '0pdroggi': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'ddhtmq0i': {
      'en': 'Select Status...',
      'ar': 'حدد الحالة...',
    },
    'v4ojzmr0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'cebl069p': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'hr3tkvlj': {
      'en': 'Course:',
      'ar': 'دورة:',
    },
    'cgg7imv0': {
      'en': 'User Details',
      'ar': 'بيانات المستخدم',
    },
    'llrmvf0q': {
      'en': 'Admin Reply',
      'ar': 'رد المشرف',
    },
    'fybyqkfi': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
    'a43gsb3h': {
      'en': 'Reply',
      'ar': 'رد',
    },
    'dayrz01s': {
      'en': 'Enter your response',
      'ar': 'أدخل ردك',
    },
    'sped5g9m': {
      'en': '',
      'ar': '',
    },
    'qzrylvcv': {
      'en': 'Reply',
      'ar': 'رد',
    },
  },
  // createCategory
  {
    'ywq5f3xr': {
      'en': 'Add Image',
      'ar': 'إضافة صورة',
    },
    '64wgyaq1': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'xyqf692w': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '4gxzw0i5': {
      'en': 'Select country...',
      'ar': 'حدد الدولة...',
    },
    'vg2zozsn': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'd6fh8a50': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'aam1qv70': {
      'en': 'Select university...',
      'ar': 'اختر الجامعة...',
    },
    'z6y9sdg0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'f8r670eu': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'hhqc5haj': {
      'en': 'Select category...',
      'ar': 'اختر الفئة...',
    },
    '90n2mrck': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'g8iv83lh': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'h6firoik': {
      'en': 'Select branch...',
      'ar': 'اختر الفرع...',
    },
    'pnco0ffh': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '77jbrv7d': {
      'en': 'Title*',
      'ar': 'عنوان',
    },
    'wlsjttp1': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '3adlu41w': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'e0lfsj93': {
      'en': 'Field is required',
      'ar': '',
    },
    'dmdvkoip': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // CourseGrid
  {
    'sfzjjnfg': {
      'en': 'Dance Class',
      'ar': 'صف الرقص',
    },
    'bcic3b4t': {
      'en': '1 Month',
      'ar': '1 شهر',
    },
    'gizugvhl': {
      'en': 'View Lesson',
      'ar': 'عرض الدرس',
    },
    'fdtdfy5g': {
      'en': 'Hide Lesson',
      'ar': 'إخفاء الدرس',
    },
    'dgj033a1': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'dznigyf8': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
    'potdd3f0': {
      'en': 'Lesson1',
      'ar': 'الدرس 1',
    },
    'qbquo2qx': {
      'en': 'Chapter',
      'ar': 'الفصل',
    },
    '8fiu09fz': {
      'en': 'Review',
      'ar': 'مراجعة',
    },
  },
  // webNavCourseSubmenu
  {
    'vudpjnvu': {
      'en': 'Batch',
      'ar': 'حزمة',
    },
    '7iw6dh92': {
      'en': 'Batch',
      'ar': 'حزمة',
    },
    '0tdzk7g7': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'jd6vh6so': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'g17s2rts': {
      'en': 'Course Category',
      'ar': 'فئة الدورة',
    },
    'dem6mudy': {
      'en': 'Category',
      'ar': 'فئة',
    },
    '982pie2h': {
      'en': 'University',
      'ar': 'جامعة',
    },
    '9835i6un': {
      'en': 'University',
      'ar': 'جامعة',
    },
    'l9ktproi': {
      'en': 'Poll',
      'ar': 'تصويت',
    },
    'hes6fphj': {
      'en': 'Poll',
      'ar': 'تصويت',
    },
    'u2fwnvsm': {
      'en': 'Announcement',
      'ar': 'إعلان',
    },
    'lf5x9ndz': {
      'en': 'Announcement',
      'ar': 'إعلان',
    },
  },
  // webNavUserSubmenu
  {
    'ix6yaiwa': {
      'en': 'User',
      'ar': 'مستخدم',
    },
    '7e4t5hs5': {
      'en': 'User',
      'ar': 'مستخدم',
    },
    'zjxwi6xd': {
      'en': 'Instructor Request',
      'ar': 'طلب مدرس',
    },
    '8k5dhjjz': {
      'en': 'Instructor Request',
      'ar': 'طلب مدرس',
    },
  },
  // Remove
  {
    'xmn3tbe6': {
      'en': 'Remove!',
      'ar': 'يمسح!',
    },
    '0groranu': {
      'en': 'Do you want remove this..',
      'ar': 'هل تريد حذف هذا ..',
    },
    '734uodgk': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'hntv0zap': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
  },
  // empty_message
  {
    '09nie6pj': {
      'en': 'Click \"',
      'ar': '',
    },
    'shtrzrly': {
      'en': 'Add',
      'ar': '',
    },
    'aq3510qg': {
      'en': '\" button to start uploading the videos.',
      'ar': '',
    },
    '5uj9tqrs': {
      'en': 'Go to \"',
      'ar': '',
    },
    'p4lwprii': {
      'en': 'Media Management',
      'ar': '',
    },
    'h5ml8ujy': {
      'en': '\" page to start uploading the videos.',
      'ar': '',
    },
  },
  // student_blocking
  {
    '17jvd240': {
      'en': 'Reason*',
      'ar': 'سبب',
    },
    'brubvkdy': {
      'en': '',
      'ar': 'أدخل اسمك هنا...',
    },
    '2myvfr78': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    '58er5jul': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '303tzihv': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // Batch-Add
  {
    'rzqyad7k': {
      'en': 'Add Image',
      'ar': 'إضافة صورة',
    },
    'sswmoti8': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'z8183lh6': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    'ctd5q6o9': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    '7d2ttduo': {
      'en': 'Student Limit',
      'ar': 'وصف',
    },
    'usuk20c4': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    'w5smwbxd': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '727zv3rk': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    '6u0uen47': {
      'en': '',
      'ar': '',
    },
    'ovfmrg41': {
      'en': 'Ongoing',
      'ar': 'جاري التنفيذ',
    },
    'hrynbnal': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    '6egrldgd': {
      'en': 'Select status...',
      'ar': 'اختر الحالة...',
    },
    '03h639ht': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'be64j1va': {
      'en': 'Start Date*',
      'ar': 'تاريخ البدء',
    },
    'o19ta1de': {
      'en': 'End Date*',
      'ar': 'تاريخ الانتهاء',
    },
    'vpo8u8yo': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    '6eziri4e': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5rco8ouk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'm7ihx81f': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ki9qc3kl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'okxeowwf': {
      'en': 'Field is required',
      'ar': '',
    },
    'g6yh19e1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Batch-CourseCreatTimePopup
  {
    'diaqfkrb': {
      'en': '',
      'ar': '',
    },
    '9c20400o': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'g3kpuovs': {
      'en': '2',
      'ar': '2',
    },
    'eyxzu74z': {
      'en': '3',
      'ar': '3',
    },
    '2g6r2u7e': {
      'en': 'Select course...',
      'ar': 'اختر الدورة...',
    },
    '3d24r8qx': {
      'en': 'Search for an course...',
      'ar': 'البحث عن عنصر...',
    },
    'l16rhw71': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'qjoeo6fd': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5z28fun3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'i4c9q8ya': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'o4zyvzpe': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // Batch-PasswordSingleCourse
  {
    'miwlgm7q': {
      'en': 'Please enter master password',
      'ar': 'الرجاء إدخال كلمة المرور الرئيسية',
    },
    '15pw713p': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'g79g07nw': {
      'en': '',
      'ar': '',
    },
    'q7e1cjbu': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'fk7lf0uv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '960wfqez': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'iuvjyv4q': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8xljn6hq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // Batch-ChangeBatch-SingleCourse-PresentInfo
  {
    '38b57s33': {
      'en': 'Present batch details',
      'ar': 'تفاصيل الدفعة الحالية',
    },
    '8wruw2ps': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'j9bd5ypn': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'm56cbvdj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'i5xytekj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'kqqgz021': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '1ktrlrru': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // bookings
  {
    '1hmr42p8': {
      'en': 'Upcoming',
      'ar': 'القادمة',
    },
    'iuh2zwij': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    'vo3337ui': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '44tbo30f': {
      'en': 'Session',
      'ar': 'حصة',
    },
    'qk2ag4a1': {
      'en': 'User Details',
      'ar': 'بيانات المستخدم',
    },
    'm8x0iz57': {
      'en': 'Remarks',
      'ar': 'ملاحظات',
    },
    'cjyvpr9o': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'wy2w8hc3': {
      'en': 'Session',
      'ar': 'حصة',
    },
    '991mt29j': {
      'en': 'User Details',
      'ar': 'بيانات المستخدم',
    },
    '3zibfokz': {
      'en': 'Remarks',
      'ar': 'ملاحظات',
    },
  },
  // Batch-PasswordMainBatch
  {
    '0uiukpre': {
      'en': 'Please enter master password',
      'ar': 'الرجاء إدخال كلمة المرور الرئيسية',
    },
    'sb1wu5co': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'ztfuzulm': {
      'en': '',
      'ar': '',
    },
    '4li730cx': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'vqdnqggt': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'pijtghaq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '9cte7pgh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'dqmegh1m': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // Batch-PasswordAllCourse
  {
    'ycq01ti2': {
      'en': 'Please enter master password',
      'ar': 'الرجاء إدخال كلمة المرور الرئيسية',
    },
    'hddomhvd': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '49t3uvdj': {
      'en': '',
      'ar': '',
    },
    'aiy3e9yo': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    '24egswwv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'nz6hbo8i': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'nk0x3agi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'piuoj72a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // Batch-CourseCreatTimeBatchList
  {
    'funyv7ae': {
      'en': 'Select Batch here',
      'ar': 'حدد الدفعة هنا',
    },
    '1g7klq70': {
      'en': 'OR',
      'ar': 'أو',
    },
    'ce696wpz': {
      'en': 'New Batch',
      'ar': 'دفعة جديدة',
    },
    'e54vkqw5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'a5bhamhw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'r0h49809': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '539l1yii': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // block_status
  {
    '5jz8hhp7': {
      'en': 'Sorry, you have been blocked',
      'ar': 'عذرا، لقد تم حظرك',
    },
    'mua7x6s0': {
      'en': 'Please contact support team \'+965 98765432\'',
      'ar': 'يرجى الاتصال بفريق الدعم \"+965 98765432\"',
    },
  },
  // Coupon-Add
  {
    'q6aa6liw': {
      'en': 'Name*',
      'ar': 'اسم',
    },
    'vacqe6au': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    'onyep8al': {
      'en': 'Discount',
      'ar': 'تخفيض',
    },
    'b5qe5eux': {
      'en': 'Discount',
      'ar': 'تخفيض',
    },
    'r71sx5hf': {
      'en': 'Amount',
      'ar': 'كمية',
    },
    'ivphg282': {
      'en': 'Select coupon type',
      'ar': 'اختر نوع القسيمة',
    },
    'g826lwup': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9rhpgf5n': {
      'en': 'Amount*',
      'ar': 'كمية',
    },
    'aa32vmpg': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    'fy3rxwyd': {
      'en': 'Total usage limit*',
      'ar': 'حد الاستخدام الإجمالي',
    },
    'maea83b2': {
      'en': '',
      'ar': 'عنوان الإعلان',
    },
    '4fd6rgar': {
      'en': 'Minimum amount*',
      'ar': 'الحد الأدنى للمبلغ',
    },
    'jqmj8rk4': {
      'en': '',
      'ar': '',
    },
    'gq3ecptx': {
      'en': '0',
      'ar': '',
    },
    '97tj8q79': {
      'en': 'Maximum amount*',
      'ar': 'الحد الأقصى للمبلغ',
    },
    '270cguia': {
      'en': '',
      'ar': '',
    },
    'k9uqv3uw': {
      'en': '0',
      'ar': '',
    },
    'p8dqte3k': {
      'en': 'Start Date*',
      'ar': 'تاريخ البدء',
    },
    'fe97mspw': {
      'en': 'End Date*',
      'ar': 'تاريخ الانتهاء',
    },
    '3zkup764': {
      'en': 'Select the courses',
      'ar': 'حدد الدورات',
    },
    '0lmt1zwp': {
      'en': 'Search here...',
      'ar': '',
    },
    'aanyto68': {
      'en': 'Enable Coupon',
      'ar': 'تمكين القسيمة',
    },
    'qtmlkauz': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    '9r6z44d3': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2y44ts4g': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'pej7jnmr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'lov07f2f': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'q3qrswxz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'j7nu1nw7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1fgymag9': {
      'en': 'Field is required',
      'ar': '',
    },
    '60qfw3fe': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e0eoq6qk': {
      'en': 'Field is required',
      'ar': '',
    },
    'tvql97yu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gbt542o6': {
      'en': 'Field is required',
      'ar': '',
    },
    'upbjs2w5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Video-ImageChangePopup
  {
    'xtqhec76': {
      'en': 'Do you really want to change the image?',
      'ar': 'هل تريد حقا تغيير الصورة؟',
    },
    'ybahdjiz': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'cdh1ulh4': {
      'en': 'No',
      'ar': 'لا',
    },
  },
  // Video-ListForSelection
  {
    'kr51k6k6': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
  },
  // webNavSMSSubmenu
  {
    'lj9xurvn': {
      'en': 'Batch',
      'ar': '',
    },
    'qfjf1w4m': {
      'en': 'SMS',
      'ar': 'لوحة القيادة',
    },
    'rvwjk0tf': {
      'en': 'Email',
      'ar': '',
    },
    'kxhq54gg': {
      'en': 'Manual Notification',
      'ar': '',
    },
  },
  // Bulk_sms_confirmation
  {
    'cyucm5yf': {
      'en': 'Do you really want to send the sms?',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    '2vquuotp': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'ehnatisr': {
      'en': 'No',
      'ar': 'لا',
    },
  },
  // bulk_sms_recepients
  {
    '9qhdgdem': {
      'en': 'Bulk SMS Report',
      'ar': 'تقرير الرسائل القصيرة بالجملة',
    },
    'adbo566n': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    'bgiglr3s': {
      'en': 'Mobile',
      'ar': 'متحرك',
    },
    '4rqdevlx': {
      'en': 'Type',
      'ar': 'يكتب',
    },
    'du73rgdn': {
      'en': 'Status',
      'ar': 'حالة',
    },
  },
  // webNavTranslateSubmenu
  {
    'xu3w07g7': {
      'en': 'Batch',
      'ar': 'حزمة',
    },
    '7hduej44': {
      'en': 'Batch',
      'ar': 'حزمة',
    },
    '2hp9rlph': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'd7bgcznw': {
      'en': 'Course',
      'ar': 'دورة',
    },
    'fjwv7phb': {
      'en': 'Course Category',
      'ar': 'فئة الدورة',
    },
    'sj3r1ohg': {
      'en': 'Course Category',
      'ar': 'فئة الدورة',
    },
    'uzqx6c7j': {
      'en': 'Country',
      'ar': 'دولة',
    },
    'ry57aene': {
      'en': 'Country',
      'ar': 'دولة',
    },
    'mikcmjj8': {
      'en': 'University',
      'ar': 'جامعة',
    },
    'erqiw4ol': {
      'en': 'University',
      'ar': 'جامعة',
    },
    'c2g2n5wj': {
      'en': 'Branch',
      'ar': 'فرع',
    },
    'aud6skss': {
      'en': 'Category',
      'ar': 'فئة',
    },
    '8do0w5qe': {
      'en': 'Branch',
      'ar': 'فرع',
    },
    '2mjjdauu': {
      'en': 'Branch',
      'ar': 'فرع',
    },
    'vlwungrm': {
      'en': 'Poll',
      'ar': 'تصويت',
    },
    '5lkjwm8c': {
      'en': 'Poll',
      'ar': 'تصويت',
    },
    'envm55a0': {
      'en': 'Announcement',
      'ar': 'إعلان',
    },
    '60xxv2r4': {
      'en': 'Announcement',
      'ar': 'إعلان',
    },
    'wb6vcapp': {
      'en': 'Meeting',
      'ar': 'مقابلة',
    },
    'wtfj3b25': {
      'en': 'Meeting',
      'ar': 'مقابلة',
    },
    '23iu6nth': {
      'en': 'Setting',
      'ar': 'جلسة',
    },
    'hpzs03dz': {
      'en': 'Setting',
      'ar': 'جلسة',
    },
  },
  // Btach-ExpandText
  {
    'k4r1ijua': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'rlgs75hn': {
      'en': 'Enter here',
      'ar': 'أدخل هنا',
    },
    'az7li9cv': {
      'en': '',
      'ar': '',
    },
    'eqcqoywu': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'qqebzpqm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'jjap29bl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bq41r30p': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'pyw598hp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // SMS-ParicularCourse
  {
    's8wbdrby': {
      'en': 'Message',
      'ar': 'رسالة',
    },
    '172q9lq5': {
      'en': '',
      'ar': '',
    },
    '3b9m2g88': {
      'en': '\"The maximum characters for SMS are 160.\"',
      'ar': '\"الحد الأقصى لعدد أحرف الرسائل القصيرة هو 160.\"',
    },
    'grjcw0go': {
      'en': 'Send Now',
      'ar': 'ارسل الان',
    },
    '78jn0qen': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
    },
    'fi2q79o8': {
      'en': 'Mobile',
      'ar': 'متحرك',
    },
    '04tqtt8c': {
      'en': 'Type',
      'ar': 'يكتب',
    },
    'o40gxxbk': {
      'en': 'Status',
      'ar': 'حالة',
    },
  },
  // changeCategory
  {
    'wy1h7oqs': {
      'en': '*',
      'ar': '*',
    },
  },
  // RemoveMessage
  {
    '6c6xdkrw': {
      'en': 'Yes',
      'ar': 'يزيل',
    },
    '4itn91rg': {
      'en': 'No',
      'ar': 'يلغي',
    },
  },
  // pwdCouseStatus
  {
    'mrc6zzbv': {
      'en': 'Please enter master password',
      'ar': 'الرجاء إدخال كلمة المرور الرئيسية',
    },
    'yyvac0bm': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'ibytnl64': {
      'en': '',
      'ar': '',
    },
    '25vds5jn': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'cph6zk5a': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'aeoc88bs': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '81m5cs1n': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ljs83x4h': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // Delete_confirmation
  {
    '84si4klh': {
      'en':
          'Do you want to really delete this? If yes, below will get deleted.',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'oxhdsky7': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '9omtdsgl': {
      'en': 'No',
      'ar': 'لا',
    },
  },
  // CourseFORMinComponents
  {
    'mx4qsb66': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '1j5kkwlj': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'jlt1aumm': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'bhxdwo5z': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'xydse8nb': {
      'en': 'Subtitle',
      'ar': 'الترجمة',
    },
    '73gwaun6': {
      'en': '',
      'ar': 'أدخل العنوان الفرعي للدورة هنا ...',
    },
    'f24mqch2': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '5kcenffr': {
      'en': 'Select country...',
      'ar': 'حدد الدولة...',
    },
    'ouoyroup': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    '1zmoza4c': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    's9pbbl66': {
      'en': 'Select university...',
      'ar': 'اختر جامعة ...',
    },
    '9rap3sw5': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    '6pfdj388': {
      'en': 'Option 1',
      'ar': '',
    },
    'uvk4iv19': {
      'en': 'Select category...',
      'ar': '',
    },
    'plb8lwp7': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'mtwpcgdq': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'r9qabvfp': {
      'en': 'Select branch...',
      'ar': 'حدد الفرع ...',
    },
    'w9ee31kz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
    },
    'bd39n9lw': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'igw8dzkd': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'dhrxqa2i': {
      'en': 'What you will learn',
      'ar': 'ماذا سوف تتعلم',
    },
    'i8kei3l1': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    'e0ra6gz3': {
      'en': 'Course Requirement(one per line)',
      'ar': 'متطلبات الدورة (واحد لكل سطر)',
    },
    'sjdjdys6': {
      'en': '',
      'ar': 'أدخل وصف الدورة هنا ...',
    },
    '1u7bjkpk': {
      'en': 'Total Course Duration(hurs)',
      'ar': 'إجمالي مدة الدورة (ساعات)',
    },
    'l2dpgycw': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    '8rv3ree2': {
      'en': 'Total Number of Lessons',
      'ar': 'إجمالي عدد الدروس',
    },
    'f0shpjh4': {
      'en': '',
      'ar': 'أدخل العنوان هنا...',
    },
    'ldg0vjlf': {
      'en': 'Student Limit',
      'ar': '',
    },
    '9fmjf9o7': {
      'en': '',
      'ar': '',
    },
    'bmqe0bla': {
      'en': 'Course Type',
      'ar': 'دورة كتابية',
    },
    'juj5y4xx': {
      'en': 'Free',
      'ar': 'حر',
    },
    'cyk8lran': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '2062vp8f': {
      'en': 'Full Price',
      'ar': 'السعر الكامل',
    },
    '2iww088v': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    'qblvxq3z': {
      'en': 'First EMI Price',
      'ar': 'سعر القسط الشهري الأول',
    },
    'sf4e36w8': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    '67vnrf7s': {
      'en': 'Second EMI Price',
      'ar': 'سعر القسط الشهري الثاني',
    },
    'qhu8s051': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    't0a11ece': {
      'en': 'Third EMI Price',
      'ar': 'سعر القسط الشهري الثالث',
    },
    'swv130o7': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    'f6dq5rca': {
      'en': 'Whatsapp Group Link',
      'ar': 'رابط مجموعة الواتساب',
    },
    'gaa6s9wh': {
      'en': '',
      'ar': 'أدخل السعر هنا ...',
    },
    '4zlunapm': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'hpuy34v3': {
      'en': 'Select instructor',
      'ar': 'اختر المدرب',
    },
    'nuygd73k': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'r922c5dg': {
      'en': 'Add to LIst',
      'ar': 'أضف إلى القائمة',
    },
    'xaapjc5g': {
      'en': '',
      'ar': '',
    },
    's2cdt1iq': {
      'en': 'Recommended',
      'ar': 'مُستَحسَن',
    },
    'klvd7cyz': {
      'en': 'Featured',
      'ar': 'متميز',
    },
    '4axzmawk': {
      'en': '',
      'ar': '',
    },
    'dln7vsi0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'bf68m9y4': {
      'en': 'Batches',
      'ar': 'دفعات',
    },
    'ouf5ut1j': {
      'en': 'Draft',
      'ar': 'مسودة',
    },
    '0r7tctkx': {
      'en': 'Publish',
      'ar': 'ينشر',
    },
    'lots8v7t': {
      'en': 'Select batches...',
      'ar': 'حدد الدفعات...',
    },
    'wm5qt2m0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'wbh1vkc9': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'uyy7ud71': {
      'en': 'Draft',
      'ar': 'مسودة',
    },
    's3tbdrww': {
      'en': 'Publish',
      'ar': 'ينشر',
    },
    'tr8j16ay': {
      'en': 'Select branch...',
      'ar': 'اختر الفرع...',
    },
    '1fh4wsg2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '7lzrf1n7': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'hd9he9i2': {
      'en': 'Remove',
      'ar': 'يزيل',
    },
    'e1t1sj21': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    '19qcrr8e': {
      'en': 'Preview',
      'ar': 'معاينة',
    },
    'j585huri': {
      'en': 'Add Video',
      'ar': 'أضف فيديو',
    },
    'r00agd7b': {
      'en': 'Remove ',
      'ar': 'يزيل',
    },
    'hcou0ieg': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'zcb3a1wa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'u3s3mpa8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7g58gned': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8rd0v84x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'q0h0z662': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'v5z955jp': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'udr3i1e6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xto3bs7k': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'bkmonstl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wb8o71se': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5hcnvt2y': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tj3r2zs7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'v1v673sm': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'abmt5470': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'flmyg0rj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    's0jhfu9k': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'x0g7xrll': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'osadsomm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'uxzeu2h6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'i6n5umz1': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fgafryxv': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ia63l885': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'we7087mz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'k9su3kr5': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // webNavLogsSubmenu
  {
    'v56noxzg': {
      'en': 'Email Log',
      'ar': '',
    },
    'pxzvfofi': {
      'en': 'Email Log',
      'ar': '',
    },
    'zs9leseg': {
      'en': 'Session Log',
      'ar': '',
    },
    'mn490sxa': {
      'en': 'User Session Log',
      'ar': '',
    },
    'jucjrzak': {
      'en': 'Activity Log',
      'ar': '',
    },
    '85smmapl': {
      'en': 'Activity Log',
      'ar': '',
    },
    'zbyabdoi': {
      'en': 'EMI Log',
      'ar': '',
    },
    '3nus6jyw': {
      'en': 'EMI Log',
      'ar': '',
    },
  },
  // SMS
  {
    '4w5or8p3': {
      'en': 'Do you really want to send the sms?',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    '44efwjac': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'tiydncbo': {
      'en': 'No',
      'ar': 'لا',
    },
  },
  // Log-EmailDetails
  {
    '8d9bo0l9': {
      'en': 'Details',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'c0wbjjpg': {
      'en': 'Attempts',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'qs5xdsy6': {
      'en': 'Start Date & Time',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'rne1m4mn': {
      'en': 'End Date & Time',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    '2mu25heq': {
      'en': 'Error',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    '6igyzxvk': {
      'en': 'Status',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
  },
  // Session_Log_details
  {
    'rdf9lx8l': {
      'en': 'User Session Details',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'bt80piwn': {
      'en': 'Device ID',
      'ar': 'اسم المستخدم',
    },
    '1alpmnc0': {
      'en': 'Login Time',
      'ar': 'متحرك',
    },
  },
  // Activity_Log_details
  {
    'sz81rewu': {
      'en': 'Activity Details',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'bhsa347z': {
      'en': 'Event ID',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'q0epgz38': {
      'en': 'Event Type',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'r9z7kbqr': {
      'en': 'Event Title',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    '1obwgkbo': {
      'en': 'Event Status',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'grl2qzns': {
      'en': 'Object',
      'ar': 'هل تريد حقا إرسال الرسائل القصيرة؟',
    },
    'ao0lw7qz': {
      'en': 'User Details',
      'ar': '',
    },
    'irwxtylc': {
      'en': 'Show less',
      'ar': '',
    },
    'xb6hokze': {
      'en': 'Show more',
      'ar': '',
    },
  },
  // Video_uploading_status
  {
    'ftxeu5x6': {
      'en': 'Video Uploaded.',
      'ar': '',
    },
    'j2bshrm4': {
      'en': 'Error: \"Not A Media File\"',
      'ar': '',
    },
  },
  // Video-UploadStatusChecker
  {
    'p51s1pkc': {
      'en': 'Uploading...',
      'ar': '',
    },
    'yuqmxbzw': {
      'en': 'Video is being processed, please check back later.',
      'ar': '',
    },
  },
  // Video-RemovePopup
  {
    'hdqhaeq8': {
      'en': 'Do you really want to remove the video?',
      'ar': '',
    },
    '0s96skll': {
      'en': 'Yes',
      'ar': '',
    },
    '0dc4ioco': {
      'en': 'No',
      'ar': '',
    },
  },
  // ManualNotification-Add
  {
    '3h1pu3qt': {
      'en': 'Select Course',
      'ar': '',
    },
    'vaacqwng': {
      'en': 'All',
      'ar': '',
    },
    'h42oa0lh': {
      'en': 'All',
      'ar': '',
    },
    'ywdhpky4': {
      'en': 'Single',
      'ar': '',
    },
    '3t9hduqi': {
      'en': 'CSS',
      'ar': '',
    },
    'ujs8chj5': {
      'en': 'JS',
      'ar': '',
    },
    '8ln119fn': {
      'en': 'ReactJs',
      'ar': '',
    },
    'g6pw8uvm': {
      'en': 'Select Course...*',
      'ar': '',
    },
    '7t31jv7x': {
      'en': 'Search...',
      'ar': '',
    },
    '8rk3fhsy': {
      'en': 'EMI Type',
      'ar': '',
    },
    'xvq2qhri': {
      'en': 'Second',
      'ar': '',
    },
    '5gt1hmaz': {
      'en': 'Second',
      'ar': '',
    },
    '9wgwn5lr': {
      'en': 'Third',
      'ar': '',
    },
    'buschq9y': {
      'en': 'Add Photo',
      'ar': '',
    },
    'e3mua2ek': {
      'en': 'Remove',
      'ar': '',
    },
    '5giezcql': {
      'en': 'Title*',
      'ar': '',
    },
    'wdqtxlul': {
      'en': '',
      'ar': '',
    },
    'mk2fixrb': {
      'en': 'Text*',
      'ar': '',
    },
    '2pinxl48': {
      'en': 'JS',
      'ar': '',
    },
    'e9s187j4': {
      'en': 'ReactJs',
      'ar': '',
    },
    'l98z03u2': {
      'en': 'Select Template...*',
      'ar': '',
    },
    'vxss3m2i': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '5mmnbcym': {
      'en': 'Send',
      'ar': '',
    },
    'u8qenarw': {
      'en': 'Field is required',
      'ar': '',
    },
    'g1137xam': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xpaablnx': {
      'en': 'Field is required',
      'ar': '',
    },
    'q4q0qrn9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // ManualNotification-Report
  {
    'jj4wgd39': {
      'en': 'Details',
      'ar': '',
    },
    'lslt2981': {
      'en': 'Created At',
      'ar': '',
    },
    '43ovs3xt': {
      'en': 'Mail Title',
      'ar': '',
    },
    'b0qrybyz': {
      'en': 'Title',
      'ar': '',
    },
    'dptedpkq': {
      'en': 'Text',
      'ar': '',
    },
    'b5gv4gjt': {
      'en': 'Course Type',
      'ar': '',
    },
    's37ozs5f': {
      'en': 'Course Name',
      'ar': '',
    },
    '3dn65vc8': {
      'en': 'EMI Type',
      'ar': '',
    },
    'sxr5l63d': {
      'en': 'Status',
      'ar': '',
    },
  },
  // webNavUserSubmenu1
  {
    '5v1nccs1': {
      'en': 'All',
      'ar': '',
    },
    'o3z98qro': {
      'en': 'All',
      'ar': '',
    },
    'w1x5rubu': {
      'en': 'Admin',
      'ar': '',
    },
    'nfkg7js8': {
      'en': 'Admin',
      'ar': '',
    },
    'ctj60bib': {
      'en': 'Instructor',
      'ar': '',
    },
    'b2itew2t': {
      'en': 'Instructor',
      'ar': '',
    },
    'nd9nrlm1': {
      'en': 'Student',
      'ar': '',
    },
    'nhcfy0s9': {
      'en': 'Student',
      'ar': '',
    },
    '2ztrty8d': {
      'en': 'Blocked',
      'ar': '',
    },
    'jdf6ct50': {
      'en': 'Blocked',
      'ar': '',
    },
    '0axq7zn0': {
      'en': 'Deleted',
      'ar': '',
    },
    'reclkmgl': {
      'en': 'Deleted',
      'ar': '',
    },
  },
  // Video-AttachedInfo
  {
    'qv26r6ma': {
      'en':
          'Do you really want to remove the video? The video is attached to the following courses:',
      'ar': '',
    },
    'mjoofm3q': {
      'en': 'Courses: ',
      'ar': '',
    },
    '01jasdq9': {
      'en': 'Lessons:',
      'ar': '',
    },
    'o2ssir4v': {
      'en': 'Yes',
      'ar': '',
    },
    '8cqj9zlv': {
      'en': 'No',
      'ar': '',
    },
  },
  // Video-FolderCreation
  {
    '3p6r4dvm': {
      'en': 'Folder name',
      'ar': '',
    },
    'ju1187ub': {
      'en': '',
      'ar': '',
    },
    'e0arbjhn': {
      'en': 'Create',
      'ar': '',
    },
    'q7s5s5j6': {
      'en': 'Field is required',
      'ar': '',
    },
    'v4omvkj0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Video-23_09ListForSelection
  {
    '1zbehtgt': {
      'en': 'Select Video here',
      'ar': '',
    },
    't54rziyc': {
      'en': 'Preview',
      'ar': '',
    },
  },
  // Video-FolderEdit
  {
    'kayluz5s': {
      'en': 'Folder name',
      'ar': '',
    },
    'hsbvqjzk': {
      'en': '',
      'ar': '',
    },
    '74568prb': {
      'en': 'Update',
      'ar': '',
    },
    'otpy6xsn': {
      'en': 'Field is required',
      'ar': '',
    },
    'hztiu1yx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '58n1dxme': {
      'en': '',
      'ar': '',
    },
    'byi7dj8m': {
      'en': '',
      'ar': '',
    },
    'e4zdsev2': {
      'en': '',
      'ar': '',
    },
    '65e2tfs2': {
      'en': '',
      'ar': '',
    },
    'ddazihx4': {
      'en': '',
      'ar': '',
    },
    'db03cpjj': {
      'en': '',
      'ar': '',
    },
    'fdb9078p': {
      'en': '',
      'ar': '',
    },
    '80ouzj9q': {
      'en': '',
      'ar': '',
    },
    '6rzhptp9': {
      'en': '',
      'ar': '',
    },
    'ce8c4ty0': {
      'en': '',
      'ar': '',
    },
    'up127qid': {
      'en': '',
      'ar': '',
    },
    'm3xhxk0l': {
      'en': '',
      'ar': '',
    },
    'ymitsutg': {
      'en': '',
      'ar': '',
    },
    'zcw6xwfs': {
      'en': '',
      'ar': '',
    },
    'kcvqa08x': {
      'en': '',
      'ar': '',
    },
    'dqrzd6sq': {
      'en': '',
      'ar': '',
    },
    'dpqtohyf': {
      'en': '',
      'ar': '',
    },
    'v01vf71s': {
      'en': '',
      'ar': '',
    },
    'gcv6def1': {
      'en': '',
      'ar': '',
    },
    'um9es99m': {
      'en': '',
      'ar': '',
    },
    'o4enbz4j': {
      'en': '',
      'ar': '',
    },
    '8z4tvfh7': {
      'en': '',
      'ar': '',
    },
    '2ybzla8x': {
      'en': '',
      'ar': '',
    },
    'd1wdf5i1': {
      'en': '',
      'ar': '',
    },
    '2ln7n9rw': {
      'en': '',
      'ar': '',
    },
    '2py80kgi': {
      'en': '',
      'ar': '',
    },
    'p6lsrh2a': {
      'en': '',
      'ar': '',
    },
    'ne8cclp9': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
