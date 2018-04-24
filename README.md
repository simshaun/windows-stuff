# Windows Subsystem For Linux

1. Install the Windows Subsystem for Linux.
2. Add the following to `~/.profile` then run `source ~/.profile`:  
  `PATH="$HOME/bin:$HOME/.local/bin:/usr/bin:$PATH"`  
   Reason: Though `npm` was installed in the subsystem, `npm` was still executing the Windows version.

## Helpful articles

- https://nickjanetakis.com/blog/using-wsl-and-mobaxterm-to-create-a-linux-dev-environment-on-windows
- https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly


# Miscellaneous

These are just some files I have to improve my quality of life when working in Windows.

NOTE: Some of the batch files reference .phar files. Find and place the phar files in the same directory.


# Stuff to Install

- **Clink** - http://mridgers.github.io/clink/  
  *Better CMD functionality* 

- **ConEmu** - http://conemu.github.io/en/  
  *Replaces the Windows CMD with something decent.*
  
- **KiTTY** - http://www.9bis.net/kitty/
  *A good SSH client.*
  
- **PuTTy** - http://www.putty.org/
  *SSH/Telnet client, handy for keygen*


# ConEmu

- For emoji support, go to `Settings / Environment` and add the following line:

        chcp utf8

- To replace Windows CMD prompt, go to `Settings / Integration / Default term` and check:
    - ✓ Force ConEmu as default terminal for console applications
    - ✓ Register on OS startup
