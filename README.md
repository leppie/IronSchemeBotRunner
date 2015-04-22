# IronSchemeBotRunner

IronScheme bot template for https://github.com/EntelectChallenge

This implements the same functionality as the C# basic bot, taking random actions.

A scheme library `(space-invaders)` wraps the most useful functionality to run the bot.

Tested on VS2015 CTP 6.

# Build instructions
1. Open solution in VS
2. Build solution and allow Nuget packages to restore

# Running instructions
1. Copy everything to the `player1/player2` directory in the test harness
2. For first run or if `space-invaders.sls` is modified, run `compile.bat`
3. Run `SpaceInvadersDuel.exe`
4. Improve bot by editing your bot script, then go to step 3

# Initialization notes
1. The bot runner will initialize the `(space-invaders)` library
2. It will then load the content of the bot script (default: `basic-bot.sps`) and execute it
3. The last expression's result will be written to the `move.txt` file

# Other notes
- If you modify the bot script filename, adjust `compile.bat` to point to it
- To minimize startup speed, run `ngen install IronSchemeBotRunner.exe`
- IronScheme packages are restored from http://nuget.ironscheme.net
- You can find many more IronScheme libraries from the above Nuget source
- IronScheme documentation and notes can be found at ironscheme.codeplex.com 
- A library reflection site is available at http://ironscheme.net
- A simple web evaluator is available at http://eval.ironscheme.net

