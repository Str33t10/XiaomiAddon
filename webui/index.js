/**
 * Execute shell commands with ksu.exec
 * @param {string} command -  shell command to execute
 * @returns {Promise<string>} - A promise that resolves with stdout content
 * @throws {Error} If command execution fails with:
 *   - stderr in error message
 */
async function exec(command) {
    const callbackName = `exec_callback_${Date.now()}`;
    return new Promise((resolve, reject) => {
        window[callbackName] = (errno, stdout, stderr) => {
            delete window[callbackName];
            errno === 0 ? resolve(stdout) : reject(stderr);
        };
        try {
            ksu.exec(command, "{}", callbackName);
        } catch (error) {
            console.error("Unable to execute command:", error)
        }
    });
}

// Function to toast message
function toast(message) {
    try {
        ksu.toast(message);
    } catch (error) {
        console.error("Unable to toast message:", error)
    }
}

// Initial load
document.addEventListener('DOMContentLoaded', async () => {
     exec('am start -n com.android.camera/.CameraPreferenceActivity')
    .then(() => {
      toast('Camera Preference')
      console.log('Camera is ready!')
      })
    .catch(err => {
      toast('Camera not found')
      console.log('Camera is not ready!')
      console.error(err)
    })
});