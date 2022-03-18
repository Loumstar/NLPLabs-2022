# install sacreBLEU
pip install sacrebleu==1.5.0
echo

# Download the corpus
URL="https://raw.githubusercontent.com/multi30k/dataset/master/data/task1/tok"

for split in "train" "val" "test_2016_flickr"; do
  for lang in en de fr; do
    fname="${split}.lc.norm.tok.${lang}"
    if [ ! -f $fname ]; then
      echo "Downloading $fname"
      wget -q "${URL}/$fname" -O "${split/_2016_flickr/}.${lang}"
    fi
  done
done
echo 

# Print the first 10 lines with line numbers of 
# the English and French training data
cat -n train.en | head -n10
echo

cat -n train.fr | head -n10
echo
