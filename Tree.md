```
#!/usr/bin/python

#############################################
# @detail Displays Directory Tree
# @author Vishesh Patel
# @version Chendoo.1.0
# @site vishalchovatiya.com
#############################################

import os,sys

RootDir		= os.getcwd()
VERSION		= "Chendoo.1.0"

def printOnlyName( AbsolutePath):
	file = AbsolutePath [ AbsolutePath.rfind('/') + 1 :  ]
	return file

def usage():
	print "\nUsage: " +  printOnlyName(sys.argv[0]) + " [PATH_TO_DIRECTORY]\n"
	print "\nDetail: Displays Directory Tree\n"

def version():
	print 	"\nTree Version "+VERSION+"\nCopyright (C) 2016 Free Software Foundation, Inc.\nThis is free software: you are free to change and redistribute it.\nThere is NO WARRANTY, to the extent permitted by law.\nWritten by Vishesh Patel.\n"

def printContent( RootDir):
	# Decide Spacing
	Tab	= 0

	# Inserting Data Of Current Directory	
	Stack = []
	Stack.append(RootDir)

	while Stack != []:
		traverse = Stack.pop()

		if os.path.isdir(traverse) == True:   # If Directory, Then Add Its Conent To Stack

			DirPath = traverse.replace( RootDir, '') [ 1  : ] 
                        Tab = DirPath.count('/')
                        print "".center(8*Tab," ") + "| " + DirPath + " :"

			for content in os.listdir(traverse):		# Add Content of SubDir To Stack
				print "".center(8*Tab," ")  + "|   -- " + printOnlyName(content)
				Stack.append(traverse + '/' + content)

			print "".center(8*Tab," ") + "".center(100,"-")

def main():
	argList = sys.argv[1:]

	for idx, arg in enumerate(argList):
		if arg in ("--h", "--help") :
			usage()
			sys.exit()
		elif arg in ("--v", "--version") :
			version()
			sys.exit()
		elif os.path.isdir(arg) == True:
			global RootDir
			RootDir = os.path.abspath(arg)
		else:
			usage()
	                sys.exit(2)
	print RootDir
	printContent( RootDir);



if __name__ == "__main__":
	main()


```
