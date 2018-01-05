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

			# Add the text at the beginning of the line
			self.view.insert(edit, lineReg.begin(), "lineContents")

			# Replace content of line(May not replace whole line)
			self.view.replace(edit, lineReg, "This")

			# Erase line
			self.view.erase(edit, lineReg)

			# Print the debug line on console
			print("DEBUG")



```
> **Test plugin**
- Open command line interface by `Ctrl + ~`.
- Run `view.run_command("example")`
