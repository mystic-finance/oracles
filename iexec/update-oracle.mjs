import { IExecOracleFactory, utils } from "@iexec/iexec-oracle-factory-wrapper";
import { ethers } from "ethers";
import dotenv from "dotenv";
dotenv.config();

const rpc = process.env.RPC_URL;
const privateKey = process.env.PRIVATE_KEY;
// new ethers.Wallet(PRIVATE_KEY, new ethers.JsonRpcProvider("https://bellecour.iex.ec"))
// Create ethers provider
const provider = new ethers.providers.JsonRpcProvider(rpc); // Replace with your RPC URL

// If you need to add a signer (for transactions)
const signer = new ethers.Wallet(privateKey, provider);
// instantiate
const factory = new IExecOracleFactory(
  utils.getSignerFromPrivateKey(rpc, privateKey),
  {
    oracleContract: "0x36dA71ccAd7A67053f0a4d9D5f55b725C9A25A3E",
    workerpool: "prod-v8-learn.main.pools.iexec.eth",
    oracleApp: "oracle-factory.apps.iexec.eth",
  }
);
const oracleUrl = process.env.ORACLE_URL;

// create an observable
const updateOracleObservable = factory.updateOracle(
  "QmUD7S1TM71BpujJi5gLbb7H3dWLp35NE6uqjNhbnsYutn",
  {
    workerpool: "prod-v8-learn.main.pools.iexec.eth",
    targetBlockchains: [137],
  }
);

// subscribe to the observable and start the workflow
updateOracleObservable.subscribe({
  next: (data) => {
    console.log("next", data);
  },
  error: (error) => {
    console.log("error", error);
  },
  complete: () => {
    console.log("Oracle update Completed");
  },
});

// next {
//   message: 'PARAM_SET_CREATED',
//   paramSet: {
//     JSONPath: '$.USD',
//     body: '',
//     dataType: 'number',
//     dataset: '0x0000000000000000000000000000000000000000',
//     headers: {},
//     method: 'GET',
//     url: 'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD'
//   }
// }
// next {
//   message: 'ORACLE_ID_COMPUTED',
//   oracleId: '0x21c4f9a7edaefc4d28ba07193e0a7f13858fc363002378434608f3296ae1c676'
// }
// next {
//   message: 'PARAM_SET_UPLOADED',
//   cid: 'QmUD7S1TM71BpujJi5gLbb7H3dWLp35NE6uqjNhbnsYutn',
//   multiaddr: '/ipfs/QmUD7S1TM71BpujJi5gLbb7H3dWLp35NE6uqjNhbnsYutn'
// }
