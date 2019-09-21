## get stock quotes

library(tseries)
library(xts)

library(BatchGetSymbols)

# set dates

first.date = "2018-04-01"
#last.date <- Sys.Date()
freq.data <- 'daily'
# set tickers
#tickers <- c('NFG','AAPL' )

stockName=c("AAPL","HD","SLP")
tickers = stockName

l.out <- BatchGetSymbols(tickers = tickers, 
                         first.date = first.date,
#                         last.date = last.date, 
                         freq.data = freq.data,
                         cache.folder = file.path(tempdir(), 
                        'BGS_Cache') ) # cache in tempdir()

head(l.out)


## stock names:


for(i in 1:3) {

plot(l.out$df.tickers$volume[l.out$df.tickers$ticker == stockName[i]],
     type='l', ylab = 'volume', xlab = 'day', main=stockName[i])
grid()

plot(l.out$df.tickers$price.close[l.out$df.tickers$ticker == stockName[i]],
     type='l', ylab = 'price $', xlab = 'day', main=stockName[i])
grid()
}

write.csv(l.out$df.tickers[l.out$df.tickers$ticker == 'SLP',],'SLP.csv')

plot(l.out$df.tickers$ref.date,l.out$df.tickers$price.close,type='l')

