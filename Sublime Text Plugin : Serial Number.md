```
import sublime
import sublime_plugin

class SerialnumberCommand(sublime_plugin.TextCommand):
	def run(self, edit):
		count = 0
		# Fetch Selected Region
		for region in self.view.sel():
			# Extract current cursor position
			pos = region.begin()
			# Insert Serial Number
			self.view.insert(edit, pos, str(count))
			count = count + 1
```
