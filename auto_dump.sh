#!/bin/bash

# Set the threshold to 95%
THRESHOLD=95

# Get the PID of the Java process
PID=$(pgrep -f 'java')

# Function to check heap memory usage
check_heap_usage() {
  # Use jcmd to get heap info
  HEAP_USAGE=$(jcmd $PID GC.heap_info | grep "used" | awk '{print $3}' | sed 's/,$//')
  HEAP_CAPACITY=$(jcmd $PID GC.heap_info | grep "capacity" | awk '{print $3}' | sed 's/,$//')

  # Calculate used heap percentage
  HEAP_PERCENT=$(echo "$HEAP_USAGE $HEAP_CAPACITY" | awk '{printf "%.0f", ($1/$2)*100}')

  echo "Heap memory usage: $HEAP_PERCENT%"

  if [ "$HEAP_PERCENT" -ge "$THRESHOLD" ]; then
    echo "Heap memory usage is above $THRESHOLD%. Taking a heap dump."

    # Trigger the heap dump
    jcmd $PID GC.heap_dump /path/to/heapdumps/heapdump-$(date +"%Y%m%d%H%M%S").hprof
  fi
}

# Run the check in a loop
while true; do
  check_heap_usage
  sleep 60  # Check every 60 seconds, adjust as needed
done
