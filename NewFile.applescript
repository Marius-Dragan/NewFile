--------------------------------------------------------------------------------
-- ALL-IN-ONE APPLESCRIPT FOR CREATING BLANK FILES WITH UNIQUE NAMES
--------------------------------------------------------------------------------

tell application "Finder"
	set targetFolder to insertion location as alias -- alias to folder
	set folderPath to POSIX path of targetFolder -- POSIX path (e.g. "/Users/.../Documents/")
end tell

-- Optional: Bring this script's app or Automator/etc. to front if needed
tell application "System Events" to set frontmost of process "NewFile" to true
delay 0.2

-- Present the list of file types, defaulting to Text (.txt)
set fileType to choose from list ¬
	{"Word (.docx)", "Excel (.xlsx)", "PowerPoint (.pptx)", ¬
		"Pages (.pages)", "Numbers (.numbers)", "Keynote (.key)", ¬
		"PDF (.pdf)", "XML (.xml)", "JSON (.json)", "CSV (.csv)", ¬
		"Text (.txt)", "RTF (.rtf)"} ¬
		with prompt ¬
	"Select file type:" default items {"Text (.txt)"} ¬
	without empty selection allowed

if fileType is false then return -- user canceled
set chosenType to item 1 of fileType

--------------------------------------------------------------------------------
-- MAIN LOGIC: Generate a unique name and create the file accordingly
--------------------------------------------------------------------------------

if chosenType is "Word (.docx)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "docx")
	tell application "Microsoft Word"
		set myDocument to make new document
		save as myDocument file name (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
else if chosenType is "Excel (.xlsx)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "xlsx")
	tell application "Microsoft Excel"
		set myWorkbook to make new workbook
		save myWorkbook in (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
else if chosenType is "PowerPoint (.pptx)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "pptx")
	tell application "Microsoft PowerPoint"
		set newPresentation to make new presentation
		save newPresentation in (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
else if chosenType is "Pages (.pages)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "pages")
	tell application "Pages"
		set myPagesDoc to make new document
		save myPagesDoc in (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
else if chosenType is "Numbers (.numbers)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "numbers")
	tell application "Numbers"
		set myNumbersDoc to make new document
		save myNumbersDoc in (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
else if chosenType is "Keynote (.key)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "key")
	tell application "Keynote"
		set myKeynoteDoc to make new document
		save myKeynoteDoc in (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
else if chosenType is "RTF (.rtf)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "rtf")
	tell application "TextEdit"
		set newDoc to make new document
		save newDoc in (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
else if chosenType is "Text (.txt)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "txt")
	tell application "TextEdit"
		set newDoc to make new document
		save newDoc in (POSIX file (folderPath & uniqueFile))
		quit
	end tell
	
	--------------------------------------------------------------------------------
	-- "Touch"-based creation for blank PDF, XML, JSON, CSV
	-- We just do "touch" with the unique path
	--------------------------------------------------------------------------------
	
else if chosenType is "PDF (.pdf)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "pdf")
	do shell script "touch " & quoted form of (POSIX path of (folderPath & uniqueFile))
	
else if chosenType is "XML (.xml)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "xml")
	do shell script "touch " & quoted form of (POSIX path of (folderPath & uniqueFile))
	
else if chosenType is "JSON (.json)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "json")
	do shell script "touch " & quoted form of (POSIX path of (folderPath & uniqueFile))
	
else if chosenType is "CSV (.csv)" then
	set uniqueFile to getUniqueFileName(targetFolder, "untitled", "csv")
	do shell script "touch " & quoted form of (POSIX path of (folderPath & uniqueFile))
end if

--------------------------------------------------------------------------------
-- REVEAL THE NEWLY CREATED FILE IN FINDER
--------------------------------------------------------------------------------

if uniqueFile is not "" then
	-- Convert HFS-based path into an alias for Finder
	set newFileAlias to ((targetFolder as text) & uniqueFile) as alias
	
	tell application "Finder"
		reveal newFileAlias
		activate -- Brings Finder window to front
		-- Optionally, also explicitly 'select' the file:
		select newFileAlias
	end tell
end if

--------------------------------------------------------------------------------
-- HANDLER: GENERATE A UNIQUE FILE NAME
--  1. Accepts a Finder folder alias (targetFolder)
--  2. A base name (e.g. "untitled")
--  3. An extension (e.g. "docx")
-- Returns an HFS path string "Macintosh HD:Users:...:untitled.docx"
--------------------------------------------------------------------------------
on getUniqueFileName(folderAlias, baseName, extension)
	set fileCount to 0
	set fileName to baseName & "." & extension
	
	tell application "Finder"
		repeat
			set fullPath to (folderAlias as text) & fileName
			if not (exists file fullPath) then
				exit repeat
			end if
			set fileCount to fileCount + 1
			set fileName to baseName & " " & fileCount & "." & extension
		end repeat
	end tell
	return fileName
end getUniqueFileName
