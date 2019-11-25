# rgbAlpha

This repo contains all the code needed to reproduce *rgbAlpha*: an electronic-art didactic piece. There exists code for a master computer that takes input from exposition visitors, and code for 'slave' computers. The master computer guides users in the process of using the Red-Blue-Green-Alpha model to colour an abstract image. Slave computers draw and degrade pre-set versions of the image, user-coloured versions, and 'favorite' versions derived from user-input statisical analysis.

The repo also contains Database confiuration scripts as well as (Debian) Master and Slave computer configurations. In order for the code to run, all computers must have Processing installed and a working (hacked) wifi interface. The master computer must be running a MariaDB or Mysql server as well.
