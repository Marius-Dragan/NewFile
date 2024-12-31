# NewFile
All-in-One AppleScript for Creating Blank Files in Finder

This script enables macOS users to create blank files of various types directly in Finder. It supports multiple file formats and ensures unique file naming in the target folder. The script integrates seamlessly with Finder and macOS applications, and it can be configured for quick access using Automator.

## Features
	• Wide Range of File Formats: Supports creation of .txt, .docx, .xlsx, .pptx, .pages, .numbers, .key, .pdf, .xml, .json, .csv, and .rtf files.
	• Unique File Naming: Automatically generates unique file names to prevent overwriting.
	• Application Integration: Utilizes macOS native apps (e.g., TextEdit, Microsoft Office, iWork) and shell commands.
	• Finder Integration: Reveals and optionally selects the newly created file in Finder for easy access.
	• Automator App Creation: Easily integrated into macOS Automator to create a custom app for the Finder toolbar.

## Installation
	1. Open the Script Editor on your Mac.
	2. Copy and paste the provided AppleScript into the editor.
	3. Save the script as an .scpt file or application.
 	4. Or you can download the script from here CreateNewFile.scpt and use it or with Apple Script or Automator.

## Adding to Automator and Finder Toolbar
	1. Open Automator and create a new Application.
	2. Add the Run AppleScript action.
	3. Paste the provided AppleScript into the action’s script editor.
	4. Save the Automator workflow as an application (e.g., CreateBlankFile.app).
	5. Drag the saved .app file to the Finder toolbar for quick access:
	6. Press and hold the Command key.
	7. Drag the app onto the Finder toolbar.

Now, you can trigger the script directly from the Finder toolbar with a single click.

## Usage
	1. Open Finder and navigate to your desired folder.
	2. Click the custom app in the Finder toolbar.
	3. Select a file type from the prompted list.
	4. A blank file is created in the active Finder directory with a unique name.

## Supported File Types
	• Microsoft Office: Word (.docx), Excel (.xlsx), PowerPoint (.pptx)
	• Apple iWork: Pages (.pages), Numbers (.numbers), Keynote (.key)
	• Common Formats: Text (.txt), Rich Text Format (.rtf), Portable Document Format (.pdf)
	• Developer Formats: XML (.xml), JSON (.json), CSV (.csv)

## Script Highlights
	• Dynamic File Creation: Opens applications or uses shell commands (touch) depending on the file type.
	• Unique Name Generator: Prevents overwriting by appending counters to duplicate file names.
	• Finder Reveal: Automatically shows the newly created file for immediate use.

## Example Workflow
	1. Open Finder and navigate to the target folder.
	2. Click the custom app from the Finder toolbar.
	3. Choose a file type (e.g., .json for JSON files).
	4. The file is created in the current Finder location with a unique name.
	5. Finder reveals the new file for immediate interaction.

## Customization
	• Modify the list of file types in the choose from list section.
	• Change the default file type (default items {"Text (.txt)"}).
	• Update or add new file types using similar logic in the script.
 	• You can change the icon appearance by replacing the file in location /Path-to-application/NewFile.app/Contents/Resources and replace with icon ApplicationStub.icns and that will overwrite the default automator icon.

## Notes
	• Requires installed applications for specific file types (e.g., Microsoft Word, Pages).
	• Shell-based file creation (e.g., .pdf, .json) requires no additional apps.
	• Finder toolbar integration is limited to apps created via Automator.

## License

Feel free to use, modify, and distribute this script. Attribution is appreciated but not required.

## Contribution

Suggestions, improvements, and pull requests are welcome. Help make this script even more useful for the macOS community!

This script, combined with Automator, offers an efficient way to create blank files directly from Finder, making it a must-have productivity tool for macOS users.
