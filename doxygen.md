> **Install Doxygen on Linux**

* To install doxygen on Ubuntu, Mint or Debian:
```
$ sudo apt-get install doxygen
$ sudo apt-get install graphviz
```
* To install doxygen on CentOS, Fedora or RHEL:
```
$ sudo yum install doxygen
$ sudo yum install graphviz 
```

> **Generate Documentation from Source code with Doxygen**

* Step 1 : Generate a project-specific doxygen configuration file
`$ doxygen -g my_proj.conf `

* Step 2 : The above command will generate a template configuration file for a particular project. Among others, you can edit the following options in the configuration file.
```
# document all entities in the project.
EXTRACT_ALL            = YES

# document all static members of a file.
EXTRACT_STATIC         = YES

# specify the root directory that contains the project's source files.
INPUT                  = /home/xmodulo/source

# search sub-directories for all source files.
RECURSIVE              = YES

# include the body of functions and classes in the documentation.
INLINE_SOURCES         = YES

# generate visualization graph by using dot program (part of graphviz package).
HAVE_DOT               = YES
```
* Step 3 : Now go ahead and run doxygen with the configuration file.
`$ doxygen my_proj.conf ` 

