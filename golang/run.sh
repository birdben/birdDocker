CURRENT_UID=`whoami`
docker run -it -v /Users/yunyu/workspace_git/birdTracker:/home/golang/birdTracker --name golang_${CURRENT_UID} birdben/golang:v1
