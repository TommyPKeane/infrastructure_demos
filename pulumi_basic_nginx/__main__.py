"""A Python Pulumi program"""

import pulumi;
import pulumi_docker as docker;

nginx_image = docker.RemoteImage(
   "nginx",
   name= "nginx",
);

ngninx_container = docker.Container(
   "nginx",
   image= nginx_image.latest,
   hosts= [
      {
         "host": "nginx",
         "ip": "0.0.0.0",
      },
   ],
   ports= [
      {
         "internal": 80,
         "external": 8080,
      },
   ],
);
