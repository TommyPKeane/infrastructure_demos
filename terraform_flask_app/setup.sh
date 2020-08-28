image_name="webapp"; # Also known as the "tag"
docker_file="./webapp.dockerfile";

docker build -t ${image_name} -f ${docker_file} .;
