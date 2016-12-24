local white = Color.new(255,255,255)
local green = Color.new(0,255,0)
local url = "https://joshuadoes.com/projects/3DSHomebrew/BUILDS/nds-bootstrap/bootstrap-dldi.nds"

function unicodify(str)
	local new_str = ""
	for i = 1, #str,1 do
		new_str = new_str..string.sub(str,i,i)..string.char(00)
	end
	return new_str
end

function main()
	Screen.refresh()
	Screen.debugPrint(5,5, "nds-bootstrap updater", green, TOP_SCREEN)
	Screen.debugPrint(5,30, "Press A to update nds-bootstrap", white, TOP_SCREEN)
	Screen.debugPrint(5,50, "Press START to go to HOME menu", white, TOP_SCREEN)
	Screen.debugPrint(5,70, "Press X to go to TWLauncher", white, TOP_SCREEN)
	Screen.debugPrint(5,155, "Thanks to:", white, TOP_SCREEN)
	Screen.debugPrint(5,170, "Alerdy for the updater", white, TOP_SCREEN)
	Screen.debugPrint(5,185, "JoshuaDoes for hosting the builds", white, TOP_SCREEN)
	Screen.debugPrint(5,200, "Rinnegatamante for lpp-3ds", white, TOP_SCREEN)
	Screen.debugPrint(5,215, "ahezard for nds-bootstrap", white, TOP_SCREEN)
	Screen.waitVblankStart()
	Screen.flip()
	while true do
		pad = Controls.read()
		if pad ~= oldPad then
			oldPad = pad
			if Controls.check(pad,KEY_START) then
				Screen.waitVblankStart()
				Screen.flip()
				System.exit()
			elseif Controls.check(pad,KEY_X) then
				System.launchCIA(75252224, SDMC)
			elseif Controls.check(pad,KEY_A) then
				Screen.refresh()
				Screen.waitVblankStart()
				Screen.flip()
				Screen.clear(TOP_SCREEN)
				if Network.isWifiEnabled() then
					Screen.debugPrint(5,5, "Downloading the latest NDS file...", white, TOP_SCREEN)
					Network.downloadFile(url, "/bootstrap-dldi.nds")
					Screen.debugPrint(5,20, "File downloaded!", white, TOP_SCREEN)
					Screen.debugPrint(5,50, "Moving file to /_nds folder", white, TOP_SCREEN)
					System.renameFile("/bootstrap-dldi.nds","/_nds/bootstrap-dldi.nds")
					Screen.debugPrint(5,95, "Done!", white, TOP_SCREEN)
					Screen.debugPrint(5,110, "Press START to go to HOME menu", white, TOP_SCREEN)
					Screen.debugPrint(5,125, "Press X to go to TWLauncher", white, TOP_SCREEN)
					
					while true do
						pad = Controls.read()
						if pad ~= oldPad then
							oldPad = pad
							if Controls.check(pad,KEY_START) then
								Screen.waitVblankStart()
								Screen.flip()
								System.exit()
							elseif Controls.check(pad,KEY_X) then
								System.launchCIA(75252224, SDMC)
							end
						end
					end
				else
					Screen.debugPrint(5,5, "WiFi is off! Please turn it on and retry!", white, TOP_SCREEN)
					Screen.debugPrint(5,20, "Press START to go back to Home menu", white, TOP_SCREEN)
					Screen.debugPrint(5,35, "Press X to go to TWLauncher", white, TOP_SCREEN)
					while true do
						pad = Controls.read()
						if pad ~= oldPad then
							oldPad = pad
							if Controls.check(pad,KEY_START) then
								Screen.waitVblankStart()
								Screen.flip()
								System.exit()
								elseif Controls.check(pad,KEY_X) then
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