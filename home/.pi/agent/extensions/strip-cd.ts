import { realpathSync } from "node:fs";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

// Models anchor every command with `cd <cwd> && …` (or `cd <cwd>; …`, or a
// newline-terminated `cd <cwd>` line) although each bash call already starts in cwd.
// Strip that prefix, both before the command runs and from the finalized assistant
// message, so the timeline shows the command itself.
const real = (p: string) => {
	try {
		return realpathSync(p);
	} catch {
		return p;
	}
};

export function strip(command: string, cwd: string): string {
	const m = /^\s*cd\s+(?:"([^"]+)"|'([^']+)'|([^\s;]+))[ \t]*(?:(?:&&|;)\s*|\r?\n)[ \t]*/.exec(command);
	if (!m) return command;
	const target = (m[1] ?? m[2] ?? m[3]).replace(/^~(?=\/|$)/, process.env.HOME ?? "~");
	const rest = command.slice(m[0].length);
	// keep the cd when nothing follows it
	return real(target) === real(cwd) && rest.trim() ? rest : command;
}

export default function stripCd(pi: ExtensionAPI) {
	pi.on("tool_call", async (event: any, ctx: any) => {
		if (event.toolName !== "bash" || typeof event.input?.command !== "string") return;
		event.input.command = strip(event.input.command, ctx.cwd ?? process.cwd());
	});
	pi.on("message_end", async (event: any, ctx: any) => {
		const msg = event.message;
		if (msg?.role !== "assistant" || !Array.isArray(msg.content)) return;
		let changed = false;
		for (const part of msg.content) {
			if (part?.type !== "toolCall" || part.name !== "bash" || typeof part.arguments?.command !== "string") continue;
			const next = strip(part.arguments.command, ctx.cwd ?? process.cwd());
			if (next !== part.arguments.command) {
				part.arguments.command = next;
				changed = true;
			}
		}
		if (changed) return { message: msg };
	});
}
