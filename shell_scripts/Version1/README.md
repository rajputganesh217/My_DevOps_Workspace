
# 🐧 Bash Automation Scripts Collection

A collection of 25 practical Bash shell scripts  designed for system administrators, DevOps engineers, and Linux enthusiasts.
Each script automates a common system or server management task — from monitoring and backups to user management and reporting.

---

## 📂 Repository Overview

| #  | Script Name              | Description                                             |
| -- | ------------------------ | ------------------------------------------------------- |
| 1  | `01_list_files.sh`       | List all files in a directory and save to a text file   |
| 2  | `02_disk_usage.sh`       | Monitor disk usage and send alert if threshold exceeded |
| 3  | `03_service_status.sh`   | Check if a service is running and restart if stopped    |
| 4  | `04_backup.sh`           | Backup directory to a remote server via rsync           |
| 5  | `05_check_update.sh`     | Automatically update software packages                  |
| 6  | `06_compress.sh`         | Compress and archive old log files                      |
| 7  | `07_system_report.sh`    | Generate system resource usage report                   |
| 8  | `08_checksite.sh`        | Check website availability                              |
| 9  | `09_del_dir_files.sh`    | Delete files matching a pattern                         |
| 10 | `10_ip_details.sh`       | Extract AWS EC2 instance info from JSON                 |
| 11 | `11_add_user_fr_csv.sh`  | Add multiple users from a CSV file                      |
| 12 | `12_rsync_dir.sh`        | Sync local directory with remote server                 |
| 13 | `13_vertual_host.sh`     | Setup Apache virtual host                               |
| 14 | `14_dir_diff.sh`         | Compare two directories                                 |
| 15 | `15_last_access_days.sh` | Find files not accessed for specific days               |
| 16 | `16_arrange_file.sh`     | Organize files by type (Images, Docs, Audio, Others)    |
| 17 | `17_failed_ssh.sh`       | Report failed SSH login attempts                        |
| 18 | `18_moniter_file.sh`     | Monitor file changes in real time                       |
| 19 | `19_mysql_auto.sh`       | Create MySQL database and user automatically            |
| 20 | `20_weather.sh`          | Retrieve current weather via API                        |
| 21 | `21_user_space_info.sh`  | Calculate disk usage by user                            |
| 22 | `22_mail_summery.sh`     | Send daily log summary via email                        |
| 23 | `23_search_repl.sh`      | Search and replace text in multiple files               |
| 24 | `24_file_rename.sh`      | Rename multiple files sequentially                      |
| 25 | `25_new_users.sh`        | Report users created in last 24 hours                   |



## 🧰 Prerequisites

Some scripts need specific tools.
Here’s a quick list of packages you may need to install (depending on your Linux distribution):

| Tool            | Purpose                    | Install Command (RHEL/CentOS)       |
| --------------- | -------------------------- | ----------------------------------- |
| `mailx`         | For sending emails         | `sudo yum install mailx -y`         |
| `rsync`         | For remote sync and backup | `sudo yum install rsync -y`         |
| `jq`            | For JSON parsing           | `sudo yum install jq -y`            |
| `curl`          | For API and web access     | `sudo yum install curl -y`          |
| `inotify-tools` | For file monitoring        | `sudo yum install inotify-tools -y` |
| `httpd`         | Apache web server          | `sudo yum install httpd -y`         |
| `mysql`         | MySQL client               | `sudo yum install mysql -y`         |

---

## 🔒 Permissions

* Some scripts must be run as **root** or with **sudo** privileges.
  Examples:

  * `03_service_status.sh`
  * `11_add_user_fr_csv.sh`
  * `13_vertual_host.sh`
  * `19_mysql_auto.sh`

---

## 🧩 Directory Structure

```
bash-scripts/
│
├── 01_list_files.sh
├── 02_disk_usage.sh
├── 03_service_status.sh
│
├── ...
│
├── 25_new_users.sh
│
└── README.md
```

---





---
