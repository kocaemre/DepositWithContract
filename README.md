## DepozitWithContract

This smart contract allows users to deposit Ethereum into their accounts and query their account balances. It also enables the contract owner to transfer money from the contract.

### Usage

1. **Check Account Balance**

   You can query your account balance using the `get_Balance` function.

2. **Check Global Balance**

   Use the `get_Balance_global` function to check the total balance of the smart contract.

3. **Add Balance**

   You can add Ethereum to your account using the `add_balance` function. The function works as a payable function, so you need to send ETH to make the transaction.

4. **Money Transfer**

   Use the `transfer_to` function to transfer Ethereum from your account to another address. The function works as a payable function, and you will need a certain amount of ETH to make the transfer.

   Example Usage:

   ```solidity
   function transferTo(address payable to, uint amount) public payable {
       bool success = transfer_to(to, amount);
       require(success, "Transfer failed");
   }
### Receive Function

To directly send Ethereum to the contract, you can use the `receive` function. This function can be used to receive ETH.

### Contract Owner

The contract owner is the Ethereum account that deployed the contract,
