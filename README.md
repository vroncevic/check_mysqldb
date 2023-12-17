<img align="right" src="https://raw.githubusercontent.com/vroncevic/check_mysqldb/dev/docs/check_mysqldb_logo.png" width="25%">

# Checking MySQL DB

**check_mysqldb** is shell tool for checking **[MySQL database](https://mariadb.org/)**.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![check_mysqldb_shell_checker](https://github.com/vroncevic/check_mysqldb/actions/workflows/check_mysqldb_shell_checker.yml/badge.svg)](https://github.com/vroncevic/check_mysqldb/actions/workflows/check_mysqldb_shell_checker.yml)

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/check_mysqldb.svg)](https://github.com/vroncevic/check_mysqldb/issues) [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/check_mysqldb.svg)](https://github.com/vroncevic/check_mysqldb/graphs/contributors)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Shell tool structure](#shell-tool-structure)
- [Docs](#docs)
- [Copyright and licence](#copyright-and-licence)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Installation

![Debian Linux OS](https://raw.githubusercontent.com/vroncevic/check_mysqldb/dev/docs/debtux.png)

Navigate to release **[page](https://github.com/vroncevic/check_mysqldb/releases)** download and extract release archive.

To install **check_mysqldb** type the following

```
tar xvzf check_mysqldb-x.y.tar.gz
cd check_mysqldb-x.y
cp -R ~/sh_tool/bin/   /root/scripts/check_mysqldb/ver.x.y/
cp -R ~/sh_tool/conf/  /root/scripts/check_mysqldb/ver.x.y/
cp -R ~/sh_tool/log/   /root/scripts/check_mysqldb/ver.x.y/
```

Self generated setup script and execution
```
./check_mysqldb_setup.sh 

[setup] installing App/Tool/Script check_mysqldb
	Sun 21 Nov 2021 09:08:40 PM CET
[setup] clean up App/Tool/Script structure
[setup] copy App/Tool/Script structure
[setup] remove github editor configuration files
[setup] set App/Tool/Script permission
[setup] create symbolic link of App/Tool/Script
[setup] done

/root/scripts/check_mysqldb/ver.2.0/
├── bin/
│   ├── center.sh
│   ├── check_mysqldb.sh
│   └── display_logo.sh
├── conf/
│   ├── check_mysqldb.cfg
│   ├── check_mysqldb.logo
│   └── check_mysqldb_util.cfg
└── log/
    └── check_mysqldb.log

3 directories, 7 files
lrwxrwxrwx 1 root root 56 Nov 21 21:08 /root/bin/check_mysqldb -> /root/scripts/check_mysqldb/ver.2.0/bin/check_mysqldb.sh
```

Or You can use docker to create image/container.

### Usage

```
# Create symlink for shell tool
ln -s /root/scripts/check_mysqldb/ver.x.y/bin/check_mysqldb.sh /root/bin/check_mysqldb

# Setting PATH
export PATH=${PATH}:/root/bin/

# Checking MySQL database
check_mysqldb mydb

check_mysqldb ver.2.0
Sun Nov 21 20:20:16 UTC 2021

[check_root] Check permission for current session? [ok]
[check_root] Done
                                                                                                          
           ██                      ██                                                 ██      ██ ██       
          ░██                     ░██                                                ░██     ░██░██       
    █████ ░██       █████   █████ ░██  ██       ██████████   ██   ██  ██████  ████   ░██     ░██░██       
   ██░░░██░██████  ██░░░██ ██░░░██░██ ██       ░░██░░██░░██ ░░██ ██  ██░░░░  ██░░██  ░██  ██████░██████   
  ░██  ░░ ░██░░░██░███████░██  ░░ ░████         ░██ ░██ ░██  ░░███  ░░█████ ░██ ░██  ░██ ██░░░██░██░░░██  
  ░██   ██░██  ░██░██░░░░ ░██   ██░██░██        ░██ ░██ ░██   ░██    ░░░░░██░░█████  ░██░██  ░██░██  ░██  
  ░░█████ ░██  ░██░░██████░░█████ ░██░░██ █████ ███ ░██ ░██   ██     ██████  ░░░░██  ███░░██████░██████   
   ░░░░░  ░░   ░░  ░░░░░░  ░░░░░  ░░  ░░ ░░░░░ ░░░  ░░  ░░   ██     ░░░░░░      ░███░░░  ░░░░░░ ░░░░░     
                                                            ░░                  ░░░                       
                                                                                                          
	                                                                     
		Info   github.io/check_mysqldb ver.2.0 
		Issue  github.io/issue
		Author vroncevic.github.io

[check_mysqldb] Loading basic configuration!
100% [================================================]

[load_conf] Loading App/Tool/Script configuration!
[check_cfg] Checking configuration file [/root/scripts/check_mysqldb/ver.2.0/conf/check_mysqldb.cfg] [ok]
[check_cfg] Done

[load_conf] Done

Enter password: 
[check_mysqldb] Database [mydb] exist
[logging] Checking directory [/root/scripts/check_mysqldb/ver.2.0/log/]? [ok]
[logging] Write info log!
[logging] Done

[check_mysqldb] Done
```

### Dependencies

**check_mysqldb** requires next modules and libraries
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**check_mysqldb** is based on MOP.

Shell tool structure
```
sh_tool/
├── bin/
│   ├── center.sh
│   ├── check_mysqldb.sh
│   └── display_logo.sh
├── conf/
│   ├── check_mysqldb.cfg
│   ├── check_mysqldb.logo
│   └── check_mysqldb_util.cfg
└── log/
    └── check_mysqldb.log
```

### Docs

[![Documentation Status](https://readthedocs.org/projects/check_mysqldb/badge/?version=latest)](https://check-mysqldb.readthedocs.io/projects/check_mysqldb/en/latest/?badge=latest)

More documentation and info at
* [https://check_mysqldb.readthedocs.io/en/latest/](https://check-mysqldb.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)
* [https://mariadb.com/kb/en/documentation/](https://mariadb.com/kb/en/documentation/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2016 - 2024 by [vroncevic.github.io/check_mysqldb](https://vroncevic.github.io/check_mysqldb)

**check_mysqldb** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/check_mysqldb/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
