# FindSupportedApps

This Command Line App allows you to search in a directory whether apps inside the directory can run a file of a certain type (Apple types)

For example, you can run 
```sh
FindSupportedApps -d /System/Applications -t "public.rtf"
> Notes
> TextEdit
```

### Requires swift installed on your machine

To run, you'll either need to build it for release and copy it to your `usr/local/bin`:
```sh
swift build -c release
cd .build/release
cp -f FindSupportedApps /usr/local/bin/findsupportedapps
```
and then just call it like the example above. 

Or you can run it using the Swift Package Manager in the root dir, like: 
```sh
swift run FindSupportedApps -d /System/Applications -t "public.rtf"
```


----- 
## TODO 

- Change classes to be instances instead of static. Those classes dependencies should be protocols, and not concrete classes.
- Add unit tests 
- Add system tests against actual mock apps and directories