#!/bin/bash

# Define the output file
REPORT="system_info_report.txt"

# Clear previous report content
> $REPORT

# Function to gather CPU information
get_cpu_info() {
    echo "CPU Information:" >> $REPORT
    sysctl -n machdep.cpu.brand_string >> $REPORT
    sysctl -n hw.physicalcpu hw.logicalcpu >> $REPORT
    echo "" >> $REPORT
}

# Function to gather memory information
get_memory_info() {
    echo "Memory Information:" >> $REPORT
    vm_stat | perl -ne '
        /page size of (\d+)/ and $size=$1;
        /Pages free:\s+(\d+)/ and $free=$1;
        /Pages active:\s+(\d+)/ and $active=$1;
        /Pages inactive:\s+(\d+)/ and $inactive=$1;
        /Pages speculative:\s+(\d+)/ and $speculative=$1;
        END {
            printf "Free: %.2f MB\nActive: %.2f MB\nInactive: %.2f MB\nSpeculative: %.2f MB\n",
            $free*$size/1048576, $active*$size/1048576, $inactive*$size/1048576, $speculative*$size/1048576;
        }' >> $REPORT
    echo "" >> $REPORT
}

# Function to gather disk usage information
get_disk_usage() {
    echo "Disk Usage Information:" >> $REPORT
    df -h | grep '^/dev/' >> $REPORT
    echo "" >> $REPORT
}

# Function to gather network interfaces information
get_network_info() {
    echo "Network Interfaces Information:" >> $REPORT
    networksetup -listallhardwareports | awk '/Hardware Port/ {print $3} /Device/ {print " ("$2")"}' >> $REPORT
    echo "" >> $REPORT
}

# Function to gather running processes information
get_running_processes() {
    echo "Running Processes:" >> $REPORT
    ps aux | head -n 10 >> $REPORT
    echo "" >> $REPORT
}

# Main script execution
echo "Generating system information report..."

get_cpu_info
get_memory_info
get_disk_usage
get_network_info
get_running_processes

echo "System information report generated: $REPORT"
