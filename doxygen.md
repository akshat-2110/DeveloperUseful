### Install Doxygen on Linux

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

### Generate Documentation from Source code with Doxygen

* _Step 1 :_ Generate a project-specific doxygen configuration file
`$ doxygen -g my_proj.conf `

* _Step 2 :_ The above command will generate a template configuration file for a particular project. Among others, you can edit the following options in the configuration file.
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
* _Step 3 :_ Now go ahead and run doxygen with the configuration file.
`$ doxygen my_proj.conf ` 
*Note:* Documentations are generated in both HTML and Latex formats, and stored in ./html and ./latex directories respectively.

* To browse the HTML-formatted documentation, run the following.
```
cd html
$ firefox index.html 
```





### Source

1. [Getting Started Doxygen](http://xmodulo.com/how-to-generate-documentation-from-source-code-in-linux.html).
2. [Commenting Style](http://www-numi.fnal.gov/offline_software/srt_public_context/WebDocs/doxygen-howto.html).

