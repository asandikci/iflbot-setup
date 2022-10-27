![Logo](https://github.com/danielpinto8zz6/c-cpp-compile-run/raw/HEAD/resources/logo.png)

# C/C++ Compile Run extension

![Github CI](https://github.com/danielpinto8zz6/c-cpp-compile-run/actions/workflows/ci.yml/badge.svg)
[![Marketplace Version](https://vsmarketplacebadges.dev/version-short/danielpinto8zz6.c-cpp-compile-run.png)](https://marketplace.visualstudio.com/items?itemName=danielpinto8zz6.c-cpp-compile-run)
[![Downloads](https://vsmarketplacebadges.dev/downloads-short/danielpinto8zz6.c-cpp-compile-run.png)](https://marketplace.visualstudio.com/items?itemName=danielpinto8zz6.c-cpp-compile-run)
[![Rating](https://vsmarketplacebadges.dev/rating-short/danielpinto8zz6.c-cpp-compile-run.png)](https://marketplace.visualstudio.com/items?itemName=danielpinto8zz6.c-cpp-compile-run)


An extension running on [Visual Studio Code](https://code.visualstudio.com) to **Compile & Run** single c/c++ files easily

## Features

Compile & Run C/C++ opened file directly from the command palette or by pressing 'f6' or 'f7'

## Requirements

* If you are on linux you must install gcc ([see instructions](https://github.com/danielpinto8zz6/c-cpp-compile-run/blob/HEAD/docs/COMPILER_SETUP.md#Linux))
* If you are on window you must install tdm-gcc ([see instructions](https://github.com/danielpinto8zz6/c-cpp-compile-run/blob/HEAD/docs/COMPILER_SETUP.md#Windows))
* If you are on mac os you must install clang ([see instructions](https://github.com/danielpinto8zz6/c-cpp-compile-run/blob/HEAD/docs/COMPILER_SETUP.md#MacOS))
## How to use
Make sure you have .c or .cpp file open.
Press "F6", this will compile and run the file using default arguments in settings.
Or press "F7", this will use the arguments you specify for the program.
If you want to register gcc/g++ path manually, you can set it under settings.
You can also set to save file before compiling.

## Configurations
| Key | Description |
| ------------ | ------------ |
| c-cpp-compile-run.c-compiler | The C compiler path (e.g: /usr/bin/gcc or C:\\TDM-GCC-64\\bin\\gcc.exe) |
| c-cpp-compile-run.cpp-compiler | The Cpp compiler path (e.g: /usr/bin/g++ C:\\TDM-GCC-64\\bin\\gcc.exe) |
| c-cpp-compile-run.save-before-compile | Whether should save the file before compiling |
| c-cpp-compile-run.c-flags | The C flags: e.g. -Wall. default: -Wall -Wextra |
| c-cpp-compile-run.cpp-flags | The Cpp flags: e.g. -Wall. default: -Wall -Wextra |
| c-cpp-compile-run.run-args | The run arguments |
| c-cpp-compile-run.run-in-external-terminal | Whether should run in an external terminal |
| c-cpp-compile-run.should-show-notifications | Whether should show notifications |
| c-cpp-compile-run.output-location | Custom output location for the compiled file |

## Keybindings
| Linux  | Windows | Mac | Description  |
| ------------ | ------------ | ------------ | ------------ |
| f6  | f6 | cmd+r | Compiles and runs the file  |
| crtl+6  | ctrl+6 | cmd+6 | Compiles and runs the file  |
| f8  | f8 |	cmd+y  | Compiles and run the file in external console  |
| f7 | f7 | cmd+t | Compiles and run the file specifying custom arguments and flags  |

## Release Notes

Refer to [CHANGELOG](https://github.com/danielpinto8zz6/c-cpp-compile-run/blob/HEAD/CHANGELOG.md)

## Donation

If you like this extension, you can donate via **[PayPal](https://www.paypal.me/danielpinto8zz6)**. It will help me to spend more time improving this!
