#!/usr/bin/env python3
"""UserPromptSubmit hook for injecting coding principles.

This hook injects coding principles (DRY, YAGNI, KISS, Pragmatic) into every user prompt
and adds a random animal emoji instruction.
"""

import json
import sys
import random

# Define the base context to inject
base_context = (
    "Unless otherwise specified: DRY, YAGNI, KISS, Pragmatic. "
    "Ask questions for clarifications. "
    "When doing a plan or research-like request, present your findings and halt for confirmation. "
    "Speak the facts, don't sugar coat statements. "
    "Your opinion matters."
)

# Animal emojis for random selection
animal_emojis = [
    "🦊", "🐻", "🐼", "🦁", "🐯", "🐨", "🐸", "🐵", "🦉", "🦅",
    "🐺", "🦝", "🦦", "🦧", "🐆", "🐘", "🦒", "🦏", "🦛", "🐪",
    "🐫", "🦙", "🦘", "🐃", "🐂", "🐄", "🐎", "🐖", "🐏", "🐑",
    "🦌", "🐕", "🐩", "🐈", "🐓", "🦃", "🦚", "🦜", "🦢", "🦩",
    "🐧", "🐦", "🐤", "🦆", "🦇", "🐗", "🐛", "🦋", "🐌", "🐞",
    "🐝", "🦗", "🦂", "🐢", "🐍", "🦎", "🦖", "🦕", "🐙", "🦑",
    "🦐", "🦞", "🦀", "🐡", "🐠", "🐟", "🐬", "🐳", "🐋", "🦈",
    "🐊", "🐅", "🐆", "🦓", "🦍", "🦧", "🐒"
]

def main():
    """Main entry point for UserPromptSubmit hook."""
    try:
        # Select random emoji
        random_emoji = random.choice(animal_emojis)

        # Combine context with emoji instruction
        context = f"{base_context} End all responses with a random animal emoji (use this one: {random_emoji})"

        # Output the hook response in correct JSON format
        response = {
            "hookSpecificOutput": {
                "hookEventName": "UserPromptSubmit",
                "additionalContext": context
            }
        }

        print(json.dumps(response))

    except Exception as e:
        # On error, output empty response (don't block)
        error_response = {
            "systemMessage": f"Coding principles hook error: {str(e)}"
        }
        print(json.dumps(error_response), file=sys.stdout)

    finally:
        # Always exit with 0 to allow the prompt to proceed
        sys.exit(0)


if __name__ == '__main__':
    main()
