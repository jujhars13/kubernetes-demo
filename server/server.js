"use strict";

const projectName = 'Kubernetes Demo';

const express = require('express');
const helmet = require('helmet'); //express hardening middleware
const logger=require('winston'); //normal logger
const handlebars = require('consolidate').handlebars; //loads of templating engines in one

/**
 * setup express
 */
let app = express();
(function () {
    //app.use(morgan());
    app.set('trust proxy', 1); // trust first proxy
    app.use(express.static('public')); //serve static assets
    app.engine('html', handlebars); // assign the consolidate handlebars engine to .html files
    app.set('view engine', 'html');     // set .ht  ml as the default extension for templates
    app.set('views', __dirname + '/views');
    app.use(helmet()); //express hardening
    app.disable('x-powered-by'); //hide node version in headers
})();


/**
 * first time a person hits the application
 */
app.get('/', (req, res) => {
    res.json({sat: 'naams'});
});

/**
 * status route
 * used by load balancer for status check
 */
app.get('/status', (req, res) => {
    res.json({status: 'ok'});
});


/**
 * redirect all other url requests not in public dir and not defined above to our react app
 */
app.get('*', function (req, res) {
    res.sendFile(path.resolve(__dirname, 'public/index.html'));
});


/**
 * global error handling
 * TODO improve
 */
app.use(function (err, req, res, next) {
    if (!err) {
        err = new Error('General error');
        err.errorCode = 500;
    }
    let randomId = uuid.v4();

    logger.error('global express error', err, {randomId: randomId});
    let msg = {error: "there was an error", errorId: randomId};
    if (process.env.NODE_ENV === 'development' || process.env.NODE_ENV === 'staging') {
        msg = {error: err.toString(), errorId: randomId};
    }

    res.status(500).json(msg);
});


app.listen(process.env.NODE_PORT, () => {

    logger.info('***' + projectName +
        ' running in ' + process.env.NODE_ENV.toUpperCase() + ' on Node ' + process.version + '***');
    logger.info(projectName + ' listening on port', process.env.NODE_PORT);
});

