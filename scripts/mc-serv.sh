#!/bin/bash

# Change these variables to your server's settings
SERVER_DIR="/home/nathan/mc/fabric-2024" 
SERVER_JAR="fabric-server.jar"
JAVA_DIR="/usr/lib/jvm/java-21-openjdk/bin/java"

case $1 in
    start)
        echo "Starting server..."
        cd $SERVER_DIR
        nohup $JAVA_DIR -Xmx6G -jar $SERVER_JAR nogui > /dev/null 2>&1 &
        ;;
    stop)
        echo "Stopping server..."
        
        # Get the PID of the Java process running the server
        PID=$(pgrep -f "$SERVER_JAR")

        if [ -n "$PID" ]; then
            kill $PID && echo "Server stopped with PID $PID."
        else
            echo "No running server found."
        fi
        ;;
    restart)
        echo "Restarting server..."
        $0 stop  
        sleep 5  
        $0 start 
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac