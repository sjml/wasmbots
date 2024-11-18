import os
import json

from tomlkit import parse


os.chdir(os.path.dirname(os.path.abspath(__file__)))

raw_msg_toml = open("../engine/src/data/messaging.toml").read()

messages = parse(raw_msg_toml)

def get_message_data(name: str):
    for msg in messages['messages']:
        msgn = msg.get("_name")
        if msgn == name:
            return msg
    raise RuntimeError(f"No message found with name `{name}`!")

def extract_message_data(msg):
    entries = []

    for key in msg.keys():
        if (key.startswith("_")):
            continue
        entry = msg.get(key)
        comment = entry.trivia.comment
        comment = comment.removeprefix("#")
        comment = comment.strip()
        entries.append({"type": entry, "name": key, "doc": comment})

    return entries



params = get_message_data("InitialParameters")

output = {
    "version": 7,
    "sizes": {
        "byte":   1,
        "bool":   1,
        "uint16": 2,
        "int16":  2,
        "uint32": 4,
        "int32":  4,
        "uint64": 8,
        "int64":  8,
        "float":  4,
        "double": 8,
    },
    "layout": extract_message_data(params)
}

with open("../engine/src/data/gameParameters.json", "w") as outfile:
    json.dump(output, outfile, indent=2)


circs = get_message_data("PresentCircumstances")
with open("../engine/src/data/circumstances.json", "w") as outfile:
    json.dump(extract_message_data(circs), outfile, indent=2)

