# Mesh-Only Secure Communications Guide (1-Page)

## Objective
Build a **fully mesh-capable, cellular-free communication device** resistant to lawful intercept (LI) and metadata collection.

## Required Components
| Component | Example Options | Cost |
|--|--|--|
| Hardware Platform | Raspberry Pi 5, Pine64, Librem 5 (cell removed) | $60-$800 |
| Radio | LoRa (RAK Wireless), Wi-Fi, Bluetooth | $30-$100 |
| Power | Battery Pack, Solar Panel (optional) | $20-$50 |
| Software | Yggdrasil, cjdns, Briar, Meshtastic, Lokinet | Free/Open Source |

## Network Stack
| Layer | Protocol | Notes |
|--|--|--|
| Physical | LoRa / Wi-Fi / BLE | No cellular allowed |
| Link | Mesh Protocol (Yggdrasil, Meshtastic) | Direct peer-to-peer links |
| Network | IPv6 Mesh (cjdns/Yggdrasil) | Self-assigning addresses |
| Transport | Lokinet / I2P / Tor | Obfuscated multi-hop transport |
| Application | Briar (messaging), XMPP+OMEMO | Full end-to-end encryption |

## Setup Workflow
1. Flash OS (Debian/Armbian/GrapheneOS without radios).
2. Disable cellular hardware (remove SIM slot if needed).
3. Install Yggdrasil or Meshtastic.
4. Configure peer discovery.
5. Route all app traffic through Tor/I2P.
6. Test with Briar and file-sharing apps.

## Costs
- Minimum viable setup: ~$120 (Pi 5, LoRa hat, battery).
- Premium build (Librem 5, solar, redundant radios): ~$900.

## Time
- Setup: 3-5 hours.
- Testing: 1-2 hours.
- Maintenance: Ongoing (firmware updates, key rotation).

## Critical Tip
**Never re-enable cellular, even for a second. Your identity (IMSI/IMEI) leaks immediately.**

## Key Resources
- [Yggdrasil Docs](https://yggdrasil-network.github.io)
- [Meshtastic](https://meshtastic.org)
- [Briar Project](https://briarproject.org)
- [Cjdns](https://github.com/cjdelisle/cjdns)
