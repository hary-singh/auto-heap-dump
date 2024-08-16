# Auto Heap Dump Script

## Overview

This project contains a Bash script (`auto_dump.sh`) that monitors the heap memory usage of a Java process and triggers a heap dump if the usage exceeds a specified threshold.

## Features

- Monitors heap memory usage of a Java process.
- Triggers a heap dump when heap usage exceeds the defined threshold.
- Runs the check in a continuous loop with a configurable interval.

## Prerequisites

- Bash shell
- Java Development Kit (JDK) with `jcmd` tool
- `pgrep` command

## Usage

1. **Set the Threshold:**
   Modify the `THRESHOLD` variable in the script to set the desired heap usage percentage threshold. The default is 95%.

   ```
   THRESHOLD=95
    ```
2. **Run the Script:**
    Execute the script to start monitoring the heap memory usage.
    
    ```shell
    ./auto_dump.sh
    ```