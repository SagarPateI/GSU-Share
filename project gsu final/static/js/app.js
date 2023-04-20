const menu = document.querySelector('nav ul')
const hamburger = document.querySelector('nav .mobile')
hamburger.addEventListener('click', function () {
  if (menu) { menu.classList.toggle('show') }
})

const name = document.getElementById('name')
const password = document.getElementById('password')
const form = document.getElementById('form')
const errorElement = document.getElementById('error')
form.addEventListener('submit', (e) => {
  let message = []
  if (name.value === '' || name.value == null) {
    messages.push('Name is required')
  }
  if (messages.length > 0) {
    e.preventDefault()
    errorElement.innerText = messages.join(', ')
  }
})

// textarea counter
$('textarea').keyup(function () {

  var characterCount = $(this).val().length,
    current = $('#current'),
    maximum = $('#maximum'),
    theCount = $('#the-count');

  current.text(characterCount);


  /*This isn't entirely necessary, just playin around*/
  if (characterCount < 70) {
    current.css('color', '#666');
  }
  if (characterCount > 70 && characterCount < 90) {
    current.css('color', '#6d5555');
  }
  if (characterCount > 90 && characterCount < 100) {
    current.css('color', '#793535');
  }
  if (characterCount > 100 && characterCount < 120) {
    current.css('color', '#841c1c');
  }
  if (characterCount > 120 && characterCount < 139) {
    current.css('color', '#8f0001');
  }

  if (characterCount >= 140) {
    maximum.css('color', '#8f0001');
    current.css('color', '#8f0001');
    theCount.css('font-weight', 'bold');
  } else {
    maximum.css('color', '#666');
    theCount.css('font-weight', 'normal');
  }


});