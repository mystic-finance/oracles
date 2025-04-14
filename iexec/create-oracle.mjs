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
  utils.getSignerFromPrivateKey(rpc, privateKey)
);
const oracleUrl = process.env.ORACLE_URL;
// const key = process.env.ORACLE_KEY;

// create an observable
const createOracleObservable = factory.createOracle({
  url: `${
    oracleUrl ||
    "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD"
  }`,
  method: "GET",
  headers: {},
  dataType: "number",
  JSONPath: "$.USD",
});

// subscribe to the observable and start the workflow
createOracleObservable.subscribe({
  next: (data) => {
    console.log("next", data);
  },
  error: (error) => {
    console.log("error", error);
  },
  complete: () => {
    console.log("Oracle Creation Completed");
  },
});
