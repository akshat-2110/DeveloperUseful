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

			# Add the text at the beginning of the line
            view.insert(line.begin(), lineContents)

            # Print the line
			print(lineContents)

