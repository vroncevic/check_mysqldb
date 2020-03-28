# Checking MySQL DB.

check_mysqldb is shell tool for checking MySQL database.

Developed in bash code: 100%.

The README is used to introduce the tool and provide instructions on
how to install the tool, any machine dependencies it may have and any
other information that should be provided before the tool is installed.

[![GitHub issues open](https://img.shields.io/github/issues/vroncevic/check_mysqldb.svg)](https://github.com/vroncevic/check_mysqldb/issues)
 [![GitHub contributors](https://img.shields.io/github/contributors/vroncevic/check_mysqldb.svg)](https://github.com/vroncevic/check_mysqldb/graphs/contributors)

### INSTALLATION

Navigate to release [page](https://github.com/vroncevic/check_mysqldb/releases) download and extract release archive.

To install modules type the following:

```
tar xvzf check_mysqldb-x.y.z.tar.gz
cd check_mysqldb-x.y.z
cp -R ~/sh_tool/bin/   /root/scripts/check_mysqldb/ver.1.0/
cp -R ~/sh_tool/conf/  /root/scripts/check_mysqldb/ver.1.0/
cp -R ~/sh_tool/log/   /root/scripts/check_mysqldb/ver.1.0/
```

Or You can use docker to create image/container.

:sparkles:

### USAGE

```
# Create symlink for shell tool
ln -s /root/scripts/check_mysqldb/ver.1.0/bin/check_mysqldb.sh /root/bin/check_mysqldb

# Setting PATH
export PATH=${PATH}:/root/bin/

# Checking MySQL database
check_mysqldb database_name
```

### DEPENDENCIES

This tool requires these other modules and libraries:

* sh_util https://github.com/vroncevic/sh_util

### SHELL TOOL STRUCTURE

check_mysqldb is based on MOP.

Shell tool structure:
```
.
├── bin/
│   └── check_mysqldb.sh
├── conf/
│   └── check_mysqldb.cfg
└── log/
    └── check_mysqldb.log
```

### DOCS

[![Documentation Status](https://readthedocs.org/projects/check_mysqldb/badge/?version=latest)](https://check_mysqldb.readthedocs.io/projects/check_mysqldb/en/latest/?badge=latest)

More documentation and info at:

* https://check_mysqldb.readthedocs.io/en/latest/

:sparkles:

### COPYRIGHT AND LICENCE

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright (C) 2018 by https://vroncevic.github.io/check_mysqldb

This tool is free software; you can redistribute it and/or modify
it under the same terms as Bash itself, either Bash version 4.2.47 or,
at your option, any later version of Bash 4 you may have available.

:sparkles:
