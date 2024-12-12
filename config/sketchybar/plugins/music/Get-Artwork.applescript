--get current path
tell application "Finder" to set current_path to container of (path to me) as alias

--get artwork
tell application "Music"
	try
		if player state is not stopped then
			set alb to (get album of current track)
			tell artwork 1 of current track
				if format is JPEG picture then
					set imgFormat to ".jpg"
				else
					set imgFormat to ".png"
				end if
			end tell
			set rawData to (get raw data of artwork 1 of current track)
		else
			return
		end if
	on error
		return POSIX path of ((current_path as text) & "Cover-Default.png")
		return
	end try
end tell

--create path to save image as jpg or png
set newPath to ((current_path as text) & "tmp" & imgFormat) as text

try
	--create file
	tell me to set fileRef to (open for access newPath with write permission)
	--overwrite existing file
	write rawData to fileRef starting at 0
	tell me to close access fileRef
	
	delay 1
	
	--resize image
	set the target_length to 500
	try
		tell application "Image Events"
			-- start the Image Events application
			launch
			-- open the image file
			set this_image to open newPath
			-- perform action
			scale this_image to size target_length
			-- save the changes
			save this_image with icon
			-- purge the open image data
			close this_image
		end tell
	on error
		return POSIX path of ((current_path as text) & "Cover-Default.png")
	end try
	
	return POSIX path of newPath
on error m number n
	log n
	log m
	try
		tell me to close access fileRef
	end try
	return ((current_path as text) & "Cover-Default.png") as text
end try