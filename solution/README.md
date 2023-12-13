Question 1,2)

touch inputdata
docker run -v /home/sky/Downloads/abcd/dec6/csvserver/solution/inputdata:/csvserver/inputdata infracloudio/csvserver



Question 3) created script 

$ cat gencsv.sh

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

start_index=$1
end_index=$2

if ! [[ "$start_index" =~ ^[0-9]+$ && "$end_index" =~ ^[0-9]+$ ]]; then
    echo "Error: Arguments must be integers."
    exit 1
fi

if [ "$start_index" -ge "$end_index" ]; then
    echo "Error: Start index must be less than end index."
    exit 1
fi

output_file="inputFile"

for ((i = start_index; i <= end_index; i++)); do
    rand_num=$((RANDOM % 1000))  # Generate a random number between 0 and 999
    echo "$i, $rand_num" >> "$output_file"
done

echo "File $output_file generated with entries from $start_index to $end_index."


Question 4)

docker run -dv /home/sky/Downloads/abcd/dec6/csvserver/inputFile:/csvserver/inputdata infracloudio/csvserver



Question 5)

docker ps -a
CONTAINER ID   IMAGE                    COMMAND                  CREATED             STATUS             PORTS      NAMES
91cf3d41e5de   infracloudio/csvserver   "/csvserver/csvserver"   About an hour ago   Up About an hour   9300/tcp   stupefied_germain

docker exec -it 91cf3d41e5de /bin/bash

docker stop 91cf3d41e5de

docker rm 91cf3d41e5de

Question 6)

docker ps -a
CONTAINER ID   IMAGE                    COMMAND                  CREATED             STATUS             PORTS      NAMES
91cf3d41e5de   infracloudio/csvserver   "/csvserver/csvserver"   About an hour ago



[root@91cf3d41e5de csvserver]#docker exec -it 91cf3d41e5de /bin/bash

[root@91cf3d41e5de csvserver]# 
[root@91cf3d41e5de csvserver]# netstat -tulpn | grep LISTEN

tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver 



docker run -d -p 9393:9300 -e CSVSERVER_BORDER=Orange -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver
