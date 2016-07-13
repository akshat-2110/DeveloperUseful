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

### Testing Doxygen Installation

Create Two Files named as README.md(for main page description) & main.cpp
> **README.md**

```
My Main Page                         {#mainpage}
============

##Documentation that will appear on the main page
```
> **main.cpp**

```
/** 
  \file main.cpp
  \brief Write Your Brief Description Here

  Your Detailed Description was gone here
  Really long
  Every Part Cover
  \author Vishal Chovatiya
  \bug No known bugs.
  \version 1.0
  \date 2005/04/14 14:16:20
  \remarks 
	Last Modified : 13/7/16
	Contact : vishalchovatiya@domain-mail.com
 */

#include<iostream>
#include<stack>
#include<queue>
#include<map>
#include<string>

using namespace std;


/**
  \brief Write Your Brief Description Here

  Your Detailed Description was gone here
  Really long
  Every Part Cover
  \param color The address to which the current cursor column will be written.
  \return Void.
 */
void get_term_color(int* color);




/** 
  \brief Main funtion to start with

  Your Detailed Description was gone here
  Really long
  Every Part Cover
  \param void
  \return int
  */
int main( void)
{
	Parent p;

	p.printHelloWorld();

	return 0;
}
```

> **main.hpp**

```
/** 
  \file main.hpp
  \brief Write Your Brief Description Here

  Your Detailed Description was gone here
  Really long
  Every Part Cover
  \author Vishal Chovatiya
  \bug No known bugs.
  \version 1.0
  \date 2005/04/14 14:16:20
  \remarks 
	Last Modified : 13/7/16
	Contact : vishalchovatiya@domain-mail.com
 */
#ifndef MAIN_HPP
#define MAIN_HPP


#include<iostream>


/**
 \class Parent
 \brief Write Your Brief Description Here

  Your Detailed Description was gone here
  Really long
  Every Part Cover
 \note This is Demo of Doxygen
 \author Vishal Chovatiya 
 \bug No known bugs.
 \version 1.0
 \date 2005/04/14 14:16:20
 \remarks 
	Last Modified : 13/7/16
	Contact : vishalchovatiya@domain-mail.com
*/
class Parent
{
	private:
		int ParPrivVar;		///< Brief Comment After ParPrivVar

	protected:
		int ParProtecVar;	///< Brief Comment After ParProtecVar

	public:
		/*! Another enum, with inline docs */
		enum EnumType
    		{
		      EVal1,	/*!< value 1 */
		      EVal2	/*!< value 2 */
		};

		int ParPubVar;

		/**
		 * \brief Parent printHelloWorld Method
		 * \param void
		 * \return void
		 */
		virtual void printHelloWorld(void)
		{
			cout<<"Parent: Hello World!"<<endl;
		}
};


/**
 \class Child1
 \brief Write Your Brief Description Here

  Your Detailed Description was gone here
  Really long
  Every Part Cover
 \note This is Demo of Doxygen
 \author Vishal Chovatiya 
 \bug No known bugs.
 \version 1.0
 \date 2005/04/14 14:16:20
 \remarks 
	Last Modified : 13/7/16
	Contact : vishalchovatiya@domain-mail.com
*/




class Child1 : public Parent
{
	private:
		int Child1PrivVar;         ///< Brief Comment After Child1PrivVar

	protected:
		int Child1ProtecVar;	  ///< Brief Comment After Child1ProtecVar

	public:
		int Child1PubVar;	///< Brief Comment After Child1PubVar

		/// Breif Comment Before Child1 printHelloWorld
		void printHelloWorld()
		{
			cout<<"Child1: Hello World!"<<endl;
		}

};



/**
 \class Child2
 \brief Write Your Brief Description Here

  Your Detailed Description was gone here
  Really long
  Every Part Cover
 \note This is Demo of Doxygen
 \author Vishal Chovatiya 
 \bug No known bugs.
 \version 1.0
 \date 2005/04/14 14:16:20
 \remarks 
	Last Modified : 13/7/16
	Contact : vishalchovatiya@domain-mail.com
*/




class Child2 : public Parent
{
	private:
		int Child2PrivVar;	///< Brief Comment After Child1PrivVar

	protected:
		int Child2ProtecVar;	///< Brief Comment After Child2ProtecVar

	public:
		int Child2PubVar;	///< Brief Comment After Child2PubVar

		/// Breif Comment Before Child2 printHelloWorld
		void printHelloWorld()
		{
			cout<<"Child2: Hello World!"<<endl;
		}

};

#endif 
```




### Source

1. [Getting Started Doxygen](http://xmodulo.com/how-to-generate-documentation-from-source-code-in-linux.html).
2. [Commenting Style](http://www-numi.fnal.gov/offline_software/srt_public_context/WebDocs/doxygen-howto.html).

