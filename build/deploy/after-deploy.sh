#! /bin/sh

if [ ! $RELEASE_NAME ]; then
  exit 0
fi

# check BOT_GITHIB_TOKENS
if [ ! $ACCESS_TOKENS ]; then
  echo "permission denied"
  exit 0
fi

# set git config
git config --global user.name "ftf-bot"
git config --global user.email "jd_ftf@163.com"
git config --global credential.helper store

# release docs
git clone https://$ACCESS_TOKENS@github.com/jd-ftf/jd-ftf.github.io.git
mkdir -p jd-ftf.github.io/wot-design-mini/
VERSION=$(node build/deploy/delete-old.js --version=$RELEASE_NAME --dir=jd-ftf.github.io/wot-design-mini)
cd jd-ftf.github.io/wot-design-mini
rm -f *
rm -rf static
cp -r ../../docs/dist/* ./
mv ../../docs/dist $VERSION
git add -A .
git commit -m "release(wot-design-mini): $RELEASE_NAME"
git push origin master --force
