# Automated System Information Report (sys-report)<img width="758" alt="Screenshot 2024-07-07 at 9 49 30 PM" src="https://github.com/Rishi-Sudhakar/sys-report/assets/79398572/0bfb19dd-c1a1-4291-b548-ab5b28c9d935">


This script generates a detailed system information report for macOS, including CPU, memory, disk usage, network interfaces, and running processes. The script is optimized for macOS and leverages macOS-specific commands and utilities.

## Features

- **CPU Information**: Displays the CPU brand string, number of physical CPUs, and logical CPUs.
- **Memory Information**: Provides statistics on free, active, inactive, and speculative memory.
- **Disk Usage Information**: Shows human-readable disk usage statistics.
- **Network Interfaces Information**: Lists all hardware ports and their corresponding devices.
- **Running Processes**: Displays the top 10 running processes.

## Requirements

- macOS
- Bash shell

## Usage

1. **Download the Script**
   
   Save the script to a file, for example `system_info_report.sh`.

2. **Make the Script Executable**

   Open Terminal and run the following command to make the script executable:
   ```sh
   chmod +x system_info_report.sh
   ```

3. **Run the Script**

   Execute the script by running:
   ```sh
   ./system_info_report.sh
   ```

4. **View the Report**

   The script generates a report named `system_info_report.txt` in the same directory. You can view the report using any text editor or by running:
   ```sh
   cat system_info_report.txt
   ```

## Script Details

### CPU Information

The script uses `sysctl` to gather and display the CPU brand string, number of physical CPUs, and logical CPUs.

### Memory Information

Memory statistics are gathered using `vm_stat` and processed with `perl` to calculate and format the free, active, inactive, and speculative memory.

### Disk Usage Information

Disk usage statistics are retrieved using `df -h`, filtering to show only relevant entries.

### Network Interfaces Information

Network interfaces are listed using `networksetup -listallhardwareports` and processed with `awk` to format the output.

### Running Processes

The top 10 running processes are displayed using `ps aux`.

## Example Output

The report file `system_info_report.txt` will contain output similar to:

<img width="758" alt="Screenshot 2024-07-07 at 9 49 30 PM" src="https://github.com/Rishi-Sudhakar/sys-report/assets/79398572/1cfdd917-8c85-493c-b34d-7f4772cde59d">


## License

This project is licensed under the MIT License. See the LICENSE file for details.
