# Building prysm binary
git clone https://github.com/prysmaticlabs/prysm && cd prysm
go build -o=../beacon-chain ./cmd/beacon-chain
go build -o=../validator ./cmd/validator
go build -o=../prysmctl ./cmd/prysmctl
cd ..

# Building geth binary
git clone https://github.com/ethereum/go-ethereum && cd go-ethereum
make geth
cp ./build/bin/geth ../geth
cd ..

# Create jwt secret
openssl rand -hex 32 > jwt.hex

# Create genesis
./prysmctl testnet generate-genesis \
    --fork capella \
    --num-validators 64 \
    --genesis-time-delay 600 \
    --chain-config-file config.yml \
    --geth-genesis-json-in original-genesis.json  \
    --geth-genesis-json-out genesis.json \
    --output-ssz genesis.ssz

# import account
./geth --datadir=gethdata account import secret.txt

# Initialize geth
./geth --datadir=gethdata init genesis.json

