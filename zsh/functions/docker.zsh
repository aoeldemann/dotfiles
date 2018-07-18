# update all docker images
dup() {
  docker images | grep -v REPOSITORY | awk '{print $1}' | xargs -L1 docker pull
}

# delete all docker images
drmi() {
  docker images | grep -v 'IMAGE ID' | awk '{print $3}' | xargs -L1 docker rmi
}
