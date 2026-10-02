# HackerOne Gateway — Ubuntu 24.04

## 1. Install WARP (first time only)

```bash
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg \
  | sudo gpg --yes --dearmor \
  -o /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ noble main" \
  | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

sudo apt update
sudo apt install -y cloudflare-warp
```

Check:

```bash
warp-cli --version
systemctl status warp-svc --no-pager
```

---

## 2. Add a New HackerOne Gateway Team

Get the **Team Name** from:

**HackerOne → Profile → User Settings → Gateway**

Then:

```bash
warp-cli registration new <TEAM_NAME>
```

Complete the browser authentication using the HackerOne account email.

Verify:

```bash
warp-cli registration show
```

---

## 3. Connect

```bash
warp-cli connect
```

Check:

```bash
warp-cli status
```

Expected:

```text
Status update: Connected
Network: healthy
```

---

## 4. Disconnect

```bash
warp-cli disconnect
```

---

## 5. Switch to Another Gateway Team

Disconnect first:

```bash
warp-cli disconnect
```

Then unregister the current team:

```bash
warp-cli registration delete
```

Register the new HackerOne Gateway:

```bash
warp-cli registration new <NEW_TEAM_NAME>
```

Authenticate in the browser, then:

```bash
warp-cli connect
warp-cli status
```

---

## 6. Useful Checks

```bash
warp-cli status
warp-cli registration show
warp-cli settings
```

Service:

```bash
systemctl status warp-svc --no-pager
```

## Current Experian Gateway

```text
Team: e47719c474d40956b054
Program: Experian Bounty Program
Access: Full
```

**Keep WARP connected while testing programs that require HackerOne Gateway.**
