
import { fileURLToPath } from 'url';
import { dirname } from 'path';

export const actionPath = dirname(fileURLToPath(import.meta.url));

export const StateIsStarted = "isStarted";

export const InputAction = "action";
export const InputRun = "run";
