// SPDX-License-Identifier: MIT
pragma solidity ^0.8.33;

import "forge-std/Test.sol";
import "./MyToken.sol";

contract MyTokenTest is Test {
    MyToken public token;
    address public owner;
    address public user1;
    address public user2;

    function setUp() public {
        owner = address(this);
        user1 = address(0x1);
        user2 = address(0x2);

        token = new MyToken(1000000);
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1000000 * 10**18);
        assertEq(token.balanceOf(owner), 1000000 * 10**18);
    }

    function testTransfer() public {
        uint256 amount = 100 * 10**18;
        token.transfer(user1, amount);

        assertEq(token.balanceOf(user1), amount);
        assertEq(token.balanceOf(owner), (1000000 * 10**18) - amount);
    }

    function test_Revert_WhenTransferInsufficientBalance() public {
        vm.prank(user1);
        vm.expectRevert();
        token.transfer(user2, 1 * 10**18);
    }
}
