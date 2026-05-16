# Mini Katalog Uygulaması

Flutter ile geliştirilmiş basit bir ürün katalog uygulaması. Flutter haftalık eğitim projesi kapsamında hazırlanmıştır.

## Özellikler

- Ana sayfa (karşılama ekranı)
- Ürün listesi (GridView)
- Kategori filtreleme (FilterChip + setState)
- Ürün detay sayfası
- Favori ekleme (state güncelleme)
- Sepete ekle butonu (SnackBar geri bildirimi)
- JSON'dan veri okuma (assets/data/products.json)
- Navigator ile sayfa geçişleri
- Route Arguments (ürün nesnesi aktarımı)

## Kullanılan Flutter Sürümü

Flutter 3.x (Dart 3.0+)

## Klasör Yapısı

```
mini_katalog/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── product.dart
│   └── screens/
│       ├── home_screen.dart
│       ├── product_list_screen.dart
│       └── product_detail_screen.dart
├── assets/
│   └── data/
│       └── products.json
└── pubspec.yaml
```

## Çalıştırma Adımları

```bash
# 1. Bağımlılıkları yükle
flutter pub get

# 2. Emülatörü başlat (Android Studio'dan) veya cihazı bağla

# 3. Uygulamayı çalıştır
flutter run
```

## Ekran Görüntüleri

| Ana Sayfa | Ürün Listesi | Ürün Detayı |
|-----------|-------------|-------------|
| Karşılama ekranı | GridView + filtre | Detay + sepet |
