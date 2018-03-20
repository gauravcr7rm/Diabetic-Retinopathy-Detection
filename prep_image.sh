size=256x256

out_dir = preprocessed/run-normal
mkdir -p $out_dir/train
mkdir -p $out_dir/test
out=$out_dir/$1
[ -e $out ] && echo "Skip $1" || echo "$1 -> $out"
[ -e $out ] || \
convert -fuzz 10% -trim +repage -resize $size -gravity center -background black -extent $size -equalize $1 $out
