#!/usr/bin/env node

import { spawnSync } from 'node:child_process';
import path from 'path';

import core from '@actions/core';
// import github from '@actions/github';
import { actionPath, StateIsStarted, InputRun, InputAction } from './consts.js';

function runDevContainer(command, ...args) {
    // https://nodejs.org/api/child_process.html#child_processspawnsynccommand-args-options
    const result = spawnSync(path.join(actionPath, 'node_modules', '.bin', 'devcontainer'), 
        [ command,
            '--workspace-folder', '.',
            ...args
        ], 
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

    const action = process.argv.length > 2
        ? process.argv[2]
        : core.getInput(InputAction)

    console.log(`Action: ${action}`, process.argv);

    switch(action) {
        case 'start':
            if (core.getState(StateIsStarted)) {
                core.warning("Container started multiple times");
            } else {
                runDevContainer('up');
            }

            core.saveState(StateIsStarted, true);
            break;

        case 'stop':
            console.log("Stopping devcontainer");
            core.warning('Stopping is not implemented');
            break;
                
        case 'run':
        case '':
            if (!core.getState(StateIsStarted)) {
                core.error('Devcontainer was not started');
            }
            const run = process.argv.length > 3
                ? process.argv[3]
                : core.getInput(InputRun)
    
            console.log(`Running ${run}`);
            runDevContainer('exec', 'bash', '-c', run);
            break;
        
        default:
            core.error(`Unknown command: ${action}`);
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
