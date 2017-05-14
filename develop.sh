trap 'kill %1; kill %2' SIGINT
DIR=development
mkdir $DIR &>/dev/null || true
cp -r codox/ development/
(
  cd $DIR
  python -m pelican.server 5500
) &
pelican --debug --autoreload \
    --theme theme/ \
    --output $DIR/ \
    --settings pelicanconf.py \
    content/ & # NB: the slash at the end of content/ important!
wait
