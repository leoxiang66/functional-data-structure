cd fds
npm run build
cd ..
cp -R fds/dist/* docs/
rm -rf fds/dist*