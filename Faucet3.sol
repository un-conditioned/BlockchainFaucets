
pragma solidity ^0.6.4;


contract Faucet {
    address payable owner;

    // Contract constructor: set owner
    constructor() public {
        owner = msg.sender;
    }

    // Accept any incoming amount
    receive() external payable {}

    // Contract destructor
    function destroy() public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public {
        // Limit withdrawal amount
        require(withdraw_amount <= 0.1 ether);

        // Send the amount to the address that requested it
        msg.sender.transfer(withdraw_amount);
    }
}
