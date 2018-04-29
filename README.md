# Boggle Game demo on Rails+React


## Things not covered in this 
  
 - Designed to be serve single user
 - 4 x 4 as default
  

## How to excute

```
ubuntu 16.0
node -v 6.9.0
rails -v 5.1.4
ruby -v 2.4.1p111
```

1. Link : http://35.231.108.31:3000/ (running on GoogleCloud / f1-micro (1 vCPU, 0.6 GB memory) very low spec)

or

Install guideline
```
git clone https://github.com/tk0221/boggle_on_RR
cd boggle_on_RR
gem install bundler
bundle
rails s
```

## Testcase

Test case for GameData is [`game_data_spec`](https://github.com/tk0221/boggle_on_RR/blob/master/spec/game_data_spec.rb)
Explain about searching a word on board [`verify_guess`](https://repl.it/@tk0221/boggleWordSearch)
