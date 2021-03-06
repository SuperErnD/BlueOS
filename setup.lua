if not http then 
	print("Enable HTTP-API to continue")
	print("Installation cannot continue")
	return
end
function downloadFile (url,file) 
	setup = http.get(url)
	
	code = setup.readAll()
	setup.close()
	file=fs.open(file,'w')
	file.write(code)
	file.close()
end
io.write("Starting installation...")
print("Downloading OS ")
downloadFile('https://raw.githubusercontent.com/SuperErnD/BlueOS/main/rom.arch','rom.arch')
print("Downloaded!")
print("Downloading archive")
downloadFile("https://raw.githubusercontent.com/SuperErnD/BlueOS/main/archive.lua",'archive.lua')
print("Downloaded!")
print("Unpacking OS")
shell.execute("archive","unzip","rom.arch","/")
print("Unpacked!")

print("Readed!")
print('Installing BootS')
print("Downloading...")
downloadFile('https://raw.githubusercontent.com/SuperErnD/BlueOS/main/startup.lua','startup.lua')
print('Installed!')
print('waiting for request')
read()
print('Rebooting..')
os.sleep(1)
os.reboot()


