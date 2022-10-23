# Ada 2020 - Generators/Coroutines prototype

This repository hosts a prototype for generators/coroutines support in Ada.
This prototype includes:

* a thin Ada binding to PCL (Portable Coroutine Library)
* a coroutine wrapper around it to integrate nicely with the GNAT runtime
* a generator library 

## Requirements

In order to use this prototype, one has first to install PCL (Portable
Coroutine Library): <http://www.xmailserver.org/libpcl.html> and make the
library and its headers available to the toolchain.

On Debian systems: `apt install libpcl1-dev`

## Local Changes and notes

__2022-10-23__
- Reorganized into a single gpr project built with Alire.
- Unknown license, no copyright info available.
- Tests are built with Alire, not run automatically. Many fail on accessibility checks.
