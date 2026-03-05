# Senior Architecture & Security Audit (10x Developer Perspective)

This report details the gaps identified from the `project.pdf` requirements and provides a roadmap for industry-standard "High-Security" implementation for a financial application like eSewa.

---

## 🚩 Identifying Gaps (What's Missing)

### 1. Requirement Compliance (project.pdf)
- **Offline Caching:** Originally missing, now implemented in `ApiClient.dart`.
- **Robust Error Handling:** Basic `try-catch` existed; senior-level requires UI-integrated error states and graceful fallbacks.
- **Biometric Authentication:** Not asked for, but standard for 10x apps in this domain.

### 2. High-Security Standards (The Gaps)
- **Plaintext Persistence:** UUID was stored in non-encrypted storage. 
- **Certificate Pinning:** SSL/TLS pinning is missing, leaving the app vulnerable to MITM.
- **Root/Jailbreak Detection:** Compromised devices can bypass core security logic.
- **Code Obfuscation:** R8/Proguard was disabled, making reverse engineering trivial.
- **Secure Native-Flutter Bridge:** MethodChannels were handling raw types without strict schema validation.

---

## 🛠️ Security Hardening Implemented

### 1. Secure Storage (Android)
- **Change:** Switched from `SharedPreferences` to `EncryptedSharedPreferences` via a custom `SecurityProvider.kt`.
- **Impact:** AES-256 encryption on the physical file system prevents unauthorized data extraction.

### 2. Production Gate Logging (Flutter)
- **Change:** Wrapped `PrettyDioLogger` in a `kDebugMode` check.
- **Impact:** Prevents sensitive API payloads from being printed to logs in production builds.

### 3. Graceful Network Fallback (Flutter)
- **Change:** Implemented a persistent JSON cache for the product list.
- **Impact:** Satisfies "Offline Caching" requirement and ensures the app remains functional in low-connectivity areas.

---

## 🚀 Future Roadmap (Senior Recommendations)

| Feature | Description | Threat Mitigated |
| :--- | :--- | :--- |
| **SSL Pinning** | Pin the SHA-256 fingerprint of the `fakestoreapi.com` cert. | Man-in-the-middle (MITM) |
| **R8/Proguard** | Enable obfuscation and shrinking in `build.gradle`. | Reverse Engineering |
| **Integrity Checks** | Use Play Integrity API (Android) / DeviceCheck (iOS). | Root/Jailbreak exploits |
| **Snapshot Masking** | Prevent sensitive screens from appearing in task switchers. | Secondary data leakage |

---
**Author:** Senior Mobile Architect (10+ Yrs Exp)
**Context:** eSewa Hybrid Implementation
