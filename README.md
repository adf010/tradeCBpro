# tradeCBpr![menu](https://github.com/user-attachments/assets/4ec3af59-ee3b-43a5-b5af-449b1d9549b7)
o
Buy, Sell or Trade on Coinbase© 

![alt text](https://github.com/adf010/tradeCBpro/DOCS/menu.png?raw=true "Menu")

The script is well documented with Coinbase© links to each API call included in the script.

API KEYS
You must have an account on Coinbase© and API keys with permissions to buy, sell, etc.

Currently, only legacy API keys will work with this script. CDP keys will be added in a future release.

There are three ways to enter your keys. The first (more secure) way is to leave the key files blank and you will be prompted to enter the key and secret when you start the script. The only downside to this method is that you will need to enter the key values again if you exit and restart the script.

The second method is to press Enter at the 2 prompts mentioned above and use the Menu options to Enter/Remove your keys. You may not want to use this method on a shared computer/device.

The third method is to put the key/secret into the files named wCB-KEY1.txt/wCB-KEY2.txt respectively. Be aware that you should only use this method if you are the only one with access to the computer.

ERROR CHECKING
There is little to no error checking other than calls such as BUY/SELL where you might lose money or crypto.  So when prompted to check information you entered be sure to examine your input CLOSELY. If ever you are not sure of what to press you can always <CTRL-c>  to abort the script.  On BUY/SELL, once you say "y" or "yes" to send transaction it is too late.

DEFAULTS
If you see text at the end of a prompt such as "(ex. BTC-USD)", that is only an example of the type and syntax of what you need to enter. If you see text such as "Default= [BTC-USD]", you can press enter to accept the default or enter something else.
The script will change the case (upper or lower) automatically wherever possible so it will not matter which case you use. There are a couple exceptions where I am still trying to get that to be automatic (in arrays) so you will need to use upper or lower case to please the API server. In those cases it will say "(Must use UPPERCASE)" at the end of the prompt.

FEEDBACK
I appreciate any and all feedback. Suggestions, PR's, issues, questions, etc. are welcome. I know that some calls do not work and/or some options for some calls do not work. I am working on that :)

WHAT WORKS
List Acounts
Get Account
Best Bid/Ask (only options 1 and 2)
Product Book

Create Order (market and limit_gtc only)
Cancel Order(s)


THE FUTURE

TODO:

Change a couple v2 methods to v3.
Finish various options in all categories.
Finish DOCS
