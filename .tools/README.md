# .tool

`inputsource` : https://github.com/hnakamur/inputsource

## Link to tools

### Make links

e.g. `inputsource`

```bash
cd inputsource
ln -s $(realpath inputsource) /usr/local/bin/inputsource
```

### Check links

```bash
# list paths/to/TOOL
where TOOL

# show which to use
which TOOL

# check link to TOOL
ls -hl path/to/TOOL
```

e.g. `inputsource`

```bash
$ where inputsource
/usr/bin/inputsource
/usr/local/bin/inputsource

$ which inputsource
/usr/local/bin/inputsource

$ ls -l intputsource
lrwxr-xr-x  1 icehe  admin  43 Sep  9 12:50 /usr/local/bin/inputsource -> /Users/icehe/.tool/inputsource/inputsource
```
