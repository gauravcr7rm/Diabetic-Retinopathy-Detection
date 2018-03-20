# To run, this assumes that you are in the directory with the images
# unpacked into train/ and test/.  To run, it works best to use GNU
# parallel as
#
#   ls train/*.jpeg test/*.jpeg | parallel ./Preprocessing/run_hue.sh

out_dir=processed/run-hue-1
mkdir -p $out_dir/train
mkdir -p $out_dir/test
out=$out_dir/$1
[ -e $out ] && echo "Skip $1" || echo "$1 -> $out"
[ -e $out ] || \
    convert -fuzz 10% -trim +repage -modulate 100,100,80 -resize $size -gravity center -background black -extent $size -equalize $1 $out

out_dir=processed/run-hue-2
mkdir -p $out_dir/train
mkdir -p $out_dir/test
out=$out_dir/$1
[ -e $out ] && echo "Skip $1" || echo "$1 -> $out"
[ -e $out ] || \
    convert -fuzz 10% -trim +repage -modulate 100,100,120 -resize $size -gravity center -background black -extent $size -equalize $1 $out
