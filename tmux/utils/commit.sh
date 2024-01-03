cd ~/code/tinygrad/remu
git checkout test_ops
git add .
git commit -m "$1"

git checkout mac-dev
git merge --squash test_ops
git add .
git commit -m "test_ops"
