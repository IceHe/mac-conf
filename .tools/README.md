# .tools

- `inputsource` : https://github.com/hnakamur/inputsource

## Link to tools

### Make links

```bash
cd /path/to/TOOL
ln -s $(realpath TOOL) /usr/local/bin/TOOL

# e.g.
cd inputsource
ln -s $(realpath inputsource) /usr/local/bin/inputsource
```

### Check links

```bash
# list paths/to/TOOL
where TOOL
# Show which to use
which TOOL
# Check link to TOOL
ls -hl path/to/TOOL

# e.g.
$ where inputsource
/usr/bin/inputsource
/usr/local/bin/inputsource

$ which inputsource
/usr/local/bin/inputsource

$ ls -l intputsource
lrwxr-xr-x  1 icehe  admin  43 Sep  9 12:50 /usr/local/bin/inputsource -> /Users/IceHe/.tools/inputsource/inputsource
```
