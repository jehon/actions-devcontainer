#!/usr/bin/env node

import { spawnSync } from 'node:child_process';
import path from 'path';

import core from '@actions/core';
// import github from '@actions/github';
import { actionPath, StateIsStarted, InputRun, InputAction } from './consts.js';

function runDevContainer(command, args = []) {
    // https://nodejs.org/api/child_process.html#child_processspawnsynccommand-args-options
    const result = spawnSync(path.join(actionPath, 'node_modules', '.bin', 'devcontainer'), 
        [ command, ...args ], 
        { stdio: 'inherit' }
    );
    
    if (result.error) {
        console.error("Running give an error", { result });
        throw  result.error;
    }

    if (result.status > 0) {
        console.error("Running give an exit code", { result });
        throw `DevContainer ${command} failed (${args.join(',')})`;
    }
}

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

            runDevContainer('-h');

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
