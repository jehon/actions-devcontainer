const core = require('@actions/core');
const github = require('@actions/github');

var pid = core.getState("pidToKill");
