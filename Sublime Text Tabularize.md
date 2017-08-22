```
import sublime
import sublime_plugin


class ExampleCommand(sublime_plugin.TextCommand):
	def run(self, edit):

		# Fetch Selected Region
		for region in self.view.sel():

			# Returns a modified copy of region such that it starts at the beginning of a line, and ends at the end of a line
			lineReg = self.view.line(region)	

			# Returns the contents of the region as a string.
			lineContents = self.view.substr(lineReg) + '\n'

			# Split the line using delimiter except '\n' at the end of line			
			listOfCell = lineContents[:-1].split("|")

			# Strip the whitespace from left & right side
			listOfCell = self.stripWhitespace(listOfCell)
			print(listOfCell)

			print(self.emptyTableLine(listOfCell))


	def stripWhitespace(self, listOfWord):
		retList = []
		for word in listOfWord:
			word = word.rstrip()
			word = word.lstrip()
			retList.append(word)

		return retList

	def emptyTableLine(self, listOfWord):
		borderLine = "+"
		wordLine = "|"

		for word in listOfWord:
			borderLine += "-"*(len(word)+8)		
			borderLine += "+"

			wordLine+= word.center(len(word)+8)
			wordLine+= "|"

		print(borderLine)
		print(wordLine)
	

```
