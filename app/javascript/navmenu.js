const btnMenu = document.querySelector("#menu");
const nav = document.querySelector(".nav");
const btnClose = document.querySelector("#close");

btnMenu.addEventListener('click', () => {
    nav.classList.add("nav--open");
})

btnClose.addEventListener('click', ()=> {
    nav.classList.remove("nav--open");
})