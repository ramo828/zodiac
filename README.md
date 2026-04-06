# Bürc Aləmi 🌌✨

**Bürc Aləmi**, istifadəçilərə qabaqcıl "Glassmorphism" (buzlu cam efekti) dizayn dili ilə 12 fərqli bürc haqqında maraqlı və cəlbedici vizual məlumatlar təqdim edən müasir bir **Flutter** proqramıdır.

UI/UX tərəfində tamamilə qaranlıq kosmos (Dark Space) və işıqlı səhər (Light Aurora) temalarına sahib olub, pürüzsüz və zərif animasiyalar, mükəmməl rəng qradiyentləri ilə istifadəçi təcrübəsini zirvəyə qaldırır.

---

## 🚀 Xüsusiyyətlər

- **Glassmorphism UI:** Bütün giriş (TextField), düymə (Button) və kart (Card) komponentləri şəffaf formadadır və real arxa planı bulanıq göstərir (`BackdropFilter`).
- **Gecə / Gündüz Rejimi:** Material 3 standartlarında, Neon rənglərlə və animasiyalı xüsusi `AnimatedThemeSwitch` düyməsi ilə idarə olunan ikili tema.
- **Təkmilləşdirilmiş Performans:** Dəfələrlə təkrar yazılmış kod parçaları (Spagetti kodu) yenidən qurularaq (Refactoring) Tək Arxa Plan İdarəçisi (`BackgroundWrapper`) kimi modullar formasına salınmışdır.
- **PageView Scroll Sistemi:** Ekranlar arası tam səlis keçid imkanı.

---

## 🛠 İstifadədə Olan Texnologiyalar

- **Framework:** Flutter (Dart)
- **Vəziyyət İdarəetməsi (State Management):** `provider` (Karanlıq/İşıqlı tema və s. üçün)
- **UI Kit:** Flutter Material Design & xüsusi `ClipRRect + BackdropFilter` kombinasiyaları.

---

## 📂 Layihənin Quruluşu (Təmiz Arxitektura)

Layihə təmiz proqramlaşdırma standartlarına (Clean Code) uyğun olaraq dizayn edilmişdir:

```text
lib/
├── config/              # Tətbiqin dizayn və rəng tənzimləmələri (Gradientlər, opacity və s.)
├── constants/           # Azərbaycan dilində bütün sabit mətnlər (AppStrings) və Bürc siyahıları
├── providers/           # Vəziyyət idarəçiləri (ThemeProvider)
├── screens/             # Bütün fərqli ekranlar (Giriş, Qeydiyyat, Ana Ekran, Detal Ekranı)
├── theme/               # Material 3 xüsusi tema məlumatları
└── widgets/             # Təkrar istifadəsi mümkün olan zərif UI elementləri (CustomTextField, BackgroundWrapper və s.)
```

---

## 🖥 Quraşdırma və İşə Salma

Layihəni lokal kompyuterinizdə sınamaq üçün aşağıdakı addımları izləyin:

1. **Repozitoriyanı klonlayın və ya əldə edin**
2. **Lazımi paketləri yükləyin**
   ```bash
   flutter pub get
   ```
3. **Tətbiqi işə salın**  
   Simulyatorda və ya qoşulu fiziki cihazda yoxlamaq üçün:
   ```bash
   flutter run
   ```

---

## 🎨 UI/UX Mövzusu və Daxili Dəyişikliklər

- Bu tətbiq əvvəlki versiyalara nəzərən ciddi kod təmizlənməsindən (Refactoring) keçmişdir. Bütün kodlar modulyarlaşdırılmış və təkrar yazılmanın qarşısı alınmışdır.
- TextField tipli yazı sahələrinin həm arxa planının `fillColor` rəndərlənməsi xətaları `RepaintBoundary` məntiqi ilə həll edilmişdir.
- Gərəksiz şərhlər aradan qaldırılmış və tamamilə cəmiyyət tərəfindən qəbul edilmiş Azərbaycan dilinə lokalizasiya edilmişdir.

---

*© 2024 Bürc Aləmi. Barcha hüquqlar qorunur.*
# zodiac
