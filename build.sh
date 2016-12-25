echo "build.sh >> Creating banner..."
bannertool makebanner -i "assets/banner.png" -a "assets/audio.wav" -o "banner.bin"
echo "build.sh >> Creating icon..."
bannertool makesmdh -i "assets/icon.png" -s "nds-bootstrap updater" -l "ReBootstrap" -p "Alerdy | JoshuaDoes" -o "icon.bin"
echo "build.sh >> Creating RomFS..."
3dstool -cvtf romfs romfs.bin --romfs-dir script
echo "build.sh >> Creating ReBootstrap.cia..."
makerom -f cia -o "ReBootstrap.cia" -elf "lpp-3ds.elf" -rsf "cia_workaround.rsf" -icon "icon.bin" -banner "banner.bin" -exefslogo -target t -romfs "romfs.bin"
