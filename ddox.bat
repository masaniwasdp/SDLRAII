dub build -c ddox-windows
dub fetch ddox
dub run ddox --arch=x86_mscoff -- filter docs.json --only-documented
dub run ddox --arch=x86_mscoff -- generate-html docs.json docs
del __dummy.html