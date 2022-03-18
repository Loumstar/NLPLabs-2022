URL="https://raw.githubusercontent.com/pytorch/examples/master/word_language_model/data/wikitext-2"

for split in "train" "valid" "test"; do
  if [ ! -f "${split}.txt" ]; then
    echo "Downloading ${split}.txt"
    wget -q "${URL}/${split}.txt"
    # Remove empty lines
    sed -i '/^ *$/d' "${split}.txt"
    # Remove article titles starting with = and ending with =
    sed -i '/^ *= .* = $/d' "${split}".txt
  fi
done

# Prepare smaller version for fast training neural LMs
head -n 5000 < train.txt > train_small.txt

# Print the first 10 lines with line numbers
cat -n train.txt | head -n10
echo

# Print some statistics
echo -e "\n   Line,   word,   character counts"
wc *.txt
