#!/usr/bin/env node

import core from '@actions/core';
// import github from '@actions/github';
import { StateIsStarted, InputRun, InputAction } from './consts.js';

try {
    //
    // input:
    // - action => "run" or skip
    // - run: shell to run
    //
    // output:
    // - container (name)
    //
    // state:
    // - isStarted (boolean)

    const action = core.getInput(InputAction);

    switch(action) {
        case 'start':
            console.log("Starting devcontainer");

            // core.setOutput("container", 'blablabla');

            core.saveState(StateIsStarted, true);
            break;

            case 'stop':
            console.log("Stopping devcontainer");
            core.warning('Stopping is not implemented');
            break;
                
        case '':
            if (!core.getState(StateIsStarted)) {
                core.error('Devcontainer was not started');
            }
            const run = core.getInput(InputRun);
            console.log("Running");
            break;
    }

    // const nameToGreet = core.getInput('run');
    // console.log(`Hello ${nameToGreet}!`);


    // // Get the JSON webhook payload for the event that triggered the workflow
    // const payload = JSON.stringify(github.context.payload, undefined, 2)
    // console.log(`The event payload: ${payload}`);

} catch (error) {
    core.setFailed(error.message);
}
