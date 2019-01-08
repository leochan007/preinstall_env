.PHONY: clean start stop build

BITCOIN_HOME=/home/$(USER)/bitcoin
BITCOIND=$(BITCOIN_HOME)/bin/bitcoind
BITCOINCLI=$(BITCOIN_HOME)/bin/bitcoin-cli
B1_FLAGS=-regtest
B2_FLAGS=-regtest -rpcport=18333
B1=-datadir=$(BITCOIN_HOME)/testdata/1 $(B1_FLAGS)
B2=-datadir=$(BITCOIN_HOME)/testdata/2 $(B2_FLAGS)
BLOCKS=1
ADDRESS=
AMOUNT=
ACCOUNT=

BITCOIN_SRC_DIR=/home/$(USER)/Documents/src_codes/dapp/bitcoin
DB4_LIB_DIR=$(BITCOIN_HOME)/db4

ps:
	ps aux|grep bitcoind

start:
	mkdir -p $(BITCOIN_HOME)/testdata/1
	mkdir -p $(BITCOIN_HOME)/testdata/2
	$(BITCOIND) $(B1) -daemon
	$(BITCOIND) $(B2) -daemon

gen:
	$(BITCOINCLI) $(B1) generate $(BLOCKS)

getb:
	$(BITCOINCLI) $(B1) getblockchaininfo
	$(BITCOINCLI) $(B2) getblockchaininfo

getn:
	$(BITCOINCLI) $(B1) getnetworkinfo
	$(BITCOINCLI) $(B2) getnetworkinfo

getw:
	$(BITCOINCLI) $(B1) getwalletinfo
	$(BITCOINCLI) $(B2) getwalletinfo

send:
	$(BITCOINCLI) $(B1) sendtoaddress $(ADDRESS) $(AMOUNT)

send2:
	$(BITCOINCLI) $(B2) sendtoaddress $(ADDRESS) $(AMOUNT)

address:
	$(BITCOINCLI) $(B1) getnewaddress $(ACCOUNT)

address2:
	$(BITCOINCLI) $(B2) getnewaddress $(ACCOUNT)

stop:
	-$(BITCOINCLI) $(B1) stop
	-$(BITCOINCLI) $(B2) stop

build-bitcoin:
	cd $(BITCOIN_SRC_DIR) && ./autogen.sh && ./configure LDFLAGS="-L$(DB4_LIB_DIR)/lib" CPPFLAGS="-I$(DB4_LIB_DIR)/include"  --prefix=$(BITCOIN_HOME) && make
	cd $(BITCOIN_SRC_DIR) && sudo make install

build: | stop build-bitcoin clean start

clean: stop
	find $(BITCOIN_HOME)/testdata/1/regtest/* -not -name 'server.*' -delete
	find $(BITCOIN_HOME)/testdata/2/regtest/* -not -name 'server.*' -delete
	rm -rf $(BITCOIN_HOME)/testdata/
