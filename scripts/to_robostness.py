import glob
import pathlib
import json
import jsonlines

def convert(filename):

    cwd = pathlib.Path().absolute()
    path = pathlib.Path(filename)
    stem = path.stem
    parent = path.parent

    input_fullpath = cwd / path

    output_filename = stem + '.rbt.jsonl'
    output_parent = cwd / parent
    output_fullpath = output_parent / output_filename
    print(output_fullpath)

    output_parent.mkdir(parents=True, exist_ok=True)

    outfile = open(output_fullpath , "w")

    # Opening JSON Lines file
    with jsonlines.open(input_fullpath) as reader:

        for obj in reader:
            mod = dict()
            if 'time' in obj:
                mod['time'] = obj['time']
            if 'p' in obj and obj['p'] == True:
                mod['p'] = 1.1
            if 'p' in obj and obj['p'] == False:
                mod['p'] = -1.1
            if 'q' in obj and obj['q'] == True:
                mod['q'] = 1.1
            if 'q' in obj and obj['q'] == False:
                mod['q'] = -1.1
            if 'r' in obj and obj['r'] == True:
                mod['r'] = 1.1
            if 'r' in obj and obj['r'] == False:
                mod['r'] = -1.1
            if 's' in obj and obj['s'] == True:
                mod['z'] = 1.1
            if 's' in obj and obj['s'] == False:
                mod['z'] = -1.1

            outfile.write(json.dumps(mod) + '\n')

if __name__ == "__main__":

    traces = glob.glob('**/*.jsonl', recursive=True)

    for trace in  glob.glob('**/*.jsonl', recursive=True):
        convert(trace)
