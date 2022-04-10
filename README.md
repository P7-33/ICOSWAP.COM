# ICOSWAP
BIP: 39
  Layer: Applications
  Title:  "ICOSWAP.COM" Mnemonic encode for generating deterministic keys
  Author: "ICOSWAP.COM" 
          
  Comments-Summary: Unanimously Discourage for implementation
  Comments-URI: /Comment
  Some basic Git commands are:
```
git status
git add
git commit
```
Use `git status` to list all new or modified files that haven't yet been committed.
Some basic Git commands are:

  Type: Standards Track
  
  Created: 2013-09-10
  name:ICOSWAP COIN 
---
description: Tutorial on how to write to a smart contract with Go.
---

# Writing to a Smart Contract

These section requires knowledge of how to compile a smart contract's ABI to a Go contract file. If you haven't already gone through it, please [read the section](../smart-contract-compile) first.

Writing to a smart contract requires us to sign the sign transaction with our private key.

```go
privateKey, err := crypto.HexToECDSA("fad9c8855b740a0b7ed4c221dbad0f33a83a49cad6b3fe8d5817ac83d38b6a19")
if err != nil {
  log.Fatal(err)
}

publicKey := privateKey.Public()
publicKeyECDSA, ok := publicKey.(*ecdsa.PublicKey)
if !ok {
  log.Fatal("cannot assert type: publicKey is not of type *ecdsa.PublicKey")
}

fromAddress := crypto.PubkeyToAddress(*publicKeyECDSA)
```

We'll also need to  figure the nonce and gas price.

```go
nonce, err := client.PendingNonceAt(context.Background(), fromAddress)
if err != nil {
  log.Fatal(err)
}

gasPrice, err := client.SuggestGasPrice(context.Background())
if err != nil {
  log.Fatal(err)
}
```

Next we create a new keyed transactor which takes in the private key.

```go
auth := bind.NewKeyedTransactor(privateKey)
```

Then we need to set the standard transaction options attached to the keyed transactor.

```go
auth.Nonce = big.NewInt(int64(nonce))
auth.Value = big.NewInt(0)     // in wei
auth.GasLimit = uint64(300000) // in units
auth.GasPrice = gasPrice
```

Now we load an instance of the smart contract. If you recall in the [previous sections](../smart-contract-compile) we create a contract called *Store* and generated a Go package file using the `abigen` tool. To initialize it we just invoke the *New* method of the contract package and give the smart contract address and the ethclient, which returns a contract instance that we can use.


```go
address := common.HexToAddress("0x147B8eb97fD247D06C4006D269c90C1908Fb5D54")
instance, err := store.NewStore(address, client)
if err != nil {
  log.Fatal(err)
}
```

The smart contract that we created has an external method called *SetItem* which takes in two arguments (key, value) in the from of solidity `bytes32`. This means that the Go contract package requires us to pass a byte array of length 32 bytes. Invoking the *SetItem* method requires us to pass the `auth` object we created earlier. Behind the scenes this method will encode this function call with it's arguments, set it as the `data` property of the transaction, and sign it with the private key. The result will be a signed transaction object.

```go
key := [32]byte{}
value := [32]byte{}
copy(key[:], []byte("foo"))
copy(value[:], []byte("bar"))

tx, err := instance.SetItem(auth, key, value)
if err != nil {
  log.Fatal(err)
}

fmt.Printf("tx 

To verify that the key/value was set, we read the smart contract mapping value.

```go
result, err := instance.Items(nil, key)
if err != nil {
  log.Fatal(err)
}

fmt.Println(string(result[:])) // "bar"
```

There you have it.

---

### Full code

Commands

```bash
solc --abi Store.sol
solc --bin Store.sol
abigen --bin=Store_sol_Store.bin --abi=Store_sol_Store.abi --pkg=store --out=Store.go


**In**

```js
// ES2020 nullish coalescing
function greet(input) {
  return input ?? "Hello world";
}
```

**Out**

```js
function greet(input) {
  return input != null ? input : "Hello world";
}

```solidity
pragma solidity ^0.4.24;

contract Store {
  event ItemSet(bytes32 key, bytes32 value);

  string public version;
  mapping (bytes32 => bytes32) public items;

  constructor(string _version) public {
    version = _version;
  }

  function setItem(bytes32 key, bytes32 value) external {
    items[key] = value;
    emit ItemSet(key, value);
  }
}


```go
package main

import (
	"fmt"
	"log"
	store "./contracts" // for demo
)

func main() {
	client, err := 
        
	if err != nil {
		log.Fatal(err)
	}

	privateKey, err := crypto.HexToECDSA("fad9c8855b740a0b7ed4c221dbad0f33a83a49cad6b3fe8d5817ac83d38b6a19")
	if err != nil {
		log.Fatal(err)
	}

	publicKey := privateKey.Public()
	publicKeyECDSA, ok := publicKey.(*ecdsa.PublicKey)
	if !ok {
		log.Fatal("cannot assert type: publicKey is not of type *ecdsa.PublicKey")
	}

	fromAddress := crypto.PubkeyToAddress(*publicKeyECDSA)
	nonce, err := client.PendingNonceAt(context.Background(), fromAddress)
	if err != nil {
		log.Fatal(err)
	}

	gasPrice, err := client.SuggestGasPrice(context.Background())
	if err != nil {
		log.Fatal(err)
	}

	auth := bind.NewKeyedTransactor(privateKey)
	auth.Nonce = big.NewInt(int64(nonce))
	auth.Value = big.NewInt(0)     // in wei
	auth.GasLimit = uint64(300000) // in units
	auth.GasPrice = gasPrice

	address := 
	instance, err := store.NewStore(address, client)
	if err != nil {
		log.Fatal(err)
	}

	key := [32]byte{}
	value := [32]byte{}
	copy(key[:], []byte("foo"))
	copy(value[:], []byte("bar"))

	tx, err := instance.SetItem(auth, key, value)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("tx sent: %s", tx.Hash().Hex()) // tx sent: 

	result, err := instance.Items(nil, key)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(string(result[:])) // "bar"
}
```

solc version used for these examples

```bash
$ solc --version
0.4.24.Emscripten.clang
```

Earn so fast
## Links

* [Slack][]: 

* 
* 

[Slack]: https://bundler.slack.com/
[github 
[code climate]: https://codeclimate

https://docs.ethers.io/v5/

$(function() {
  if ($('#home_query').length){
    autocomplete($('#home_query'));
    var suggest = $('#suggest-home');
  } else {
    autocomplete($('#query'));
    var suggest = $('#suggest');
  }
  var indexNumber = -1;
  function autocomplete(search) {
    search.bind('input', function(e) {
      var term = $.trim($(search).val());
      if (term.length >= 2) {
        $.ajax({
          url: '/api/v1/search/autocomplete',
          type: 'GET',
          data: ('query=' + term),
          processData: false,
          dataType: 'json'
        }).done(function(data) {
          addToSuggestList(search, data);
        });
      } else {
        suggest.find('li').remove();
      }
    });
  function addToSuggestList(search, data) {
    suggest.find('li').remove();

    for (var i = 0; i < data.length && i < 10; i++) {
      var newItem = $('<li>').text(data[i]);
      $(newItem).attr('class', 'menu-item');
      suggest.append(newItem);
      /* submit the search form if li item was clicked */
      newItem.click(function() {
        search.val($(this).html());
        search.parent().submit()
      });
      newItem.hover(function () {
        $('li').removeClass('selected');
        $(this).addClass("selected");
      });
    }
    indexNumber = -1;
  };
  function focusItem(search){
    var suggestLength = suggest.find('li').length;
    if (indexNumber >= suggestLength) indexNumber = 0;
    if (indexNumber < 0) indexNumber = suggestLength - 1;
    $('li').removeClass('selected');
    suggest.find('li').eq(indexNumber).addClass('selected');
    search.val(suggest.find('.selected').text());
  };

  /* remove suggest drop down if clicked anywhere on page */
  $('html').click(function(e) { suggest.find('li').remove(); });
})

## Using solidity interfaces
[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_upgradedAddress","type":"address"}],"name":"deprecate","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"deprecated","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_evilUser","type":"address"}],"name":"addBlackList","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"upgradedAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"maximumFee","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"_totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"unpause","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_maker","type":"address"}],"name":"getBlackListStatus","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"paused","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_subtractedValue","type":"uint256"}],"name":"decreaseApproval","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"who","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_value","type":"uint256"}],"name":"calcFee","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"pause","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"who","type":"address"}],"name":"oldBalanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newBasisPoints","type":"uint256"},{"name":"newMaxFee","type":"uint256"}],"name":"setParams","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"issue","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_addedValue","type":"uint256"}],"name":"increaseApproval","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"redeem","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"remaining","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"basisPointsRate","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"isBlackListed","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_clearedUser","type":"address"}],"name":"removeBlackList","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"MAX_UINT","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_blackListedUser","type":"address"}],"name":"destroyBlackFunds","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_initialSupply","type":"uint256"},{"name":"_name","type":"string"},{"name":"_symbol","type":"string"},{"name":"_decimals","type":"uint8"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_blackListedUser","type":"address"},{"indexed":false,"name":"_balance","type":"uint256"}],"name":"DestroyedBlackFunds","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"amount","type":"uint256"}],"name":"Issue","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"amount","type":"uint256"}],"name":"Redeem","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newAddress","type":"address"}],"name":"Deprecate","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_user","type":"address"}],"name":"AddedBlackList","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_user","type":"address"}],"name":"RemovedBlackList","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"feeBasisPoints","type":"uint256"},{"indexed":false,"name":"maxFee","type":"uint256"}],"name":"Params","type":"event"},{"anonymous":false,"inputs":[],"name":"Pause","type":"event"},{"anonymous":false,"inputs":[],"name":"Unpause","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"previousOwner","type":"address"},{"indexed":true,"name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]
Tinterfaces are available for import into solidity smart contracts
via the npm artifact `@uniswap/v3-core`, e.g.:

```solidity

import '@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol';
60806040526000600260146101000a81548160ff021916908315150217905550600060035560006004553480156200003657600080fd5b50d380156200004457600080fd5b50d280156200005257600080fd5b5060405162003bd738038062003bd78339810180604052810190808051906020019092919080518201929190602001805182019291906020018051906020019092919050505033600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550836008819055508260059080519060200190620000f8929190620001b7565b50816006908051906020019062000111929190620001b7565b5080600760006101000a81548160ff021916908360ff16021790555083600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055506000600a60146101000a81548160ff0219169083151502179055505050505062000266565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10620001fa57805160ff19168380011785556200022b565b828001600101855582156200022b579182015b828111156200022a5782518255916020019190600101906200020d565b5b5090506200023a91906200023e565b5090565b6200026391905b808211156200025f57600081600090555060010162000245565b5090565b90565b61396180620002766000396000f3006080604052600436106101a1576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806306fdde03146101a65780630753c30c14610250578063095ea7b3146102ad5780630e136b191461032c5780630ecb93c01461037557806318160ddd146103d257806323b872dd1461041757806326976e3f146104b6578063313ce5671461052757806335390714146105725780633eaaf86b146105b75780633f4ba83a146105fc57806359bf1abe1461062d5780635c975abb146106a257806366188463146106eb57806370a082311461076a57806375dc7d8c146107db5780638456cb59146108365780638da5cb5b1461086757806395d89b41146108d8578063a9059cbb14610982578063b7a3446c14610a01578063c0324c7714610a72578063cc872b6614610ac3578063d73dd62314610b0a578063db006a7514610b89578063dd62ed3e14610bd0578063dd644f7214610c61578063e47d606014610ca6578063e4997dc514610d1b578063e5b5019a14610d78578063f2fde38b14610dbd578063f3bdc22814610e1a575b600080fd5b3480156101b257600080fd5b50d380156101bf57600080fd5b50d280156101cc57600080fd5b506101d5610e77565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156102155780820151818401526020810190506101fa565b50505050905090810190601f1680156102425780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561025c57600080fd5b50d3801561026957600080fd5b50d2801561027657600080fd5b506102ab600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610f15565b005b3480156102b957600080fd5b50d380156102c657600080fd5b50d280156102d357600080fd5b50610312600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505061106f565b604051808215151515815260200191505060405180910390f35b34801561033857600080fd5b50d3801561034557600080fd5b50d2801561035257600080fd5b5061035b6111f0565b604051808215151515815260200191505060405180910390f35b34801561038157600080fd5b50d3801561038e57600080fd5b50d2801561039b57600080fd5b506103d0600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050611203565b005b3480156103de57600080fd5b50d380156103eb57600080fd5b50d280156103f857600080fd5b506104016112fd565b6040518082815260200191505060405180910390f35b34801561042357600080fd5b50d3801561043057600080fd5b50d2801561043d57600080fd5b5061049c600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506113e5565b604051808215151515815260200191505060405180910390f35b3480156104c257600080fd5b50d380156104cf57600080fd5b50d280156104dc57600080fd5b506104e56115f5565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561053357600080fd5b50d3801561054057600080fd5b50d2801561054d57600080fd5b5061055661161b565b604051808260ff1660ff16815260200191505060405180910390f35b34801561057e57600080fd5b50d3801561058b57600080fd5b50d2801561059857600080fd5b506105a161162e565b6040518082815260200191505060405180910390f35b3480156105c357600080fd5b50d380156105d057600080fd5b50d280156105dd57600080fd5b506105e6611634565b6040518082815260200191505060405180910390f35b34801561060857600080fd5b50d3801561061557600080fd5b50d2801561062257600080fd5b5061062b61163a565b005b34801561063957600080fd5b50d3801561064657600080fd5b50d2801561065357600080fd5b50610688600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506116fa565b604051808215151515815260200191505060405180910390f35b3480156106ae57600080fd5b50d380156106bb57600080fd5b50d280156106c857600080fd5b506106d1611750565b604051808215151515815260200191505060405180910390f35b3480156106f757600080fd5b50d3801561070457600080fd5b50d2801561071157600080fd5b50610750600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050611763565b604051808215151515815260200191505060405180910390f35b34801561077657600080fd5b50d3801561078357600080fd5b50d2801561079057600080fd5b506107c5600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506118e4565b6040518082815260200191505060405180910390f35b3480156107e757600080fd5b50d380156107f457600080fd5b50d2801561080157600080fd5b5061082060048036038101908080359060200190929190505050611a0b565b6040518082815260200191505060405180910390f35b34801561084257600080fd5b50d3801561084f57600080fd5b50d2801561085c57600080fd5b50610865611a52565b005b34801561087357600080fd5b50d3801561088057600080fd5b50d2801561088d57600080fd5b50610896611b13565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156108e457600080fd5b50d380156108f157600080fd5b50d280156108fe57600080fd5b50610907611b39565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561094757808201518184015260208101905061092c565b50505050905090810190601f1680156109745780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561098e57600080fd5b50d3801561099b57600080fd5b50d280156109a857600080fd5b506109e7600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050611bd7565b604051808215151515815260200191505060405180910390f35b348015610a0d57600080fd5b50d38015610a1a57600080fd5b50d28015610a2757600080fd5b50610a5c600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050611db1565b6040518082815260200191505060405180910390f35b348015610a7e57600080fd5b50d38015610a8b57600080fd5b50d28015610a9857600080fd5b50610ac16004803603810190808035906020019092919080359060200190929190505050611dde565b005b348015610acf57600080fd5b50d38015610adc57600080fd5b50d28015610ae957600080fd5b50610b0860048036038101908080359060200190929190505050611ed4565b005b348015610b1657600080fd5b50d38015610b2357600080fd5b50d28015610b3057600080fd5b50610b6f600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506120e4565b604051808215151515815260200191505060405180910390f35b348015610b9557600080fd5b50d38015610ba257600080fd5b50d28015610baf57600080fd5b50610bce60048036038101908080359060200190929190505050612265565b005b348015610bdc57600080fd5b50d38015610be957600080fd5b50d28015610bf657600080fd5b50610c4b600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050612475565b6040518082815260200191505060405180910390f35b348015610c6d57600080fd5b50d38015610c7a57600080fd5b50d28015610c8757600080fd5b50610c906125d2565b6040518082815260200191505060405180910390f35b348015610cb257600080fd5b50d38015610cbf57600080fd5b50d28015610ccc57600080fd5b50610d01600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506125d8565b604051808215151515815260200191505060405180910390f35b348015610d2757600080fd5b50d38015610d3457600080fd5b50d28015610d4157600080fd5b50610d76600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506125f8565b005b348015610d8457600080fd5b50d38015610d9157600080fd5b50d28015610d9e57600080fd5b50610da76126f2565b6040518082815260200191505060405180910390f35b348015610dc957600080fd5b50d38015610dd657600080fd5b50d28015610de357600080fd5b50610e18600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050612716565b005b348015610e2657600080fd5b50d38015610e3357600080fd5b50d28015610e4057600080fd5b50610e75600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919050505061286e565b005b60058054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015610f0d5780601f10610ee257610100808354040283529160200191610f0d565b820191906000526020600020905b815481529060010190602001808311610ef057829003601f168201915b505050505081565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141515610f7157600080fd5b600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1614151515610fad57600080fd5b6001600a60146101000a81548160ff02191690831515021790555080600a60006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055507fcc358699805e9a8b7f77b522628c7cb9abd07d9efb86b6fb616af1609036a99e81604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390a150565b6000600260149054906101000a900460ff1615151561108d57600080fd5b600a60149054906101000a900460ff16156111dd57600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663aee92d333385856040518463ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019350505050602060405180830381600087803b15801561119b57600080fd5b505af11580156111af573d6000803e3d6000fd5b505050506040513d60208110156111c557600080fd5b810190808051906020019092919050505090506111ea565b6111e783836129e0565b90505b92915050565b600a60149054906101000a900460ff1681565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614151561125f57600080fd5b6001600960008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060006101000a81548160ff0219169083151502179055508073ffffffffffffffffffffffffffffffffffffffff167f42e160154868087d6bfdc0ca23d96a1c1cfa32f1b72ba9ba27b69b98a0d819dc60405160405180910390a250565b6000600a60149054906101000a900460ff16156113dc57600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166318160ddd6040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561139a57600080fd5b505af11580156113ae573d6000803e3d6000fd5b505050506040513d60208110156113c457600080fd5b810190808051906020019092919050505090506113e2565b60085490505b90565b6000600260149054906101000a900460ff1615151561140357600080fd5b600960008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060009054906101000a900460ff1615151561145c57600080fd5b600a60149054906101000a900460ff16156115e057600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16638b477adb338686866040518563ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001828152602001945050505050602060405180830381600087803b15801561159e57600080fd5b505af11580156115b2573d6000803e3d6000fd5b505050506040513d60208110156115c857600080fd5b810190808051906020019092919050505090506115ee565b6115eb848484612ad2565b90505b9392505050565b600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600760009054906101000a900460ff1681565b60045481565b60085481565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614151561169657600080fd5b600260149054906101000a900460ff1615156116b157600080fd5b6000600260146101000a81548160ff0219169083151502179055507f7805862f689e2f13df9f062ff482ad3ad112aca9e0847911ed832e158c525b3360405160405180910390a1565b6000600960008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060009054906101000a900460ff169050919050565b600260149054906101000a900460ff1681565b6000600260149054906101000a900460ff1615151561178157600080fd5b600a60149054906101000a900460ff16156118d157600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16636001279f3385856040518463ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019350505050602060405180830381600087803b15801561188f57600080fd5b505af11580156118a3573d6000803e3d6000fd5b505050506040513d60208110156118b957600080fd5b810190808051906020019092919050505090506118de565b6118db83836130be565b90505b92915050565b6000600a60149054906101000a900460ff16156119fa57600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231836040518263ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001915050602060405180830381600087803b1580156119b857600080fd5b505af11580156119cc573d6000803e3d6000fd5b505050506040513d60208110156119e257600080fd5b81019080805190602001909291905050509050611a06565b611a038261334f565b90505b919050565b600080611a37612710611a296003548661339790919063ffffffff16565b6133d290919063ffffffff16565b9050600454811115611a495760045490505b80915050919050565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141515611aae57600080fd5b600260149054906101000a900460ff16151515611aca57600080fd5b6001600260146101000a81548160ff0219169083151502179055507f6985a02210a168e66602d3235cb6db0e70f92b3ba4d376a33c0f3d9434bff62560405160405180910390a1565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60068054600181600116156101000203166002900480601f016020809104026020016040519081016040528092919081815260200182805460018160011615610100020316600290048015611bcf5780601f10611ba457610100808354040283529160200191611bcf565b820191906000526020600020905b815481529060010190602001808311611bb257829003601f168201915b505050505081565b6000600260149054906101000a900460ff16151515611bf557600080fd5b600960003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060009054906101000a900460ff16151515611c4e57600080fd5b600a60149054906101000a900460ff1615611d9e57600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16636e18980a3385856040518463ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019350505050602060405180830381600087803b158015611d5c57600080fd5b505af1158015611d70573d6000803e3d6000fd5b505050506040513d6020811015611d8657600080fd5b81019080805190602001909291905050509050611dab565b611da883836133ed565b90505b92915050565b6000600a60149054906101000a900460ff1615611dd857611dd18261334f565b9050611dd9565b5b919050565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141515611e3a57600080fd5b601482101515611e4957600080fd5b603281101515611e5857600080fd5b81600381905550611e87600760009054906101000a900460ff1660ff16600a0a8261339790919063ffffffff16565b6004819055507fb044a1e409eac5c48e5af22d4af52670dd1a99059537a78b31b48c6500a6354e600354600454604051808381526020018281526020019250505060405180910390a15050565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141515611f3057600080fd5b611fa381600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461345c90919063ffffffff16565b600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000208190555061201c8160085461345c90919063ffffffff16565b6008819055507fcb8241adb0c3fdb35b70c24ce35c5eb0c17af7431c99f827d44a445ca624176a816040518082815260200191505060405180910390a1600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16600073ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a350565b6000600260149054906101000a900460ff1615151561210257600080fd5b600a60149054906101000a900460ff161561225257600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a95381573385856040518463ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019350505050602060405180830381600087803b15801561221057600080fd5b505af1158015612224573d6000803e3d6000fd5b505050506040513d602081101561223a57600080fd5b8101908080519060200190929190505050905061225f565b61225c838361347a565b90505b92915050565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161415156122c157600080fd5b6122d68160085461367690919063ffffffff16565b60088190555061234f81600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461367690919063ffffffff16565b600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055507f702d5967f45f6513a38ffc42d6ba9bf230bd40e8f53b16363c7eb4fd2deb9a44816040518082815260200191505060405180910390a1600073ffffffffffffffffffffffffffffffffffffffff16600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a350565b6000600a60149054906101000a900460ff16156125bf57600a60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663dd62ed3e84846040518363ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200192505050602060405180830381600087803b15801561257d57600080fd5b505af1158015612591573d6000803e3d6000fd5b505050506040513d60208110156125a757600080fd5b810190808051906020019092919050505090506125cc565b6125c9838361368f565b90505b92915050565b60035481565b60096020528060005260406000206000915054906101000a900460ff1681565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614151561265457600080fd5b6000600960008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060006101000a81548160ff0219169083151502179055508073ffffffffffffffffffffffffffffffffffffffff167fd7e9ec6e6ecd65492dce6bf513cd6867560d49544421d0783ddf06e76c24470c60405160405180910390a250565b7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff81565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614151561277257600080fd5b600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff16141515156127ae57600080fd5b8073ffffffffffffffffffffffffffffffffffffffff16600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff167f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e060405160405180910390a380600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050565b6000600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161415156128cc57600080fd5b600960008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060009054906101000a900460ff16151561292457600080fd5b61292d826118e4565b905060008060008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055506129888160085461367690919063ffffffff16565b6008819055508173ffffffffffffffffffffffffffffffffffffffff167f61e6e66b0d6339b2980aecc6ccc0039736791f0ccde9ed512e789a7fbdd698c6826040518082815260200191505060405180910390a25050565b600081600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925846040518082815260200191505060405180910390a36001905092915050565b60008060008073ffffffffffffffffffffffffffffffffffffffff168573ffffffffffffffffffffffffffffffffffffffff1614151515612b1257600080fd5b6000808773ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020548411151515612b5f57600080fd5b600160008773ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020548411151515612bea57600080fd5b612bf384611a0b565b9150612c08828561367690919063ffffffff16565b9050612c5b846000808973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461367690919063ffffffff16565b6000808873ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550612cee816000808873ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461345c90919063ffffffff16565b6000808773ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff600160008873ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020541015612ee457612e6384600160008973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461367690919063ffffffff16565b600160008873ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055505b8473ffffffffffffffffffffffffffffffffffffffff168673ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef836040518082815260200191505060405180910390a360008211156130b157612fc582600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461345c90919063ffffffff16565b600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168673ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a35b6001925050509392505050565b600080600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050808311156131cf576000600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550613263565b6131e2838261367690919063ffffffff16565b600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055505b8373ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008873ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020546040518082815260200191505060405180910390a3600191505092915050565b60008060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b60008060008414156133ac57600091506133cb565b82840290508284828115156133bd57fe5b041415156133c757fe5b8091505b5092915050565b60008082848115156133e057fe5b0490508091505092915050565b60008060006133fb84611a0b565b9150613410828561367690919063ffffffff16565b905061341c8582613716565b50600082111561345457613452600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1683613716565b505b505092915050565b600080828401905083811015151561347057fe5b8091505092915050565b600061350b82600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461345c90919063ffffffff16565b600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008773ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020546040518082815260200191505060405180910390a36001905092915050565b600082821115151561368457fe5b818303905092915050565b6000600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054905092915050565b60008073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff161415151561375357600080fd5b6000803373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205482111515156137a057600080fd5b6137f1826000803373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461367690919063ffffffff16565b6000803373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002081905550613884826000808673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205461345c90919063ffffffff16565b6000808573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a360019050929150505600a165627a7a72305820ebc7abb2eb78f3b47e72fe9da09012eb7735aa2af8f739851b7e93bb4f8f813400290000000000000000000000000000000000000000000000000000000000989680000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000a546574686572205553440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000045553445400000000000000000000000000000000000000000000000000000000
contract MyContract {
  swapbrowserPool pool;

  function doSomethingWithPool() {
    // pool.swap(...);
  }
}                                                Trinity College Dublin
                                                                                                                           Entrust
                                                              R. Housley
                                                          Vigil Security
                                                                 W. Polk
                                                                    NIST
                                                                May 2008


         Internet X.509 Public Key Infrastructure Certificate
             and Certificate Revocation List (CRL) Profile

Status of This Memo

   This document specifies an Internet standards track protocol for the
   Internet community, and requests discussion and suggestions for
   improvements.  Please refer to the current edition of the "Internet
   Official Protocol Standards" (STD 1) for the standardization state
   and status of this protocol.  Distribution of this memo is unlimited.

Abstract

   This memo profiles the X.509 v3 certificate and X.509 v2 certificate
   revocation list (CRL) for use in the Internet.  An overview of this
   approach and model is provided as an introduction.  The X.509 v3
   certificate format is described in detail, with additional
   information regarding the format and semantics of Internet name
   forms.  Standard certificate extensions are described and two
   Internet-specific extensions are defined.  A set of required
   certificate extensions is specified.  The X.509 v2 CRL format is
   described in detail along with standard and Internet-specific
   extensions.  An algorithm for X.509 certification path validation is
   described.  An ASN.1 module and examples are provided in the
   appendices.

Table of Contents

   1. Introduction ....................................................4
   2. Requirements and Assumptions ....................................6
      2.1. Communication and Topology .................................7
      2.2. Acceptability Criteria .....................................7
      2.3. User Expectations ..........................................7
      2.4. Administrator Expectations .................................8
   3. Overview of Approach ............................................8
      3.1. X.509 Version 3 Certificate ................................9
      3.2. Certification Paths and Trust .............................10
      3.3. Revocation ................................................13
      3.4. Operational Protocols ............
      3.5. Management Protocols ......................................14
   4. Certificate and Certificate Extensions Profile .................16
      4.1. Basic Certificate Fields ..................................16
           4.1.1. Certificate Fields .................................17
                  4.1.1.1. tbsCertificate ............................18
                  4.1.1.2. signatureAlgorithm ........................18
                  4.1.1.3. signatureValue ............................18
           4.1.2. TBSCertificate .....................................18
                  4.1.2.1. Version ...................................19
                  4.1.2.2. Serial Number .............................19
                  4.1.2.3. Signature .................................19
                  4.1.2.4. Issuer ...............

SIGN UPLOG IN

Reputation
1.0.0

Export
Info
Tags
Servers
https://datatracker.ietf.org/doc/html/rfc3280

Public
GET/contract/{contract_address}/roundAtTime
GET/contract/{contract_address}/round
GET//{_address}/feeds
GET//{_address}/latestN
GET//{_address}/timeStats
GET//graph
GET//all
GET/contract/topN
GET/swapbrowser/topN
Schemas
Aa
SAVE
Read Only


          required: true
          schema:
            type: integer
            format: int64
            minimum: 0
          example: 1628832878
      responses:
        '200':
          description: search results matching 
            criteria
  /contract/{contract_address}/round:
    get:
      tags:
        - Public
      summary: Retrieves data on all transactions for 
        a given contract and round
      operationId: CRound
      description: By passing in the appropriate 
        options, you can search for
        available inventory in the system
      parameters:
        - in: path
          name: contract_address
          description: The address of the contract you 
            want to query for
          required: true
          schema:
            type: string
          example: 
            "0xD9AB973c8D3f220268B02Ff2Bd40f7B44EcC5f94"
            0"
        - in: query
          name: round_id
          description: The ID of the round
          required: true
          schema:
            type: integer
          example: 3256
        - in: query
          name: contract_type
          description: The type of contract (ocr, flux
            )
          schema:
            type: string
          example: ocr
        - in: query
          name: source
          description: Which network to conduct the 
            search in (BSC, Polygon, Eth_Mainnet)
          schema:
            type: string
          example: BSC
      responses:
        '200':
          description: search results matching 
            criteria
  /oracle/{oracle_address}/feeds:
    get:
      tags:
        - Public
      summary: Returns what feeds(contracts) this 
        oracle has serviced and the oracles 
        performance on them
      operationId: feeds
      description: By passing in the appropriate 
        options, you can search for
        available inventory in the system
      parameters:
        - in: path
          _address
          description: The addres
            want to query for
          required: true
          schema:
Last Saved:
Valid Definition
No Errors or Warnings
The Reputation API
 1.0.0 
OAS3
The Public API for Reputation.link. We offer data across Oracles that power the Chainlink network.

Contact the developer
Apache 2.0
Servers
Public
Operations available to anyone
GET
​/contract​/{contract_address}​/roundAtTime
Retrieves the contract answer and answer statistics for a round closest to the passed in timestamp
By passing in the appropriate options, you can search for available inventory in the system

Parameters
Try it out
Name	Description
contract_address *
string
(path)
The address of the contract you want to query from
block_time *




