const username = document.getElementById('username')
const password = document.getElementById('password')
const form = document.getElementById('form')
const errorElement = document.getElementById('error')
form.addEventListener('submit', (e) => {
    let messages = []
    const commonPasswords = ['password', '123456', 'qwerty', 'letmein', 'monkey']
    if (username.value === '' || username.value == null) {
        messages.push('Username is required')
    }
    if (username.value.length < 5) {
        messages.push('Username must be at least 5 characters long')
    }
    if (password.value.length < 8) {
        messages.push('Password must be at least 8 characters long')
    }
    if (commonPasswords.includes(password.value.toLowerCase())) {
        messages.push('Password is too common. Please choose a stronger password.')
    }
    if (messages.length > 0) {
        e.preventDefault()
        errorElement.innerText = messages.join(', ')
    }
})

