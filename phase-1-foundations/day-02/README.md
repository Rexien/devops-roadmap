# Day 2: Process Management

## Objective
Master Linux process management, service configuration using `systemd`, and task automation with `cron`.

## Concepts Covered

### 1. Process Inspection & Control
- **`ps aux`**: Used to take a static snapshot of all running processes across all users.
- **`top` / `htop`**: Used for real-time, dynamic monitoring of processes, CPU, and Memory usage.
- **Backgrounding (`&`, `Ctrl+Z`, `bg`)**: Sending long-running tasks to the background so the terminal remains usable.
- **Foregrounding (`fg`)**: Bringing a background task back to the active terminal session.
- **Termination (`kill`, `kill -9`)**: Gracefully (`SIGTERM`) or forcefully (`SIGKILL`) terminating processes using their Process ID (`PID`).

### 2. CPU Priority (Niceness)
- **`nice`**: Starting a new process with a specific priority (-20 to 19). Lower numbers mean higher priority.
- **`renice`**: Changing the priority of an already running process.
- **Security Concept**: Regular users can only decrease a process's priority (make it "nicer"). Increasing priority (demanding more CPU) requires `sudo` privileges.

### 3. Service Management (`systemd`)
- Created a background Python HTTP service.
- **Unit Files**: Stored in `/etc/systemd/system/`. Require absolute paths for execution (`ExecStart`).
- **Core Commands**:
  - `sudo systemctl daemon-reload`: Refreshes systemd to recognize new unit files.
  - `sudo systemctl start <service>`: Starts the service immediately.
  - `sudo systemctl status <service>`: Checks if the service is running.
  - `sudo systemctl enable <service>`: Configures the service to start automatically upon server boot.

### 4. Task Automation (`cron`)
- **`crontab -e`**: Opens the cron configuration table.
- **Syntax**: `[Minute] [Hour] [Day_of_Month] [Month] [Day_of_Week] [Command]`
- **Example**: `*/5 * * * * uptime >> /tmp/uptime.log` logs the server uptime every 5 minutes.

## Deliverables
- [x] Python HTTP server running as a `systemd` daemon.
- [x] Cron job appending system uptime to a log file.
