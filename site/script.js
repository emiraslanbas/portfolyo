// Footer'daki yılı güncel tut
document.getElementById('year').textContent = new Date().getFullYear();

// Bölümler ekrana girerken hafifçe belirsin
const items = document.querySelectorAll('.case, .card, .service, .steps, .about, .contact .wrap');
const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (!reduce && 'IntersectionObserver' in window) {
  items.forEach((el) => el.classList.add('reveal'));
  const io = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('in');
        io.unobserve(entry.target);
      }
    });
  }, { rootMargin: '0px 0px -8% 0px' });
  items.forEach((el) => io.observe(el));
}
