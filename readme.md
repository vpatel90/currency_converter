#Currency Converter

This project contains a currency converter with 4 classes

##Currency
The Currency class will create currency objects with 2 attributes. Amount and Currency code (exampe: 20, USD)

It's been customised to be able to add, subtract and multiply currencies of the same code

It can also take either 1 or two attribtues
`Currency.new($20)` `Currency.new(20, "USD")` and `Currency.new($20, "USD")` are all valid

##Currency Converter
The converter object will take a hash containing various currency types and their market values

There is a convert method in this object that takes a Currency object and a different currency code, then returns a new Currency object with the new code

##Currency Trader
This object takes a starting currency and multiple Currency Converter objects

Assuming the Currency Converter objects were arranged appropriately in the array the Currency Trader will calculate the best way to trade the starting currency in order to maximize profits

There is also a supplimental TradeNode class, which keeps track of every transaction that the currency trader makes