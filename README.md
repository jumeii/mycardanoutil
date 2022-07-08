# mycardanoutil

**THIS PROJECT IS CURRENTLY A PLAYGROUND FOR LEARNING HASKELL.**  

---

 I hope to build a utility for interacting with my own or existing projects on cardano. I am currently learning and experimenting
 with different development patterns in order to feel more comfortable and better understand the use cases and flow when developing 
 in a functional manner. The first commit of code here includes a few of the learning goals currently implemented. A few of them noted here... 
 
 - git repo commited
 - code compiles
 - reads from multiple config files
 - takes user input
 - uses libary(blockfrost)
 - had to dig through blockfrost repo - good experience
 - retreives data from blockfrost api
 - updates main ui with results

This project will definitely grow and I plan to continue implementing additional features while acheiving personal learning goals. Below are a few next steps 
I will be adding in the coming days. 

-video demo 
-some sort of global state/config monad structure to better manage a "session"
-parsing Either JSON respones to capture balance values and generate sum for asset balances across utxos
-seperate interface and config logic better by isolating the functions and utilizing transformers

**Future**

I plan to continue this project and maybe add interactions with cardano node, cli, and other services in the ecosystem as I learn more. 

---

# Setup & run

**Setup**

After cloning repo you will need to add a file **config/blockfrosttoken** that contains your blockfrost projectid. See config/EXAMPLEblockfrosttoken for example mainnet format

Next you will want to change the list of addresses you would like to choose from in the utility. These are located in **config/walletaddress.config**

Now you can run by running **cabal run**
