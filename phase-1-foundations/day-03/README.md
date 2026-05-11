# Day 3: Networking Tools on Linux

## Task 1: Host & Routing Diagnostics

### `ip`
- **What it does:** Displays network interfaces, MAC addresses, and their assigned IP addresses.
- **Key finding:** Shows multiple interfaces, such as your main network card (e.g., `eth0` or `wlan0`) and `lo` (loopback, `127.0.0.1`).
- **DevOps Context:** The loopback interface allows the system to communicate with itself internally without routing traffic over an actual network. If a web server like Nginx is bound only to `127.0.0.1`, it is completely inaccessible to the outside world—which is exactly what you want for a backend database, but a broken configuration for a public-facing web server.
### `ss` and `netstat`
- **What they do:** Show active network connections, socket states, and routing tables. `ss` is the faster, modern replacement for `netstat`.
- **Key finding:** Using flags like `-tuln` (TCP, UDP, Listening, Numeric ports) shows exactly which ports on the machine are open and actively waiting for connections.
- **DevOps/Security Context:** If an unexpected port (like 4444 or 1337) is in a `LISTEN` state, it is a massive red flag. It often indicates an attacker has successfully opened a backdoor or a reverse shell, waiting to walk right back into the system.

### `traceroute`
- **What it does:** Tracks the exact path (hops) that network packets take from your machine to a destination IP.
- **Key finding:** Shows every router along the way and the time it takes (latency) to reach each hop.
- **DevOps Context:** If a user complains about slow connections or timeouts, `traceroute` helps pinpoint exactly where the network is failing. If hops 1-5 are fast (e.g., 20ms), but hop 6 starts timing out or showing 500ms delays, you know the issue is a middleman ISP or routing problem, not your actual application server crashing.
## Task 2: DNS Resolution

### `dig` and `nslookup`
- **What they do:** Query the Domain Name System (DNS) to resolve a human-readable domain name (like `google.com`) into its actual IP address.
- **Key finding:** The "ANSWER SECTION" tells you exactly which IP address the internet currently believes your domain points to.
- **DevOps Context:** After migrating a website to a new server, you use `dig` to verify that the DNS records have successfully updated (propagated). If it returns the *new* IP, the migration worked. If it returns the *old* IP, your users are still being sent to the wrong server.

## Task 3: Web Requests

### `curl` and `wget`
- **What they do:** Command-line tools for making web requests over HTTP/HTTPS.
- **Key difference:** `curl` is built to interact with APIs, test endpoints, and view raw HTTP headers (like checking for a `200 OK` or `500 Server Error`). `wget` is built primarily for downloading files and saving them directly to your hard drive (e.g., downloading an installation file).
- **DevOps Context:** You will use `curl` constantly in bash scripts and CI/CD pipelines to verify if a web server is healthy and responding properly. You will use `wget` when provisioning a brand new server to download scripts or software packages without needing a GUI browser.

## Task 4: Packet Capture & Traffic Analysis

### `tcpdump`
- **What it does:** Captures raw network packets flowing in and out of your system's network interfaces.
- **Key finding:** Using filters like `port 80 or port 443` allows you to isolate only web traffic (HTTP/HTTPS) from the background noise, and the `-w` flag saves it to a `.pcap` file for deep analysis.
- **DevOps Context:** If an application is failing but the application logs show absolutely nothing, a DevOps or Security engineer will use `tcpdump` to capture the actual traffic on the wire. This proves whether packets are even reaching the server, being dropped by a firewall, or returning malformed data.

### Wireshark Analysis
- **What it does:** Provides a powerful graphical interface to dissect and analyze `.pcap` files packet by packet.
- **Key finding:** By filtering for `http`, you can clearly see the raw "conversation" between the client and server—specifically the HTTP Request (`GET`) asking for data, and the HTTP Response (e.g., `200 OK`) delivering it.
- **DevOps Context:** When an API or web app behaves strangely and logs aren't helping, viewing the raw packets in Wireshark removes all guesswork. You can see exactly what headers were sent, what the data payload looked like, and exactly how the server responded at the lowest network level.
