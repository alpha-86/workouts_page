source /home/work/.bashrc
timestamp1=`stat -c %Y scripts/data.db`
python3 scripts/strava_sync.py ${STRAVA_CLIENT_ID} ${STRAVA_CLIENT_SECRET} ${STRAVA_REFRESH_TOKEN}
timestamp2=`stat -c %Y scripts/data.db`
if [[ $timestamp1 == $timestamp2 ]];then
    echo "$(date "+%Y-%m-%d %H:%M:%S") scripts/data.db not change!"
    exit 0
fi
python3 scripts/gen_svg.py --from-db --title "Activity Grids" --type github --athlete ${WEB_ATHLETE} --special-distance 10 --special-distance2 20 --special-color yellow --special-color2 red --output assets/github.svg --use-localtime --min-distance 0.5
python3 scripts/gen_svg.py --from-db --title "Over 10km Activities" --type grid --athlete ${WEB_ATHLETE}  --output assets/grid.svg --min-distance 10.0 --special-color yellow --special-color2 red --special-distance 20 --special-distance2 40 --use-localtime
python3 scripts/gen_svg.py --from-db --type circular --use-localtime
yarn build
if [ -z $RUNNING_HTML_PATH ];then
    RUNNING_HTML_PATH="/work/html"
fi
mkdir -p $RUNNING_HTML_PATH
rm -rf ${RUNNING_HTML_PATH}
mv public ${RUNNING_HTML_PATH}
