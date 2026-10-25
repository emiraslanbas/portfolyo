# Emir Aslanbaş · Portfolyo

Kişisel portfolyo sitem ve CV'm.

**Canlı site:** [emiraslanbas.netlify.app](https://emiraslanbas.netlify.app)

## Klasörler

```
site/                  Yayındaki site (Netlify'a bu klasör yükleniyor)
  index.html           Tüm içerik
  styles.css           Tasarım, açık ve koyu tema
  script.js            Kaydırırken bölümlerin belirmesi
  assets/              Proje görselleri
cv/
  cv.html              CV'nin kaynağı (A4, tek sayfa)
  render-cv.swift      cv.html'i PDF'e çevirir
```

## CV'yi PDF'e çevirmek

macOS'ta:

```bash
swift cv/render-cv.swift cv/cv.html site/Muhammed-Emir-Aslanbas-CV.pdf
```

## Teknik

Düz HTML, CSS ve JavaScript. Framework ya da derleme adımı yok. Telefona öncelikli, açık/koyu temaya göre değişen tasarım ve Google için schema.org `Person` verisi.
