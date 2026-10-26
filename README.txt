# RUTİN — iPhone için başlangıç paketi

Bu paket, RUTİN'in düzenlenebilir ilk web uygulaması taslağıdır.

## Şu an çalışanlar
- Koyu temalı mobil arayüz
- Günlük görev ekleme, tamamlama ve silme
- Alışkanlık ekleme, tamamlama ve silme
- Görev başına 10, alışkanlık başına 5 puan
- Üç aylık ödül seçeneği, ad/puan bedeli düzenleme
- Basit mevcut durum istatistikleri
- Tarayıcıda yerel kayıt
- İsteğe bağlı Supabase e-posta bağlantısı ve bulut kayıt kodu

## Henüz tamamlanmamış / sınırlamalar
- Bu paket henüz internette yayımlanmış bir site değildir.
- Bulut senkronizasyonu için kendi Supabase projenizi oluşturup SQL'i çalıştırmalı ve proje URL + publishable/anon key girmelisiniz.
- İlk sürümde gerçek tarih geçmişi ve doğru gün serisi hesabı yoktur.
- Puan/ay sınırı mantığı MVP seviyesindedir; ödülün gerçek hayatta uygulanması kullanıcıya bağlıdır.
- Gerçek iPhone bildirimleri henüz uygulanmadı. Web push için HTTPS barındırma, ana ekrana ekleme, izin ve sunucu tarafı bildirim altyapısı gerekir.
- Üretim kullanımı öncesi test ve güvenlik incelemesi yapılmalıdır.

## Kurulum (kod bilmeden)
1. Supabase hesabı oluşturun ve yeni bir proje açın.
2. Supabase Dashboard > SQL Editor'e gidin.
3. `supabase_setup.sql` dosyasının tamamını yapıştırıp Run'a basın.
4. Project Settings / API bölümünden Project URL ve publishable key (veya anon key) alın. `service_role` anahtarını ASLA kullanmayın.
5. `index.html` ve `manifest.json` dosyalarını HTTPS destekleyen bir statik hosting servisine yükleyin (ör. Netlify Drop veya GitHub Pages; bu aşamada bir hosting hesabı gerekir).
6. Siteyi iPhone'da Safari ile açın. Paylaş > Ana Ekrana Ekle adımlarını izleyin.
7. RUTİN > Bulut bağlantısını ayarla bölümüne proje URL'si ve publishable/anon key girin. E-posta adresinizi yazıp giriş bağlantısı isteyin.
8. E-postadaki bağlantıya aynı telefonda dokunun. Veritabanı tablo/RLS kuralları doğruysa uygulama buluta kaydedebilir.

## Önemli
- Parolanızı, e-posta giriş bağlantınızı veya service-role key'inizi kimseyle paylaşmayın.
- Uygulama kodunda yalnızca publishable/anon key kullanılmalıdır; güvenlik RLS kurallarıyla sağlanır.
- Bu paket gerçek bir App Store uygulaması değildir; ana ekrana eklenen web uygulamasıdır.
