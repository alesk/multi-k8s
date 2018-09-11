const keys = require('./keys');
const redis = require('redis');

const redisClient = redis.createClient({
    host: keys.redisHost,
    port: keys.redisPort,
    retry_strtegy: () => 1000 
});

const sub = redisClient.duplicate();

function fib(index) {
    if (index < 2) return 1;
    return fib(index -1) + fib(index -2);
}

sub.on('message', (channel, message) => {
    started_at = new Date();
    console.log('Got ' + message + 'to calculate');
    result = fib(parseInt(message));
    redisClient.hset('values', message, result);
    elapsed_time = (new Date()) - started_at;
    console.log('Calculated' + message + ' = ' + result + ' in ' + elapsed_time / 1000 +  ' s');
});

sub.subscribe('insert');
console.log('Regular exit');