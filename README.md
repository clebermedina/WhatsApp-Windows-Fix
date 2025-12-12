# 🤖 WhatsApp Fix RuntimeBroker - Anti-Freezing Solution for Windows 10/11 App

[![Version](https://img.shields.io/badge/Version-1.0-blue.svg)](https://github.com/clebermedina)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/clebermedina/whatsapp-fix/blob/main/LICENSE)

## When WhatsApp Windows 10/11 APP freezes — this script fixes it

The official **WhatsApp application (Microsoft Store version for Windows 10/11)** is known to suffer from issues where, after some use, it freezes or lags, and the native Windows process, `RuntimeBroker.exe`, starts consuming excessive CPU and memory resources.

This tool installs a discreet and lightweight Windows service to automatically monitor and fix this behavior, ensuring WhatsApp runs smoothly.

---

### ⚙️ How the Fix Works

The solution operates by checking the status of `WhatsApp.exe` every 6 seconds. If the application is running, it executes a safe command to terminate the `RuntimeBroker.exe` process. Windows instantly recreates this process, resolving the excessive resource consumption cycle and unfreezing WhatsApp immediately.

| Feature | Detail |
| :--- | :--- |
| **Target Problem** | `RuntimeBroker` eats CPU/RAM due to glitches in the **Windows 10/11 Store version** of WhatsApp. |
| **Mechanism** | Monitoring service active every **6 seconds**. |
| **Action** | Safely terminates `RuntimeBroker.exe`. |
| **Safety** | **100% safe**, as `RuntimeBroker` is designed by Microsoft to be instantly recreated upon termination. |

---

### 🚀 Installation and Usage

#### Prerequisites
* Operating System: **Windows 10 or Windows 11.**
* Privileges: The script must be run as **Administrator** to install the service.

1.  **Download:** Download the file `WhatsAppFix-1.0.bat`.
2.  **Execution:** Right-click the file and select **"Run as administrator"**.
3.  **Installation:** Select the language, and then choose option **`[1] Install service (hidden)`**.
4.  **Verification:** The service will now run automatically in the background.

#### How to Uninstall

Execute the `WhatsAppFix-1.0.bat` script again as Administrator and select option **`[2] Remove service`**. This will stop and remove the service, and delete all installed files in the `%APPDATA%\WhatsAppFix` folder.

---

### 💻 Technical Details

#### Languages and Dependencies

| Technology | Primary Purpose | Official Website |
| :--- | :--- | :--- |
| **Batch Script (.bat)** | Orchestration of installation, removal, and menu interface. | N/A (Windows Native) |
| **NSSM** | **Critical dependency**. Used to convert the monitoring script into an auto-starting Windows Service. | [nssm.cc/](https://nssm.cc/) |
| **PowerShell** | Used internally within the Batch script to download and unpack the NSSM binary during installation. | N/A (Windows Native) |

#### Installed Service Structure

Upon installation, the script creates the `%APPDATA%\WhatsAppFix` folder and places the `nssm.exe` executable and the monitoring script (`kill.bat`) inside it. The service is named **`WhatsAppFixRuntime`**.

**Content of `kill.bat`:**

This is the lightweight script that the service executes every 6 seconds:

```batch
:loop
tasklist /fi "imagename eq WhatsApp.exe" 2>nul | find /i "WhatsApp.exe" >nul
if %errorlevel%==0 taskkill /f /im RuntimeBroker.exe >nul 2>&1
timeout /t 6 >nul
goto loop
```

---

### 🙋 Contact and Support

#### 🧑‍💻 Author
* **Name:** Cleber Medina
* **📧 Email/Contact:** clebermedina@gmail.com
* **🔗 LinkedIn:** [linkedin.com/in/clebermedina](https://linkedin.com/in/clebermedina)

#### ❤️ Support the Project
If this project solved your WhatsApp issues, please consider supporting the development!

* **☕ PIX / PayPal:** `clebermedina@gmail.com`
