+ some programs don't take stdin as a way to be able to pass arguments, therefore, xargs allows you to transform stdin into a set of arguments to be passed into next program.

+ create an argument list

```bash
# prepare
mkdir /tmp/xargs.test
cd /tmp/xargs.test

cat > testfile1 <<-EOF
aoeu
aoeu
aoeu
aoeu
aoeu
aoeu
aoeu
EOF

cat > grouped <<-EOF
aoeu aoeu aoeu aoeu aoeu foo aoeu
aoeu
aoeu aoeu aoeu aoeu
EOF

cp testfile1 testfile2
cp testfile1 testfile3
cp testfile1 testfile4
cp testfile1 testfile5
touch test
touch outline.md
touch ls-to-cat

# e.g.1
cat testfile1
cat testfile1 | xargs
cat testfile1 | xargs -t # -t means --verbose
cat testfile1 | xargs -t -n1 # -n means --max-args
cat testfile1 | xargs -t -n2

# e.g.2
cat grouped
cat grouped | xargs
cat grouped | xargs -t
cat grouped | xargs -t -n 1
cat grouped | xargs -t -n 2

cat grouped | xargs -t ls

# e.g.3
ls | xargs cat

# e.g.4
ls | xargs -I {} echo "hello -> {}" # -I means replace-str
ls | grep -v .md | xargs -I {} mv {} {}.c
echo "a b c d e f" | xargs

# e.g.5
# see man xargs(-P max-procs, --max-procs=max-procs)
# 并行执行 parallel
echo "a b c d e f" | xargs -n 1 -P 4 bash -c 'sleep 1; echo $0'
```

