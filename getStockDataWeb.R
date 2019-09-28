## get stock quotes

library(tseries)
library(xts)

library(BatchGetSymbols)

# set dates
first.date <- Sys.Date() - 550
last.date <- Sys.Date()
freq.data <- 'daily'
# set tickers
tickers <- c('NFLX','HD' )

l.out <- BatchGetSymbols(tickers = tickers, 
                         first.date = first.date,
                         last.date = last.date, 
                         freq.data = freq.data,
                         cache.folder = file.path(tempdir(), 
                        'BGS_Cache') ) # cache in tempdir()

head(l.out)


## stock names:
plot(l.out$df.tickers$volume[l.out$df.tickers$ticker == tickers[1]]/1.e5,type='l',
     ylab = 'volume (10000s)', xlab = 'day', main=tickers[1])
grid()

plot(l.out$df.tickers$price.close[l.out$df.tickers$ticker == tickers[1]],
     type='l', ylab = 'price $', xlab = 'day', main=tickers[1])
grid()


plot(l.out$df.tickers$volume[l.out$df.tickers$ticker == tickers[2]]/1.e5,type='l',
     ylab = 'volume (10000s)', xlab = 'day', main=tickers[2])
grid()

plot(l.out$df.tickers$price.close[l.out$df.tickers$ticker == tickers[2]],
     type='l', ylab = 'price $', xlab = 'day', main=tickers[2])
grid()


#write.csv(l.out$df.tickers,'NFLX.csv')


