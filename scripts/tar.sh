
# usage ./tar.sh key output_filename folder

tar -czO $3 | openssl enc -aes-256-cbc -md sha256 -pass pass:$1 > $2