const username = document.getElementById('username')
const password = document.getElementById('password')
const form = document.getElementById('form')
const errorElement = document.getElementById('error')
form.addEventListener('submit', (e) => {
    let messages = []
    if(password.length <= 8){
        messages.push('Password must be greater than 8 characters')
    }
    if (username.value === '' || username.value == null) {
        messages.push('Username is required')
    }
    if (messages.length > 0) {
        e.preventDefault()
        errorElement.innerText = messages.join(', ')
    }
})
