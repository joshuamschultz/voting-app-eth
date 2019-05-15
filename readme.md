##

Start project 

`truffle init`
`truffle develop`

`git init`

## Testing
Open Ganache App

1. compile using `solcjs --bin --abi [files(s)]`
2. `$ node`
> `Web3 = require('web3');`
> `ganache = require("ganache-cli");`
> `web3 = new Web3('http://');`
> `provider = new Web3.providers.HttpProvider("http://localhost:7545");` use the ganache given port
> `web3.setProvider(provider);`
> test with `web3.eth.getAccounts(console.log)`

## Set info
> bytecode = fs.readFileSync('Voting_sol_Voting.bin').toString()
> abi = JSON.parse(fs.readFileSync('Voting_sol_Voting.abi').toString())

## Deploy
> `deployedContract = new web3.eth.Contract(abi)`
> `listOfCandidates = ['Kevin', 'Kyle', 'Josh']`
> 
```
deployedContract.deploy({
  data: bytecode,
  arguments: [listOfCandidates.map(name => web3.utils.asciiToHex(name))]
}).send({
  from: '0x90752EfB9E5Ce936a153B195a0e0835d80052f11',
  gas: 1500000,
  gasPrice: web3.utils.toWei('0.00003', 'ether')
});
```

set the address manually. Get from Ganache gui and 

`deployedContract.options.address = 'ADDRESS'`

Use an actual addres for the send(from: )

`deployedContract.options.address = '0x9dc8651DA748B2c678373bC4C3904a97dC33b7e5'`

set actual contract address created.


Vote for Josh
`deployedContract.methods.totalVotesFor(web3.utils.asciiToHex('Josh')).call({from: '0x7cC51Ca0dcF8c5267241De7cB5fd014C1B9a2d30'}).then((f) => console.log(f))`

See how many votes for Josh
`deployedContract.methods.voteForCandidate(web3.utils.asciiToHex('Josh')).send({from: '0x7cC51Ca0dcF8c5267241De7cB5fd014C1B9a2d30'}).then((f) => console.log(f))`