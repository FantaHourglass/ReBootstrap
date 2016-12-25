function unicodify(str)
	local new_str = ""
	for i = 1, #str,1 do
		new_str = new_str..string.sub(str,i,i)..string.char(00)
	end
	return new_str
end

function main()
	local white = Color.new(255,255,255)
	local url = "https://dl.joshuadoes.com/?platform=3DS&app=nds-bootstrap-dldi-nds&channel=fresh&version=latest&url&download"

	-- Handle the working directory
	System.createDirectory("/ReBootstrap")
	
	-- Handle the font data
	local font = Font.load("romfs:/font.ttf")
	Font.setPixelSizes(font, 16)

	Screen.refresh()
	
	-- Top screen
	Font.print(font, 5,5, "ReBootstrap", white, TOP_SCREEN)
	Font.print(font, 40, 20, "- Official nds-bootstrap Updater", white, TOP_SCREEN)
	Font.print(font, 5,50, "Press A to update bootstrap-dldi.nds", white, TOP_SCREEN)
	Font.print(font, 5,65, "Press START to return to the HOME menu", white, TOP_SCREEN)
	Font.print(font, 5,80, "Press X to launch TWLoader", white, TOP_SCREEN)
	
	-- Bottom screen
	Font.print(font, 5,5, "Thanks to the following:", white, BOTTOM_SCREEN)
	Font.print(font, 10, 25, "Alerdy:", white, BOTTOM_SCREEN)
	Font.print(font, 45, 40, "- Creating the updater", white, BOTTOM_SCREEN)
	Font.print(font, 10, 55, "JoshuaDoes:", white, BOTTOM_SCREEN)
	Font.print(font, 45, 70, "- Hosting the nds-bootstrap builds", white, BOTTOM_SCREEN)
	Font.print(font, 10, 85, "Rinnegatamante:", white, BOTTOM_SCREEN)
	Font.print(font, 45, 100, "- Lua Player Plus on the 3DS", white, BOTTOM_SCREEN)
	Font.print(font, 10, 115, "ahezard:", white, BOTTOM_SCREEN)
	Font.print(font, 45, 130, "- The nds-bootstrap updates", white, BOTTOM_SCREEN)
	
	Screen.waitVblankStart()
	Screen.flip()
	while true do
		pad = Controls.read()
		if pad ~= oldPad then
			oldPad = pad
			if Controls.check(pad,KEY_START) then
				Screen.refresh()
				Screen.waitVblankStart()
				Screen.flip()
				Screen.clear(TOP_SCREEN)
				Screen.clear(BOTTOM_SCREEN)
				Screen.refresh()
				Screen.waitVblankStart()
				Screen.flip()
				Font.unload(font)
				System.exit()
			elseif Controls.check(pad,KEY_X) then
				Screen.refresh()
				Screen.waitVblankStart()
				Screen.flip()
				Screen.clear(TOP_SCREEN)
				Screen.clear(BOTTOM_SCREEN)
				Screen.refresh()
				Screen.waitVblankStart()
				Screen.flip()
				System.launchCIA(75252224, SDMC)
			elseif Controls.check(pad,KEY_A) then
				Screen.clear(TOP_SCREEN)
				Screen.clear(BOTTOM_SCREEN)
				Screen.refresh()
				Screen.waitVblankStart()
				Screen.flip()
				if Network.isWifiEnabled() then
					Font.print(font, 5,5, "Downloading the latest bootstrap-dldi.nds ...", white, TOP_SCREEN)
					Screen.waitVblankStart()
					Screen.flip()
					Network.downloadFile(url, "/ReBootstrap/bootstrap-dldi.nds")
					Font.print(font, 5,20, "Downloaded bootstrap-dldi.nds successfully", white, TOP_SCREEN)
					Screen.waitVblankStart()
					Screen.flip()
					Font.print(font, 5,50, "Moving file to SD:/_nds/bootstrap-dldi.nds ...", white, TOP_SCREEN)
					Screen.waitVblankStart()
					Screen.flip()
					System.renameFile("/ReBootstrap/bootstrap-dldi.nds","/_nds/bootstrap-dldi.nds")
					Font.print(font, 5,95, "Installed bootstrap-dldi.nds successfully", white, TOP_SCREEN)
					Screen.waitVblankStart()
					Screen.flip()
					Font.print(font, 5,110, "Press START to go back to the Home Menu", white, TOP_SCREEN)
					Font.print(font, 5,125, "Press X to go to TWLoader", white, TOP_SCREEN)
					Screen.waitVblankStart()
					Screen.flip()
					while true do
						pad = Controls.read()
						if pad ~= oldPad then
							oldPad = pad
							if Controls.check(pad,KEY_START) then
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Screen.clear(TOP_SCREEN)
								Screen.clear(BOTTOM_SCREEN)
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Font.unload(font)
								System.exit()
							elseif Controls.check(pad,KEY_X) then
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Screen.clear(TOP_SCREEN)
								Screen.clear(BOTTOM_SCREEN)
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Font.unload(font)
								System.launchCIA(75252224, SDMC)
							end
						end
					end
				else
					Font.print(font, 5,5, "WiFi is disabled! Please turn it on and try again.", white, TOP_SCREEN)
					Font.print(font, 5,40, "Press START to go back to the Home Menu", white, TOP_SCREEN)
					Font.print(font, 5,65, "Press X to launch TWLoader")
					Screen.waitVblankStart()
					Screen.flip()
					while true do
						pad = Controls.read()
						if pad ~= oldPad then
							oldPad = pad
							if Controls.check(pad,KEY_START) then
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Screen.clear(TOP_SCREEN)
								Screen.clear(BOTTOM_SCREEN)
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Font.unload(font)
								System.exit()
							elseif Controls.check(pad,KEY_X) then
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Screen.clear(TOP_SCREEN)
								Screen.clear(BOTTOM_SCREEN)
								Screen.refresh()
								Screen.waitVblankStart()
								Screen.flip()
								Font.unload(font)
								System.launchCIA(75252224, SDMC)
							end
						end
					end
				end
			end
		end
	end
end

main()
