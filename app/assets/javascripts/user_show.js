document.addEventListener('DOMContentLoaded', () => {
  const headerNavItems = document.querySelectorAll('nav a');
 
  headerNavItems.forEach(node => (
    node.onclick = () => {
      const activeLi = document.querySelector('a.header-nav-active');
      activeLi.classList.remove('header-nav-active');
      return event.currentTarget.classList.add('header-nav-active');
    }
  ));
});