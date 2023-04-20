const username = document.getElementById('username')
const password = document.getElementById('password')
const passwordConfirmation = document.getElementById('cpassword')
const email = document.getElementById('email')
const form = document.getElementById('form')
const errorElement = document.getElementById('error')

let loginAttempts = 0
const maxLoginAttempts = 5
const loginAttemptPeriodInMinutes = 10
const loginAttemptsResetTime = loginAttemptPeriodInMinutes * 60 * 1000
let lastLoginAttemptTime = new Date()

form.addEventListener('submit', (e) => {
    let messages = []
    const commonPasswords = ['password', '123456', 'qwerty', 'letmein', 'password123']
    const timeSinceLastLoginAttempt = new Date() - lastLoginAttemptTime
    if (loginAttempts >= maxLoginAttempts && timeSinceLastLoginAttempt < loginAttemptsResetTime) {
        messages.push(`Too many login attempts. Please try again in ${loginAttemptsResetTime / 1000 / 60} minutes.`)
    } else {
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
        if (password.value !== passwordConfirmation.value) {
            messages.push('Passwords do not match')
        }
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        if (!emailRegex.test(email.value)) {
            messages.push('Invalid email')
        }
        if (messages.length === 0) {
            loginAttempts = 0 // Reset login attempts
            lastLoginAttemptTime = new Date()
        } else {
            loginAttempts += 1
            e.preventDefault()
        }
    }
    errorElement.innerText = messages.join(', ')
})
