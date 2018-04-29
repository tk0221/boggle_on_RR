# Boggle Game demo on Rails+React
![demo](https://lh3.googleusercontent.com/RdrEQCtLq6l0AOX4Y3i8IYSxXrfqgeNyScyZ9Z-0ZrEeckt-P2WRvZPSYAifo-aaelCXghOq3kHhJH7t5AxZ9_M5b2tNqADPeVhuweRp6f30EcZR8-je8FSreB78HA0mXFuV3mRXU1lwSJeSI12u2gSdkPpZ0QsHcCLKg5xi2xfY_FbsnyQItvCr5kOX4lDSMN94p7gJPrHr1Y-Ao32vaIRJcIStS0LnMxZ5bAjptNcWaAho5TL26ve8JDyFWp9YwzYs6a92AKL9Kxl6fqhZ6P0TlmjJ7hwN0XFVi2XdnWIReKPRrDv4rwh7gCESO0rBxTxKmJqe4oNjS8beDMsfHwKhYqGDYfefdPL5PIh0Aozx2jPxKsjuHFZMpZyLb3ZpFCYwSmeXB5Rt7NzAsXDWRFSccXhD_gZ_A3kCX6gr7Q8XdcOFOdvR-KjoSaxk9Qg6I_wwMSQ76ipEJyBp2XpvpWS0PiXpikI2oOAAZ_EffV-yHkM41dE35WSUJRYZeXD0EdsX_SwgYPRwuFbonexvWpoKwqxo8b4xzCXu5js9GJQSbwb6-0ic3FoQjeQbdVvkBtZLsiBQ9pAzV91DDdgkUtcvIP2v_YB4vXHeCSkH=w282-h499-no)
## Shortcut
[`Demo on Cloud`](http://35.231.108.31:3000/)

[`Algorithm`](https://repl.it/@tk0221/boggleWordSearch)
[`ErrorMsgTypes`](https://github.com/tk0221/boggle_on_RR/blob/master/lib/GameData.rb#L37)
[`AjaxCallToBackend`](https://github.com/tk0221/boggle_on_RR/blob/master/app/javascript/components/Guess.js#L28)
[`CheckingGuessword With Oxford Dict API`](https://github.com/tk0221/boggle_on_RR/blob/master/lib/GameData.rb#L98)
[`Score`](https://github.com/tk0221/boggle_on_RR/blob/master/lib/GameData.rb#L118)
[`RandomBoardGen`](https://github.com/tk0221/boggle_on_RR/blob/master/lib/GameData.rb#L140)
[`GameDataSpecTest`](https://github.com/tk0221/boggle_on_RR/blob/master/spec/game_data_spec.rb)

## Goal

- Generate a random 4 x 4 boggle board
- Browser client displays board
- Client has a text input & sends requests to server
- Server responds affirmatively if text input is present on board, negatively if not
- Must use React for front end client application and Rails for backend server application
- Extra Credit, not required: Check to see if the text input is actually a word against a dictionary

## Things NOT covered in this repo
 
 - Fancy animation effects
 - Designed to serve one single user
 - 4 x 4 as default  

## How to excute

```
ubuntu 16.0
node -v 6.9.0
rails -v 5.1.4
ruby -v 2.4.1p111
```

Link : http://35.231.108.31:3000/ (running on GoogleCloud / f1-micro (1 vCPU, 0.6 GB memory) very low spec)

or

Install guideline
```
git clone https://github.com/tk0221/boggle_on_RR
cd boggle_on_RR
gem install bundler
bundle
rails s
```

## Algorithm for searching 
Explain about searching a word on board [`verify_guess`](https://repl.it/@tk0221/boggleWordSearch)

```
A B D E    [0,0] [0,1] [0,2] [0,3]   for 'FAN'      F : [1,3]
X K A F => [1,0] [1,1] [1,2] [1,3] ==============>  A : [0,0], [1,2] 
M D N C    [2,0] [2,1] [2,2] [2,3]                  N : [2,3]                   
O M U I    [3,0] [3,1] [3,2] [3,3]  

 => paths = [[1,3]->[0,0]->[2,3]] or [[1,3]->[1,2]->[2,3]]
 path_check([1,3]->[0,0]->[2,3]) return false
 path_check([1,3]->[1,2]->[2,3]) return true because each coordinates are adjacency coordinate
```

## Input process & Error Handling

`input: word(i.e. "apple" or "notAWord")`

First check word is valid as string, like whether contain ` ` or `""`. 

Next check word is already in `@found={"apple":3}`. If so handle by alert with error message.

Then check word can be exist in board with algorithm explained above. 

Finally check with dictionary by API call to [`oxforddictionaries`](https://developer.oxforddictionaries.com/) and add to hash depends on API call result

```
Alert error messages
   "Invalid Input : Input not found"
   "Invalid Input : Input contain whitespace."
   "Input is already in answers."
   "Invalid Input : Max Input is 16 chars."      
   "Invalid Input : Input cant found in the board."
   "Invalid Input : Not found in dictionary."
```
## Testcase

Test case for GameData is [`game_data_spec`](https://github.com/tk0221/boggle_on_RR/blob/master/spec/game_data_spec.rb)
