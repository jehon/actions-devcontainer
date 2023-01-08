
const core = require('@actions/core');
const github = require('@actions/github');
const { StateIsStarted, InputRun, InputAction } = require('./consts');

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

    console.log(core.getSate(StateIsStarted))

    const action = core.getInput(InputAction);

    switch(action) {
        case 'start':
            console.log("Starting devcontainer");

            // core.setOutput("container", 'blablabla');

            core.setState(StateIsStarted, true);
            break;

            case 'stop':
            console.log("Stopping devcontainer");
            core.warn('Stopping is not implemented');
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
