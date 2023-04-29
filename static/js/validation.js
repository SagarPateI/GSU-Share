function validation(event){

    // get the input elements by their id
    const username = document.getElementById('username')
    const password = document.getElementById('password')
    const passwordConfirmation = document.getElementById('cpassword')
    const email = document.getElementById('email')
    const form = document.getElementById('form')
    const errorElement = document.getElementById('error')

    // initialize variables for login attempts and parameters
    let loginAttempts = 0
    const maxLoginAttempts = 5
    const loginAttemptPeriodInMinutes = 10
    const loginAttemptsResetTime = loginAttemptPeriodInMinutes * 60 * 1000
    let lastLoginAttemptTime = new Date()

    // initialize an array to hold error messages and a list of common passwords
    let messages = []
    const commonPasswords = ['password', '123456', 'qwerty', 'letmein', 'password123']

    // calculate the time elapsed since the last login attempt
    const timeSinceLastLoginAttempt = new Date() - lastLoginAttemptTime

    // check if the maximum login attempts have been reached and if so, block further attempts for a certain period of time
    if (loginAttempts >= maxLoginAttempts && timeSinceLastLoginAttempt < loginAttemptsResetTime) {
        messages.push(`Too many login attempts. Please try again in ${loginAttemptsResetTime / 1000 / 60} minutes.`)
    } else {

        // validate the input fields and push error messages to the array if the input is not valid
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

        // reset login attempts and time if input is valid, otherwise increment loginAttempts counter
        if (messages.length === 0) {
            loginAttempts = 0 // Reset login attempts
            lastLoginAttemptTime = new Date()
        } else {
            loginAttempts += 1
        }        
    }

    // set the error message element text to the array of messages joined by commas
    errorElement.innerText = messages.join(', ')

    // prevent the form from submitting if there are error messages, otherwise allow submission
    if (messages.length > 0) {
        event.preventDefault()
        return false
    }

    return true
}
