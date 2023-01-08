const core = require('@actions/core');
const github = require('@actions/github');

try {
    //
    // input:
    // - action => "run" or skip
    // - run: shell to run
    //
    // output:
    // - container (name)
    //

    const nameToGreet = core.getInput('run');
    console.log(`Hello ${nameToGreet}!`);

    core.setOutput("container", 'blablabla');

    // Get the JSON webhook payload for the event that triggered the workflow
    const payload = JSON.stringify(github.context.payload, undefined, 2)
    console.log(`The event payload: ${payload}`);

    // core.saveState("pidToKill", 12345);
    // var pid = core.getState("pidToKill");

} catch (error) {
    core.setFailed(error.message);
}
