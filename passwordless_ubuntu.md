### ⚠️ **WARNING**

This disables password authentication entirely and significantly reduces system security. Only do this on a **local, offline, non-production test machine**.

---

## ✅ 1. Enable **automatic login**

Ubuntu uses **`GDM`** (GNOME Display Manager) by default. To enable automatic login:

### Edit GDM Config:

```bash
sudo nano /etc/gdm3/custom.conf
```

Uncomment (remove `#`) and modify these lines:

```ini
[daemon]
AutomaticLoginEnable=true
AutomaticLogin=your_username
```

Replace `your_username` with your act---

Let me know if you're using a different display manager (like LightDM or SDDM), or if you're on a headless server setup, and I’ll adjust the instructions.
ual username (use `whoami` to find it if unsure).

> Press `Ctrl+O`, then `Enter` to save. Press `Ctrl+X` to exit.

---

## ✅ 2. Disable password for `sudo` (optional, for full passwordless experience)

Edit the sudoers file using `visudo` (safe way):

```bash
sudo visudo
```

At the bottom, add this line:

```bash
your_username ALL=(ALL) NOPASSWD:ALL
```

Again, replace `your_username` with your actual username.

---

## ✅ 3. Optional: Disable lock screen (no password after wake or screen saver)

Run this command:

```bash
gsettings set org.gnome.desktop.screensaver lock-enabled false
```

---

## ✅ 4. Reboot and test

```bash
sudo reboot
```

Your machine should now:

* Boot straight into the desktop
* Not ask for a password at login
* Not ask for a password for `sudo`
* Not lock the screen
