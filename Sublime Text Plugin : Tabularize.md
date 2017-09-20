#### Key Binding
```
{"keys": ["ctrl+t"], "command": "tabularize"},
```

#### Plugin
```
import sublime
import sublime_plugin


# Macros to control plugin
SPACING	= 6 #space in left & right side of word in cell

# Help : How to run plugin
# Step 1: Insert '|' to split word in cell & select line that you want to make table of
# Step 2: Ctrl+`
# Step 3: run view.run_command("tabularize") & hit enter.


class TabularizeCommand(sublime_plugin.TextCommand):

	def run(self, edit):
		table = ""
		# Get list of all selected lines
		selectedLines = self.getListOfSelectedLines(edit)
		# Get max width of column
		dictOfCellWidth,listOfStrippedWordLines = self.getDictOfCellWidthAndListOfStrippedWord(selectedLines)

		#print("dictOfCellWidth = ", dictOfCellWidth)
		print("listOfStrippedWordLines = ", listOfStrippedWordLines)

		# Creating border line
		borderLine = ""
		for i in range(0, len(dictOfCellWidth)):
			borderLine += "+"
			borderLine += "-"*(dictOfCellWidth[i]+SPACING)
		borderLine += "+"
		
		# Table printing
		for i, line in enumerate(listOfStrippedWordLines):
			table += borderLine+"\n"
			wordLine = "|"
			for i, word in enumerate(line):
				wordLine += word.center(dictOfCellWidth[i]+SPACING)
				wordLine += "|"
			table += wordLine+"\n"

		table += borderLine+"\n"
		self.view.insert(edit, self.view.sel()[0].begin(), table)
		# self.view.insert(edit, 0, table)

	def getListOfSelectedLines(self, edit):
		selectedLines = []
		# Fetch Selected Region
		for region in self.view.sel():
			# Returns a modified copy of region such that it starts at the beginning of a line, and ends at the end of a line
			lineReg = self.view.line(region)	
			# Returns the contents of the region as a string.
			lineContents = self.view.substr(lineReg)
			# Make a list of all lines
			selectedLines = lineContents.split("\n")

			self.view.erase(edit, region)	

		return selectedLines

	def stripWhitespace(self, listOfWord):
		retList = []
		for word in listOfWord:
			word = word.rstrip()
			word = word.lstrip()
			retList.append(word)

		return retList

	def getDictOfCellWidthAndListOfStrippedWord(self, listOfLines):
		retDictOfCellWidth = {}
		listOfStrippedWordLines = []

		for line in listOfLines:
			# Split the line using delimiter
			listOfWord = line.split("|")
			listOfStrippedWord = []

			for i, word in enumerate(listOfWord):

				# Stripping whitespace
				word = word.rstrip()
				word = word.lstrip()
				listOfStrippedWord.append(word)

				# Getting max cell width
				if i in retDictOfCellWidth:# if key i that is cell index exist in dict or not
					retDictOfCellWidth[i] = max(retDictOfCellWidth[i], len(word))				
				else:# execute in first iteration only
					retDictOfCellWidth[i] = len(word)

			# Append line with stripped word
			listOfStrippedWordLines.append(listOfStrippedWord)

		return retDictOfCellWidth,listOfStrippedWordLines
```
