
# usage ./untar key input_filename

openssl enc -d -aes-256-cbc -md sha256 -pass pass:$1 -in $2| tar -xz