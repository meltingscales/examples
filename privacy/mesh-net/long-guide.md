# Mesh-Only Secure Communications Guide (3-Page)

## 1. Objective
Build a **peer-to-peer, lawfully intercept-resistant communications device** by completely eliminating cellular hardware and leveraging encrypted mesh protocols.

## 2. Why Cellular Must Be Removed
- Cellular basebands have built-in lawful intercept (LI) hooks.
- Even airplane mode does not prevent triangulation and IMSI leaks.
- Once cellular hardware is present, it is a trusted \"backdoor\" into the system.

## 3. Hardware Options
| Device Type | Example | Cost | Notes |
|--|--|--|--|
| SBC (Single Board Computer) | Raspberry Pi 5 | $60 | Cheapest option |
| Open-Source Phone | Librem 5 | $800 | Remove cellular module |
| Pre-Built Mesh Device | Meshtastic T-Beam | $35 | Great for outdoor mesh |

## 4. Physical Communications
| Protocol | Range | Power Draw | Notes |
|--|--|--|--|
| LoRa | ~5-15km | Very Low | Works in remote areas |
| Wi-Fi (Ad-Hoc) | ~100m | Medium | Urban meshes |
| BLE Mesh | ~30m | Low | Indoor devices |

## 5. Logical Communications
| Layer | Protocol | Security Notes |
|--|--|--|
| Mesh Network | Yggdrasil / Meshtastic | All traffic encrypted between peers |
| Transport | Tor / I2P / Lokinet | Metadata and routing obfuscation |
| Application | Briar, XMPP+OMEMO | Strong E2EE (end-to-end encryption) |

## 6. Workflow - Step-by-Step
1. **Hardware Prep:** Install OS (Debian/Armbian) onto device. Physically remove cellular hardware (SIM slot, antennas if needed).
2. **Install & Configure Yggdrasil:** Install Yggdrasil on all nodes. Configure for local peer discovery (Wi-Fi/LoRa/BLE). 
3. **Secure Transport:** Install Lokinet or I2P. Route all traffic through the onion network.
4. **App Setup:** Install Briar for messaging and file transfer tools (secure scp over Yggdrasil).
5. **Test:** Confirm mesh auto-forms and test messaging.

## 7. Recommended Extras
- Periodic Key Rotation: Change Yggdrasil keys every 90 days.
- Cover Traffic: Broadcast junk traffic to mask real message patterns.
- Mesh Health Monitoring: Use Grafana or local dashboards to monitor node uptime and peer counts.

## 8. Time & Cost Breakdown
| Phase | Time | Cost (Min/Max) |
|--|--|--|
| Hardware Acquisition | 1 week | $120-$900 |
| Setup & Testing | 5-7 hours | Free (open source) |
| Deployment | Ongoing | Power/solar costs only |

## 9. Resources List
| Resource | Link | Notes |
|--|--|--|
| Yggdrasil Docs | https://yggdrasil-network.github.io | Core mesh software |
| Meshtastic | https://meshtastic.org | LoRa-based mesh for outdoor comms |
| Briar Project | https://briarproject.org | Peer-to-peer E2EE messaging |
| Lokinet | https://oxen.io/using/lokinet | Onion routing over mesh |
| Monero | https://www.getmonero.org | Anonymous payments if needed |

## Final Tip
**Keep cellular radios physically removed or disabled at the hardware level. A single accidental handshake with a tower can burn your operational security.**