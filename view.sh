#!/bin/bash
continername=elasticsearch-`whoami`;
sudo docker exec -it ${continername} /bin/bash