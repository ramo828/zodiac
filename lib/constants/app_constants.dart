// Bürc adları və simvolları
class ZodiacConstants {
  static const List<Map<String, String>> zodiacSigns = [
    {'symbol': '♈', 'az': 'Qoç', 'tr': 'Koç'},
    {'symbol': '♉', 'az': 'Buğa', 'tr': 'Boğa'},
    {'symbol': '♊', 'az': 'Əkizlər', 'tr': 'İkizler'},
    {'symbol': '♋', 'az': 'Xərçəng', 'tr': 'Yengeç'},
    {'symbol': '♌', 'az': 'Şir', 'tr': 'Aslan'},
    {'symbol': '♍', 'az': 'Qız', 'tr': 'Başak'},
    {'symbol': '♎', 'az': 'Tərəzi', 'tr': 'Terazi'},
    {'symbol': '♏', 'az': 'Əqrəb', 'tr': 'Akrep'},
    {'symbol': '♐', 'az': 'Oxatan', 'tr': 'Yay'},
    {'symbol': '♑', 'az': 'Oğlaq', 'tr': 'Oğlak'},
    {'symbol': '♒', 'az': 'Dolça', 'tr': 'Kova'},
    {'symbol': '♓', 'az': 'Balıq', 'tr': 'Balık'},
  ];
}

// Tətbiq daxili ismarıclar və mətnlər
class AppStrings {
  // Giriş Ekranı (Login)
  static const String welcomeTitle = 'Bürc Aləminə Xoş Gəlmisiniz';
  static const String emailLabel = 'E-poçt';
  static const String emailHint = 'numune@burc.az';
  static const String passwordLabel = 'Şifrə';
  static const String passwordHint = 'Şifrənizi daxil edin';
  static const String loginButton = 'Daxil Ol';
  static const String forgotPassword = 'Şifrəmi Unutmuşam';

  // Qeydiyyat Ekranı (Register)
  static const String registerTitle = 'Yeni Qeydiyyat';
  static const String fullName = 'Ad və Soyad';
  static const String fullNameHint = 'Ad və soyadınızı daxil edin';
  static const String passwordRepeat = 'Şifrənin Təkrarı';
  static const String passwordRepeatHint = 'Şifrənizi təkrar daxil edin';
  static const String registerButton = 'Qeydiyyatdan Keç';

  // Ana Ekran (Home)
  static const String discoverTitle = 'Bürcünüzü Kəşf Edin';
  static const String appTitle = 'Bürc Aləmi';
  static const String detailInfoSuffix = 'bürcü haqqında ətraflı məlumatlar tezliklə əlavə olunacaq.';

  // Yan Menyu (Drawer)
  static const String menuTitle = 'Menyu';
  static const String aboutMenu = 'Haqqında';
  static const String termsMenu = 'Şərtlər və Qaydalar';

  // Dialogs
  static const String closeButton = 'Bağla';
  static const String agreeButton = 'Razı Oldum';
}

  // Şərtlər və Qaydalar Mətni
class AppTerms {
  static const String termsTitle = 'Şərtlər və Qaydalar';

  static const String termsContent = '''
1. Xidmət Şərtləri

Bu tətbiq ("Bürc Aləmi") aşağıda göstərilən şərtlər və qaydalar üzrə təqdim edilir. Tətbiqdən istifadə etməklə, bu şərtləri tam şəkildə qəbul etmiş olursunuz.

2. Məxfilik

Sizin şəxsi məlumatlarınız qorunmaqtadır. Biz heç bir halda üçüncü tərəflərə məlumatlarınızı satmayız və ya ötürmərərik.

3. Məqsəd

Bürc Aləmi tətbiqi, sırf eğlənmə məqsədilə əstrololoji məlumatlar təqdim edir. Tibbi, hukuki və ya maliyyə məsləhətləri vermir.

4. İstifadə Qaydaları

- Tətbiqi qanuni məqsədlər üçün istifadə edin
- Hüquqların pozuntusu halında məsuliyyət sizə aiddir
- Tətbiqin işləməsinə kəside gətirmə cəhdləri qadağandır

5. Məsuliyyətin Məhdudlaşdırılması

Tətbiq "O vaxtki kimi" təqdim olunur. Hər hansı problematik nəticələrə qarşı məsuliyyət daşımırıq.

6. Qanun

Bu şərtlər Azərbaycan Respublikasının qanunları ilə tənzimlənirlər.

7. Dəyişikliklər

Bu şərtləri istənilən vaxt dəyişə bilərik. Dəyişikliklərə razı olmamaq halında tətbiqdən istifadə edin.
''';
}

// Haqqında Mətni
class AppAbout {
  static const String aboutTitle = 'Haqqında';

  static const String aboutContent = '''
Bürc Aləmi - Astrololoji Kəşfiyyat Tətbiqi

Versiya: 1.0.0

Bu tətbiq, istifadəçilərə 12 burç əlamətinə dair məlumatlar vermək məqsədilə hazırlanmışdır. Gizəmli, futuristik və sənətli bir dizaynla səmaya və burcların dərinliklərinə səyahət edin.

Xüsusiyyətlər:
• Hareketli Aurora efektləri
• Yıldızlarla dolu gizəmli gəcə göyü
• Professional UI/UX Dizayn
• Hər burç üçün detaylı məlumat

Əslində, bu tətbiq əyləndirmə məqsədilə hazırlanmışdır. Astrolo, heç bir elmi əsas daşımır.

Geliştirme Ekibi: Bürc Aləmi

Bizi Dəstəkləyin:
Bu tətbiqdən xoşunuz gəldisə, 5 ulduz reytinq verin!

Qoşunun:
Sosial media hesaplarımızda bizi izləyin və yeni xəbərləri öyrənin.

İletişim:
Şikayət, təklif və tələbatlar üçün bizə yazın:
burcalemi@example.com

©2024 Bürc Aləmi. Bütün hüquqlar qorunur.
''';
}
