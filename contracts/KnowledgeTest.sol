//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    /// @notice Set contract's owner
    constructor() {
        owner = msg.sender;
    }

    /// @notice Changes firs token to VET
    function changeTokens() external{
        string[] storage t = tokens;
        t[0] = "VET";
    }

    /// @notice Receive payments
    receive () external payable {
    }

    /// @notice Returns balance of the contract
    function getBalance () public view returns (uint){
        return address(this).balance;
    }

    /// @notice Transfer total balance to _address
    function transferAll(address payable _address) external {
        require(msg.sender == owner, "ONLY_OWNER");
        (bool result, ) = _address.call{value: getBalance()}("");
        require(result, "TX_FAILED");
    }
    
    /// @notice Adds caller address to players
    function start() external {
        players.push(msg.sender);
    }

    /// @notice Adds caller address to players
    function concatenate(string memory str1, string memory str2) external pure returns(string memory) {
        return string(abi.encodePacked(str1, str2));
    }
}
