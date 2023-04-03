source /home/work/.bashrc
timestamp1=`stat -c %Y scripts/data.db`
which python
python scripts/strava_sync.py 104827 c1690d604bb56016abe2d53a4085d59452eb0160 1acc536a1d8c062359ddf949ba1dfe95a46fa327
timestamp2=`stat -c %Y scripts/data.db`
if [[ $timestamp1 == $timestamp2 ]];then
    echo "$(date "+%Y-%m-%d %H:%M:%S") scripts/data.db not change!"
    exit 0
fi
python scripts/gen_svg.py --from-db --title "Activity Grids" --type github --athlete "Alpha86" --special-distance 10 --special-distance2 20 --special-color yellow --special-color2 red --output assets/github.svg --use-localtime --min-distance 0.5
python scripts/gen_svg.py --from-db --title "Over 10km Activities" --type grid --athlete "Alpha86"  --output assets/grid.svg --min-distance 10.0 --special-color yellow --special-color2 red --special-distance 20 --special-distance2 40 --use-localtime
python scripts/gen_svg.py --from-db --type circular --use-localtime
yarn build
rm -rf /home/work/nginx/webroot/running
mv public /home/work/nginx/webroot/running
