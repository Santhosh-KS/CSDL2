# Insturctions to set up SYSTEM C Library interops in SWIFT
- `sudo apt install libsdl2-dev`
- ```sh
  pkg-config --list-all | grep "sdl2" # This gives you the name of the pkgconfig i.e "sdl2"
  ```
- ```sh
  pkg-config --cflags  --libs sdl2
   -D_REENTRANT -I/usr/local/include -I/usr/local/include/SDL2 -L/usr/local/lib -Wl,-rpath,/usr/local/lib -Wl,--enable-new-dtags -lSDL2
  ```
- Important things to note here is
  - `-I/usr/local/include/SDL2` i.e the path where the Header files are stored in the system.
  - `-lSDL2` i.e the lib name you need to use to link the system library in `module.modulemap`
- Add the above information in the [Package.swift](https://github.com/Santhosh-KS/CSDL2/blob/master/Package.swift) file
- ```sh
   .systemLibrary(
      name: "CSDL2",   # Name of the target
      pkgConfig: "sdl2",  # name of the pkg-config we obtained in previous steps
      providers: [.brew(["libsdl2"]), .apt(["libsdl2-dev"])]), # which command to use to install the system lib. Example: "sudo apt install libsdl2-dev" in debian linux

  ```
- For the `systemLibrary target` we created in the previous step we need to create a folder matching `name: "CSDL2"` and add the [module.modulemap](https://github.com/Santhosh-KS/CSDL2/blob/master/Sources/CSDL2/module.modulemap)
- import the `systemLibrary target` module in the [lib entry point](https://github.com/Santhosh-KS/CSDL2/blob/master/Sources/CSDL_1/CSDL.swift)
 
- Final folder structure 
  ```sh
  ├── Package.swift
  ├── README.md
  ├── Sources
  │   ├── CSDL_1
  │   │   └── CSDL.swift
  │   └── CSDL2
  │       └── module.modulemap
  └── Tests
      └── CSDLTests
          └── CSDLTests.swift
  ```
- [Example repo using this configurations](https://github.com/Santhosh-KS/CSDL2_User)

- [reference](https://github.com/apple/swift-package-manager/blob/main/Documentation/Usage.md)
