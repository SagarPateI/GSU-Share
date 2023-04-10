const menu = document.querySelector('nav ul')
const hamburger = document.querySelector('nav .mobile')
hamburger.addEventListener('click', function(){
    if(menu)
    {menu.classList.toggle('show')}
})