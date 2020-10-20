# Checking MySQL DB

**check_mysqldb** is shell tool for checking **[MySQL database](https://mariadb.org/)**.

Developed in **[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))** code: **100%**.

[![check_mysqldb shell checker](https://github.com/vroncevic/check_mysqldb/workflows/check_mysqldb%20shell%20checker/badge.svg)](https://github.com/vroncevic/check_mysqldb/actions?query=workflow%3A%22check_mysqldb+shell+checker%22)

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

Navigate to release **[page](https://github.com/vroncevic/check_mysqldb/releases)** download and extract release archive.

To install **check_mysqldb** type the following:

```
tar xvzf check_mysqldb-x.y.z.tar.gz
cd check_mysqldb-x.y.z
cp -R ~/sh_tool/bin/   /root/scripts/check_mysqldb/ver.1.0/
cp -R ~/sh_tool/conf/  /root/scripts/check_mysqldb/ver.1.0/
cp -R ~/sh_tool/log/   /root/scripts/check_mysqldb/ver.1.0/
```
![alt tag](https://raw.githubusercontent.com/vroncevic/check_mysqldb/dev/docs/setup_tree.png)

Or You can use docker to create image/container.

[![check_mysqldb docker checker](https://github.com/vroncevic/check_mysqldb/workflows/check_mysqldb%20docker%20checker/badge.svg)](https://github.com/vroncevic/check_mysqldb/actions?query=workflow%3A%22check_mysqldb+docker+checker%22)

### Usage

```
# Create symlink for shell tool
ln -s /root/scripts/check_mysqldb/ver.1.0/bin/check_mysqldb.sh /root/bin/check_mysqldb

# Setting PATH
export PATH=${PATH}:/root/bin/

# Checking MySQL database
check_mysqldb database_name
```

### Dependencies

**check_mysqldb** requires next modules and libraries:
* sh_util [https://github.com/vroncevic/sh_util](https://github.com/vroncevic/sh_util)

### Shell tool structure

**check_mysqldb** is based on MOP.

Code structure:
```
.
├── bin/
│   └── check_mysqldb.sh
├── conf/
│   └── check_mysqldb.cfg
└── log/
    └── check_mysqldb.log
```

### Docs

[![Documentation Status](https://readthedocs.org/projects/check_mysqldb/badge/?version=latest)](https://check_mysqldb.readthedocs.io/projects/check_mysqldb/en/latest/?badge=latest)

More documentation and info at:
* [https://check_mysqldb.readthedocs.io/en/latest/](https://check_mysqldb.readthedocs.io/en/latest/)
* [https://www.gnu.org/software/bash/manual/](https://www.gnu.org/software/bash/manual/)
* [https://mariadb.com/kb/en/documentation/](https://mariadb.com/kb/en/documentation/)

### Copyright and licence

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2016 by [vroncevic.github.io/check_mysqldb](https://vroncevic.github.io/check_mysqldb)

**check_mysqldb** is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

Lets help and support FSF.

[![Free Software Foundation](https://raw.githubusercontent.com/vroncevic/check_mysqldb/dev/docs/fsf-logo_1.png)](https://my.fsf.org/)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://my.fsf.org/donate/)
