// Run: node etc/pi/strip-cd.check.ts
import { strip } from "../../home/.pi/agent/extensions/strip-cd.ts";

const cwd = "/x";
const cases: [string, string][] = [
	["cd /x && echo a", "echo a"],
	["cd /x; echo a", "echo a"],
	["cd /x ; echo a", "echo a"],
	['cd "/x" && echo a', "echo a"],
	["cd /other && echo a", "cd /other && echo a"],
	["echo a; cd /x", "echo a; cd /x"],
];

for (const [input, want] of cases) {
	const got = strip(input, cwd);
	if (got !== want) throw new Error(`strip(${JSON.stringify(input)}) = ${JSON.stringify(got)}, want ${JSON.stringify(want)}`);
	console.log(`ok  ${JSON.stringify(input)} -> ${JSON.stringify(got)}`);
}
