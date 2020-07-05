# Custom PHP build scripts for our PocketMine-MP environment

## compile.sh

Bash script used to compile PHP on MacOS and Linux platforms. Make sure you have ``make autoconf automake libtool m4 wget getconf gzip bzip2 bison g++ git cmake pkg-config``.

### Additional notes
#### Mac OSX (native compile)
- Most dependencies can be installed using Homebrew
- You will additionally need `glibtool` (GNU libtool, xcode libtool won't work)
- You also MUST specify target as `mac` or `mac64` if building for Mac, on Mac.

| Script flags | Description                                                                           |
| ------------ | ------------------------------------------------------------------------------------- |
| -d           | Will compile with debug and the xdebug PHP extension                                  |
| -f           | Enabling abusive optimizations...                                                     |
| -g           | Will compile GD2                                                                      |
| -j           | Set make threads to #                                                                 |
| -s           | Will compile everything statically                                                    |
| -t           | Set target                                                                            |
| -u           | Will compile PocketMine-ChunkUtils C extension (recommended if using PC Anvil worlds) |
| -x           | Specifies we are doing cross-compile                                                  |
| -l           | Will compile with intl extension (lib icu)                                            |

### Example:

| Target          | Arguments                        |
| --------------- | -------------------------------- |
| linux64         | ``-t linux64 -l -j4 -f x86_64``  |
| mac64           | ``-t mac64 -l -j4 -f``           |

### Common pitfalls
- If used, the `-t` option (target) MUST be specified BEFORE the `-f` option (optimizations)
- Avoid using the script in directory trees containing spaces. Some libraries don't like trying to be built in directory trees containing spaces, e.g. `/home/user/my folder/pocketmine-mp/` might experience problems.
