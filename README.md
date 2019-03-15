# PiScoutingHotspot-gen2019
Raspberry Pi alternative to minutebots4536 Scouting2019

## Jump To
- [Usage/Building on Desktop](/README.md#usage)

=================================================================================
## Usage
0. Clone the **FRC_4536_2019** branch if you are planning on using this at a competition
1. Flash Raspbian on your Raspberry Pi
2. install Docker desktop from [www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
3. Select the following depending on your device
  - **Windows**   
    - Use **Powershell on Windows 10** and type the command `$ docker build -t 4536-<year>scouting-rpihotspot-gen`
      - note you will have to be in admin
  - **mac OS**
    - open **Terminal** and type `docker build -t 4536-<year>scouting-rpihotspot-gen`
4. Using Terminal/Powershell/Command Prompt type the following `$ docker image`. You should see something along the lines of 
```
REPOSITORY TAG    IMAGE ID     CREATED       VIRTUAL SIZE
4536-2019scouting-rpihotspot-gen    latest 3bc3545a1f64 3 minutes ago 8.31 MB
```
5. Make the .zip archive
  - find the **.img** file that windows or mac produced and make it into a .zip archive
6. flash it

=================================================================================
